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
m_ActionTick(0),
m_RotationSpell1(0),
m_RotationSpell2(0)
{
	uint8 cls = me ? me->getClass() : 0;
	if (cls == 1 || cls == 4) // Warrior, Rogue: no mana resource
		m_NeedMana = false;
}

namespace
{
	// Standard, long-stable Classic/WotLK-era base spell ids (rank 1) - the same ones used
	// across essentially every TrinityCore/MaNGOS-derived core for this exact purpose. Picked
	// deliberately NOT from BotAISpells.h's per-spec tables (those target full endgame
	// rotations for provisioned bots); FindMaxRankSpellByExist resolves each to whatever rank
	// this specific character actually knows (or 0 if they don't know it yet at their level),
	// so low-level characters simply get no rotation spell until they train one, same as the
	// potion/gear logic elsewhere in this file never assumes a level it hasn't verified.
	struct ClassRotationSpells
	{
		uint32 spell1;
		uint32 spell2;
	};

	ClassRotationSpells GetClassRotationBaseSpells(uint8 cls)
	{
		switch (cls)
		{
		case 1: return { 78, 772 };      // Warrior: Heroic Strike, Rend
		case 2: return { 35395, 21084 }; // Paladin: Crusader Strike, Seal of Righteousness
		case 3: return { 3044, 0 };      // Hunter: Arcane Shot
		case 4: return { 1752, 0 };      // Rogue: Sinister Strike
		case 5: return { 585, 589 };     // Priest: Smite, Shadow Word: Pain
		case 6: return { 45462, 45477 }; // Death Knight: Plague Strike, Icy Touch
		case 7: return { 403, 8042 };    // Shaman: Lightning Bolt, Earth Shock
		case 8: return { 133, 116 };     // Mage: Fireball, Frostbolt
		case 9: return { 686, 0 };       // Warlock: Shadow Bolt
		case 11: return { 5176, 8921 };  // Druid: Wrath, Moonfire
		default: return { 0, 0 };
		}
	}
}

void SelfBotAI::SetActive(bool active)
{
	if (m_Active == active)
		return;
	m_Active = active;

	if (active)
	{
		ClassRotationSpells base = GetClassRotationBaseSpells(me->getClass());
		m_RotationSpell1 = base.spell1 ? BotUtility::FindMaxRankSpellByExist(me, base.spell1) : 0;
		m_RotationSpell2 = base.spell2 ? BotUtility::FindMaxRankSpellByExist(me, base.spell2) : 0;
	}

	if (BotUtility::SelfBotDebug)
		TC_LOG_INFO("server.loading", ">> SelfBot: %s (%s) %s (rotation: %u, %u)", me->GetName().c_str(), me->GetGUID().ToString().c_str(),
			active ? "enabled" : "disabled", m_RotationSpell1, m_RotationSpell2);
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
		// Never pick a new target on our own - only continue what the real client already
		// started (via tab/click selection) or is already swinging at.
		Unit* selected = me->GetSelectedUnit();
		if (selected && selected->IsAlive() && me->IsValidAttackTarget(selected))
			me->Attack(selected, true);
		return;
	}

	TryUseRotationSpell(victim);
}

void SelfBotAI::TryUseRotationSpell(Unit* target)
{
	if (!target)
		return;

	// Try the primary pick first, fall back to the secondary one. CastSpell(..., triggered=false)
	// enforces GCD/range/cost/cooldown exactly like a manual keypress, so an attempt that can't
	// go through yet is just a silent no-op here - never a forced or duplicate cast.
	if (m_RotationSpell1 && me->CastSpell(target, m_RotationSpell1, false))
		return;
	if (m_RotationSpell2)
		me->CastSpell(target, m_RotationSpell2, false);
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
