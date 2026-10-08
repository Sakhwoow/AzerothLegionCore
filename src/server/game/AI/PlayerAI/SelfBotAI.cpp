/*
 * This file is part of the DestinyCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "SelfBotAI.h"
#include "BotAITool.h"
#include "Player.h"
#include "Item.h"
#include "Spell.h"
#include "MotionMaster.h"
#include "Log.h"

namespace
{
	uint32 const SELFBOT_ACTION_INTERVAL = 500;

	// Same WotLK-era level-bracket potion item IDs BotAIUsePotion uses (BotAITool.cpp), kept as
	// a separate local copy on purpose: unlike BotAIUsePotion, SelfBotAI must never conjure a
	// potion the player doesn't already own, so it only ever reads this list to pick WHICH
	// entry id to look for in the player's own bags - never to create one.
	struct SelfPotionEntry
	{
		uint32 level;
		uint32 itemEntry;
	};

	SelfPotionEntry const LifePotions[] =
	{
		{ 70, 33447 }, { 55, 22829 }, { 45, 13446 }, { 35, 3928 },
		{ 21, 1710 }, { 12, 929 }, { 3, 858 }, { 1, 118 }
	};

	SelfPotionEntry const ManaPotions[] =
	{
		{ 70, 33448 }, { 55, 22832 }, { 49, 13444 }, { 41, 13443 },
		{ 31, 6149 }, { 22, 3827 }, { 14, 3385 }, { 5, 2455 }
	};
}

SelfBotAI::SelfBotAI(Player* self) :
me(self),
m_Active(false),
m_NeedMana(true),
m_ActionTick(0)
{
	uint8 cls = me ? me->getClass() : 0;
	if (cls == 1 || cls == 4) // Warrior, Rogue: no mana resource
		m_NeedMana = false;
}

namespace
{
	// Standard, long-stable Classic/WotLK-era base spell ids (rank 1), ordered highest-priority
	// first - the same shape as mod-playerbots' per-class NextAction priority list (see e.g.
	// DpsPaladinStrategy.cpp: hammer of wrath > judgement of wisdom > crusader strike >
	// divine storm > consecration > melee), just expressed as a plain array instead of their
	// Strategy/Action engine. Picked deliberately NOT from BotAISpells.h's per-spec tables
	// (those target full endgame rotations for provisioned bots); FindMaxRankSpellByExist
	// resolves each to whatever rank this specific character actually knows, so a low-level
	// character simply ends up with a shorter resolved list (down to empty - plain melee
	// auto-attack from Phase 1 is always the fallback) rather than an error.
	std::vector<uint32> const& GetClassRotationBaseSpells(uint8 cls)
	{
		static std::vector<uint32> const warrior = { 772, 78, 6343, 1715 };            // Rend, Heroic Strike, Thunder Clap, Hamstring
		static std::vector<uint32> const paladin = { 24275, 20271, 35395, 21084, 26573 }; // Hammer of Wrath, Judgement, Crusader Strike, Seal of Righteousness, Consecration
		static std::vector<uint32> const hunter = { 3044, 1978, 5116 };                // Arcane Shot, Serpent Sting, Concussive Shot
		static std::vector<uint32> const rogue = { 1752, 2098 };                       // Sinister Strike, Eviscerate
		static std::vector<uint32> const priest = { 585, 8092, 589, 14914 };           // Smite, Mind Blast, Shadow Word: Pain, Holy Fire
		static std::vector<uint32> const deathKnight = { 45462, 45477, 47541 };        // Plague Strike, Icy Touch, Death Coil
		static std::vector<uint32> const shaman = { 403, 8050, 8042 };                 // Lightning Bolt, Flame Shock, Earth Shock
		static std::vector<uint32> const mage = { 133, 116, 2136 };                    // Fireball, Frostbolt, Fire Blast
		static std::vector<uint32> const warlock = { 686, 172, 348 };                  // Shadow Bolt, Corruption, Immolate
		static std::vector<uint32> const druid = { 5176, 8921 };                       // Wrath, Moonfire
		static std::vector<uint32> const none;

		switch (cls)
		{
		case 1: return warrior;
		case 2: return paladin;
		case 3: return hunter;
		case 4: return rogue;
		case 5: return priest;
		case 6: return deathKnight;
		case 7: return shaman;
		case 8: return mage;
		case 9: return warlock;
		case 11: return druid;
		default: return none;
		}
	}
}

void SelfBotAI::SetActive(bool active)
{
	if (m_Active == active)
		return;
	m_Active = active;

	m_RotationSpells.clear();
	if (active)
	{
		for (uint32 baseId : GetClassRotationBaseSpells(me->getClass()))
		{
			uint32 known = BotUtility::FindMaxRankSpellByExist(me, baseId);
			if (known)
				m_RotationSpells.push_back(known);
		}
	}

	if (BotUtility::SelfBotDebug)
	{
		std::string knownList;
		for (uint32 id : m_RotationSpells)
			knownList += std::to_string(id) + " ";
		TC_LOG_INFO("server.loading", ">> SelfBot: %s (%s) %s (rotation: %s)", me->GetName().c_str(), me->GetGUID().ToString().c_str(),
			active ? "enabled" : "disabled", knownList.empty() ? "none" : knownList.c_str());
	}
}

bool SelfBotAI::CanAct() const
{
	if (!me->IsAlive())
		return false;
	if (me->HasUnitState(UNIT_STATE_CASTING))
		return false;
	if (me->IsNonMeleeSpellCast(false))
		return false;
	return true;
}

void SelfBotAI::Update(uint32 diff)
{
	if (!m_Active)
		return;

	if (m_ActionTick > diff)
	{
		m_ActionTick -= diff;
		return;
	}
	m_ActionTick = SELFBOT_ACTION_INTERVAL;

	if (!CanAct())
		return;

	UpdateCombat();
	TryUseSelfPotion();
}

void SelfBotAI::UpdateCombat()
{
	Unit* victim = me->GetVictim();
	if (!victim || !victim->IsAlive())
	{
		// Still never go looking for a fight on our own - only continue what the real client
		// already selected, or fight back if something is already attacking us (that's not
		// "picking a target", it's not standing there and eating hits).
		Unit* selected = me->GetSelectedUnit();
		bool selectedValid = selected && selected->IsAlive() && me->IsValidAttackTarget(selected);
		if (selectedValid)
			victim = selected;
		else if (!me->getAttackers().empty())
		{
			Unit* attacker = *me->getAttackers().begin();
			if (attacker && attacker->IsAlive())
				victim = attacker;
		}

		if (BotUtility::SelfBotDebug)
			TC_LOG_INFO("server.loading", ">> SelfBot: %s no victim - selected=%s valid=%d attackers=%u -> victim=%s",
				me->GetName().c_str(), selected ? selected->GetName().c_str() : "none", selectedValid,
				uint32(me->getAttackers().size()), victim ? victim->GetName().c_str() : "none");

		if (!victim)
			return;

		me->Attack(victim, true);
	}

	// Walk into range if needed. MoveChase is the same engine-native primitive creature AI
	// uses for this everywhere else in the core, called unconditionally every time - confirmed
	// against mod-playerbots' own MovementActions.cpp::ChaseTo, which has no "skip if already
	// chasing" guard either. An earlier version here DID skip re-issuing when the current
	// motion type was already CHASE_MOTION_TYPE, meant as an optimization - but that type check
	// doesn't verify WHICH target the existing chase generator is for, so after killing one
	// target and picking up a new one, the stale chase (still type CHASE_MOTION_TYPE, aimed at
	// the dead target) silently blocked ever moving toward the new one. Always re-issuing is
	// what the reference implementation does and is the correct fix, not just the simplest one.
	uint32 motionType = me->GetMotionMaster()->GetCurrentMovementGeneratorType();
	me->GetMotionMaster()->MoveChase(victim);

	if (BotUtility::SelfBotDebug)
		TC_LOG_INFO("server.loading", ">> SelfBot: %s combat victim=%s dist=%.1f motionType=%u",
			me->GetName().c_str(), victim->GetName().c_str(), me->GetDistance(victim), motionType);

	TryUseRotationSpell(victim);
}

void SelfBotAI::TryUseRotationSpell(Unit* target)
{
	if (!target)
		return;

	// Try each known spell in priority order, same shape as mod-playerbots' per-class
	// NextAction chain. CastSpell(..., triggered=false) enforces GCD/range/cost/cooldown
	// exactly like a manual keypress, so an attempt that can't go through yet (still on
	// cooldown, out of range/mana) is a silent no-op and we just move on to the next
	// candidate - never a forced or duplicate cast. If none succeed, plain melee auto-attack
	// from Phase 1 keeps going on its own.
	for (uint32 spellId : m_RotationSpells)
	{
		bool ok = me->CastSpell(target, spellId, false);
		if (BotUtility::SelfBotDebug)
			TC_LOG_INFO("server.loading", ">> SelfBot: %s cast %u -> %s", me->GetName().c_str(), spellId, ok ? "ok" : "failed");
		if (ok)
			return;
	}
}

void SelfBotAI::TryUseSelfPotion()
{
	if (me->IsMounted())
		return;

	if (!m_NeedMana)
	{
		if (me->GetHealthPct() < 30.0f)
		{
			if (Item* pItem = FindOwnedLifePotion())
			{
				SpellCastTargets targets;
				targets.SetTargetMask(0);
				int32 dummyMisc[2] = { 0, 0 };
				SpellCastResult result = me->CastItemUseSpell(pItem, targets, ObjectGuid::Empty, dummyMisc);
				if (BotUtility::SelfBotDebug && result != SPELL_CAST_OK)
					TC_LOG_INFO("server.loading", ">> SelfBot: %s life potion cast failed (%u)", me->GetName().c_str(), uint32(result));
			}
		}
		return;
	}

	float manaPct = me->GetMaxPower(POWER_MANA) > 0 ? (float(me->GetPower(POWER_MANA)) / float(me->GetMaxPower(POWER_MANA))) * 100.0f : 100.0f;
	if (me->GetHealthPct() < 30.0f)
	{
		if (Item* pItem = FindOwnedLifePotion())
		{
			SpellCastTargets targets;
			targets.SetTargetMask(0);
			int32 dummyMisc[2] = { 0, 0 };
			me->CastItemUseSpell(pItem, targets, ObjectGuid::Empty, dummyMisc);
		}
	}
	else if (manaPct < 20.0f)
	{
		if (Item* pItem = FindOwnedManaPotion())
		{
			SpellCastTargets targets;
			targets.SetTargetMask(0);
			int32 dummyMisc[2] = { 0, 0 };
			me->CastItemUseSpell(pItem, targets, ObjectGuid::Empty, dummyMisc);
		}
	}
}

Item* SelfBotAI::FindOwnedLifePotion() const
{
	uint32 level = me->getLevel();
	for (SelfPotionEntry const& info : LifePotions)
	{
		if (info.level > level)
			continue;
		if (Item* pItem = BotUtility::FindItemFromAllBag(me, info.itemEntry))
			return pItem;
	}
	return nullptr;
}

Item* SelfBotAI::FindOwnedManaPotion() const
{
	uint32 level = me->getLevel();
	for (SelfPotionEntry const& info : ManaPotions)
	{
		if (info.level > level)
			continue;
		if (Item* pItem = BotUtility::FindItemFromAllBag(me, info.itemEntry))
			return pItem;
	}
	return nullptr;
}
