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
#include "Group.h"
#include "Item.h"
#include "Spell.h"
#include "SpellMgr.h"
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

	// Phase 3 (self-healing): only the 4 hybrid classes that can heal at all. Base rank-1 ids
	// for each class's oldest, most structurally stable direct-heal spell - chosen the same way
	// as the rotation lists above (long-lived classic/WotLK-era ids, resolved through whatever
	// rank this character actually knows via FindMaxRankSpellByExist). Confidence varies: the
	// Paladin entry (Flash of Light, 19750) is CONFIRMED valid for this fork - it showed up
	// directly in a live level-6 test character's own known-spell list. The Priest/Druid/Shaman
	// entries follow the identical convention but are NOT yet verified against a live character
	// of those classes on this fork the way Judgement/Crusader Strike/Flash of Light were -
	// first real test should confirm whether they resolve to anything before trusting them.
	std::vector<uint32> const& GetClassHealBaseSpells(uint8 cls)
	{
		static std::vector<uint32> const priest = { 2061, 2060, 139 };  // Flash Heal, Heal, Renew
		static std::vector<uint32> const druid = { 5185, 8936, 774 };   // Healing Touch, Regrowth, Rejuvenation
		static std::vector<uint32> const shaman = { 331, 8004 };        // Healing Wave, Lesser Healing Wave
		static std::vector<uint32> const paladin = { 19750 };           // Flash of Light - confirmed known id on this fork
		static std::vector<uint32> const none;

		switch (cls)
		{
		case 2: return paladin;
		case 5: return priest;
		case 7: return shaman;
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
	m_HealSpells.clear();
	if (active)
	{
		for (uint32 baseId : GetClassRotationBaseSpells(me->getClass()))
		{
			uint32 known = BotUtility::FindMaxRankSpellByExist(me, baseId);
			if (known)
				m_RotationSpells.push_back(known);
		}
		for (uint32 baseId : GetClassHealBaseSpells(me->getClass()))
		{
			uint32 known = BotUtility::FindMaxRankSpellByExist(me, baseId);
			if (known)
				m_HealSpells.push_back(known);
		}
	}

	if (BotUtility::SelfBotDebug)
	{
		std::string knownList;
		for (uint32 id : m_RotationSpells)
			knownList += std::to_string(id) + " ";
		std::string healList;
		for (uint32 id : m_HealSpells)
			healList += std::to_string(id) + " ";
		TC_LOG_INFO("server.loading", ">> SelfBot: %s (%s) %s (rotation: %s) (heal: %s)", me->GetName().c_str(), me->GetGUID().ToString().c_str(),
			active ? "enabled" : "disabled", knownList.empty() ? "none" : knownList.c_str(), healList.empty() ? "none" : healList.c_str());
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

	// Heal check runs before the attack rotation and, if it actually casts something, skips
	// combat for this tick - both share the GCD, so trying to also attack-cast the same tick
	// would just fail harmlessly anyway, but skipping is cleaner and avoids a wasted log line.
	if (!TryUseHealSpell())
		UpdateCombat();

	TryUseSelfPotion();
}

bool SelfBotAI::TryUseHealSpell()
{
	if (m_HealSpells.empty())
		return false;

	// Phase 3 scope: only while in a real group - no solo behavior change (plan:
	// "gated so it only acts within an existing group").
	Group* group = me->GetGroup();
	if (!group)
		return false;

	Unit* lowestAlly = nullptr;
	float lowestPct = 90.0f; // only bother healing below this - "maintenance", not full triage

	for (GroupReference* itr = group->GetFirstMember(); itr != nullptr; itr = itr->next())
	{
		Player* member = itr->GetSource();
		if (!member || !member->IsAlive())
			continue;
		if (member != me && (member->GetMap() != me->GetMap() || !me->IsWithinDist(member, 40.0f)))
			continue;

		float pct = member->GetHealthPct();
		if (pct < lowestPct)
		{
			lowestPct = pct;
			lowestAlly = member;
		}
	}

	if (!lowestAlly)
		return false;

	bool cast = TryCastFirstKnown(lowestAlly, m_HealSpells);
	if (BotUtility::SelfBotDebug)
		TC_LOG_INFO("server.loading", ">> SelfBot: %s heal check target=%s pct=%.1f -> %s",
			me->GetName().c_str(), lowestAlly->GetName().c_str(), lowestPct, cast ? "cast" : "none");
	return cast;
}

Unit* SelfBotAI::FindGroupAssistTarget() const
{
	Group* group = me->GetGroup();
	if (!group)
		return nullptr;

	for (GroupReference* itr = group->GetFirstMember(); itr != nullptr; itr = itr->next())
	{
		Player* member = itr->GetSource();
		if (!member || member == me || !member->IsAlive() || member->GetMap() != me->GetMap())
			continue;

		Unit* memberVictim = member->GetVictim();
		if (memberVictim && memberVictim->IsAlive() && me->IsValidAttackTarget(memberVictim) && me->IsWithinDist(memberVictim, 60.0f))
			return memberVictim;
	}
	return nullptr;
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
		else
		{
			// Phase 4 (group assist): lowest priority of all three - only kicks in once the
			// player has neither selected anything themselves nor is being attacked. Adopts
			// whatever a group member is already fighting, same "continue, never pick on your
			// own" spirit as the other two fallbacks above.
			victim = FindGroupAssistTarget();
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

	TryCastFirstKnown(target, m_RotationSpells);
}

bool SelfBotAI::TryCastFirstKnown(Unit* target, std::vector<uint32> const& spellList)
{
	if (!target)
		return false;

	// Try each known spell in priority order, same shape as mod-playerbots' per-class
	// NextAction chain. Deliberately NOT using Unit::CastSpell(...)'s bool-returning overload:
	// it just does `return spell->prepare(&targets, triggeredByAura);`, implicitly converting
	// the real SpellCastResult to bool - and SPELL_CAST_OK is 0, so a SUCCESSFUL cast comes
	// back as false and an actual FAILURE (still on cooldown, out of range, etc.) comes back
	// as true. Confirmed by instrumenting a live fight: Judgement (on its real cooldown) logged
	// as "ok" on almost every 500ms tick while it was actually failing and blocking, and the
	// one time it genuinely went off logged as "failed", which was then (wrongly, per the old
	// inverted check) treated as a reason to keep falling through to the next spell. Every
	// existing bot in this codebase avoids this by building the Spell and checking the real
	// SpellCastResult explicitly (see BotBGAI::TryCastSpell, BotAI.cpp) - do the same here.
	for (uint32 spellId : spellList)
	{
		SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(spellId);
		if (!spellInfo)
			continue;

		Spell* spell = new Spell(me, spellInfo, TriggerCastFlags::TRIGGERED_NONE, ObjectGuid::Empty);
		SpellCastTargets targets;
		targets.SetUnitTarget(target);
		SpellCastResult result = spell->prepare(&targets, nullptr);

		if (BotUtility::SelfBotDebug)
			TC_LOG_INFO("server.loading", ">> SelfBot: %s cast %u -> %s (%u)", me->GetName().c_str(), spellId,
				result == SPELL_CAST_OK ? "ok" : "failed", uint32(result));

		if (result == SPELL_CAST_OK)
			return true;
	}
	return false;
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
