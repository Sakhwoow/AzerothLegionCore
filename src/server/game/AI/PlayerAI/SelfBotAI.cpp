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

void SelfBotAI::SetActive(bool active)
{
	if (m_Active == active)
		return;
	m_Active = active;

	if (BotUtility::SelfBotDebug)
		TC_LOG_INFO("server.loading", ">> SelfBot: %s (%s) %s", me->GetName().c_str(), me->GetGUID().ToString().c_str(), active ? "enabled" : "disabled");
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

void SelfBotAI::TryUseRotationSpell(Unit* /*target*/)
{
	// Intentionally empty for now - the per-class rotation table is added last, once the
	// attack-continuation/potion scaffolding above has been verified live (see the plan's
	// sequencing). m_RotationSpell1/2 stay 0 until then.
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
