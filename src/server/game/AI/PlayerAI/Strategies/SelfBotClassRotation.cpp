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

#include "SelfBotClassRotation.h"
#include "SelfBotAI.h"
#include "BotAITool.h"
#include "Player.h"
#include "Unit.h"

uint32 SelfBotWarriorAI::GetRagePowerPer(Player* me)
{
	uint32 maxRage = me->GetMaxPower(POWER_RAGE);
	if (!maxRage)
		return 0;
	return uint32((float(me->GetPower(POWER_RAGE)) / float(maxRage)) * 100);
}

void SelfBotWarriorAI::UpdateWarriorPose(Player* me)
{
	// Same HasSpell guard the live "unknown spell id 0" stance-cast bug fix added to every
	// other Warrior context this session (FieldWarriorAI.cpp et al.) - ported here from the
	// start rather than reintroducing that bug for a 5th copy.
	uint32 statusSpell;
	if (!me->IsInCombat())
		statusSpell = WarriorWeapon_Status;
	else switch (me->GetActiveTalentGroup())
	{
	case 0: statusSpell = WarriorWeapon_Status; break;
	case 1: statusSpell = WarriorRage_Status; break;
	case 2: statusSpell = WarriorDefance_Status; break;
	default: return;
	}

	if (statusSpell && me->HasSpell(statusSpell) && !me->HasAura(statusSpell))
		me->CastSpell(me, statusSpell, true);
}

bool SelfBotWarriorAI::ProcessMeleeSpell(SelfBotAI* owner, Player* me, Unit* target)
{
	if (!owner || !me || !target)
		return false;

	UpdateWarriorPose(me);

	uint32 ragePer = GetRagePowerPer(me);
	float healthPct = me->GetHealthPct();
	if (ragePer < 5 && owner->TryCastFirstKnown(me, { WarriorCommon_AddPower }))
		return true;
	if (healthPct <= 40.0f && owner->TryCastFirstKnown(me, { WarriorCommon_PowerRelife }))
		return true;

	// Simplified from FieldWarriorAI's RangeEnemyListByTargetIsMe (grid-search over nearby
	// players/creatures actually targeting this unit) - see this file's header comment for why
	// Unit::getAttackers() is close enough for a real player's own fight.
	uint32 attackerCount = uint32(me->getAttackers().size());
	if (ragePer >= 50)
	{
		if (attackerCount > 3)
		{
			if (!me->HasAura(WarriorCommon_SweepAtt))
				owner->TryCastFirstKnown(target, { WarriorCommon_AOEFear });
		}
		else if (!me->HasAura(WarriorCommon_PowerAtt))
			owner->TryCastFirstKnown(target, { WarriorCommon_PowerAtt });
	}

	bool cast = false;
	switch (me->GetActiveTalentGroup())
	{
	case 0:
		cast = ProcessWeaponMeleeSpell(owner, me, target);
		break;
	case 1:
		cast = ProcessRageMeleeSpell(owner, me, target);
		break;
	case 2:
		if (attackerCount >= 2)
		{
			if (healthPct <= 20 && owner->TryCastFirstKnown(me, { WarriorDefance_MaxLife }))
				return true;
			if (healthPct <= 20 && owner->TryCastFirstKnown(me, { WarriorDefance_ShiledWall }))
				return true;
		}
		cast = ProcessDefanceMeleeSpell(owner, me, target);
		break;
	}
	return cast;
}

bool SelfBotWarriorAI::ProcessWeaponMeleeSpell(SelfBotAI* owner, Player* me, Unit* target)
{
	if (owner->TryCastFirstKnown(target, { WarriorWeaponRage_WinAttack }))
		return true;
	if (uint32(me->getAttackers().size()) >= 3 && owner->TryCastFirstKnown(target, { WarriorWeapon_Backstorm }))
		return true;
	if (owner->TryCastFirstKnown(target, { WarriorWeapon_DeadAtt }))
		return true;
	if (owner->TryCastFirstKnown(target, { WarriorWeapon_Suppress }))
		return true;
	if (owner->TryCastFirstKnown(target, { WarriorWeaponRage_FullKill }))
		return true;
	if (!target->HasAura(WarriorWeaponDefance_Bleed) && owner->TryCastFirstKnown(target, { WarriorWeaponDefance_Bleed }))
		return true;
	if (GetRagePowerPer(me) >= 30 && uint32(me->getAttackers().size()) >= 2 &&
		owner->TryCastFirstKnown(target, { WarriorWeaponDefance_AOEAtt }))
		return true;
	return false;
}

bool SelfBotWarriorAI::ProcessRageMeleeSpell(SelfBotAI* owner, Player* me, Unit* target)
{
	if (owner->TryCastFirstKnown(target, { WarriorWeaponRage_WinAttack }))
		return true;
	if (target->HasUnitState(UNIT_STATE_CASTING) && owner->TryCastFirstKnown(target, { WarriorRage_HeadAtt }))
		return true;
	if (owner->TryCastFirstKnown(target, { WarriorRage_Bloodthirsty }))
		return true;
	if (owner->TryCastFirstKnown(target, { WarriorWeaponRage_FullKill }))
		return true;
	if (uint32(me->getAttackers().size()) >= 2 && owner->TryCastFirstKnown(target, { WarriorRage_Harsh }))
		return true;
	if (uint32(me->getAttackers().size()) >= 2 && owner->TryCastFirstKnown(target, { WarriorRage_Whirlwind }))
		return true;
	if (owner->TryCastFirstKnown(target, { WarriorRage_Needdead }))
		return true;
	if (owner->TryCastFirstKnown(target, { WarriorRage_Impertinency }))
		return true;
	return false;
}

uint32 SelfBotPaladinAI::GetManaPowerPer(Player* me)
{
	uint32 maxMana = me->GetMaxPower(POWER_MANA);
	if (!maxMana)
		return 0;
	return uint32((float(me->GetPower(POWER_MANA)) / float(maxMana)) * 100);
}

bool SelfBotPaladinAI::ProcessAura(SelfBotAI* owner, Player* me)
{
	uint32 auraSpell;
	switch (me->GetActiveTalentGroup())
	{
	case 0: auraSpell = PaladinIDLE_CastAura; break;
	case 1: auraSpell = PaladinIDLE_ArmorAura; break;
	case 2: auraSpell = PaladinIDLE_JudgeAura; break;
	default: return false;
	}
	if (auraSpell && !me->HasAura(auraSpell))
		return owner->TryCastFirstKnown(me, { auraSpell });
	return false;
}

bool SelfBotPaladinAI::ProcessMeleeSpell(SelfBotAI* owner, Player* me, Unit* target)
{
	if (!owner || !me || !target)
		return false;

	uint32 manaPct = GetManaPowerPer(me);
	uint8 spec = me->GetActiveTalentGroup();

	// FieldPaladinAI's IsInvincible(unit) checks MECHANIC_BANISH as a proxy for "has a bubble/
	// immunity effect up" - ported as-is, not second-guessed.
	bool selfInvincible = BotUtility::HasAuraMechanic(me, Mechanics::MECHANIC_BANISH);

	if (!me->HasUnitState(UNIT_STATE_CASTING))
	{
		if (spec != 1) // self-preservation applies to Holy(0) and Retribution(2), not Protection
		{
			if (!selfInvincible && me->GetHealthPct() < 25 && owner->TryCastFirstKnown(me, { PaladinHeal_BigHoly }))
				return true;
			if (selfInvincible && me->GetHealthPct() < 80)
			{
				if (manaPct > 25 && owner->TryCastFirstKnown(me, { PaladinHeal_BigHoly }))
					return true;
				if (owner->TryCastFirstKnown(me, { PaladinHeal_FastHoly }))
					return true;
			}
		}
	}
	else
		return false;

	if (ProcessAura(owner, me))
		return true;

	if (manaPct < 20)
	{
		if (!me->HasAura(PaladinAssist_ManaStamp) && owner->TryCastFirstKnown(me, { PaladinAssist_ManaStamp }))
			return true;
		if (owner->TryCastFirstKnown(target, { PaladinMelee_ManaJudge }))
			return true;
	}

	if ((BotUtility::HasAuraMechanic(me, Mechanics::MECHANIC_ROOT) ||
		BotUtility::HasAuraMechanic(me, Mechanics::MECHANIC_SNARE) ||
		BotUtility::HasAuraMechanic(me, Mechanics::MECHANIC_DAZE)) && !selfInvincible)
	{
		if (owner->TryCastFirstKnown(me, { PaladinGuard_FreeAura }))
			return true;
	}

	uint32 attackerCount = uint32(me->getAttackers().size());
	if (attackerCount > 1 && owner->TryCastFirstKnown(me, { PaladinMelee_AOEOffertory }))
		return true;
	if (spec != 1 && me->GetHealthPct() < 20 && manaPct > 25 && me->IsInCombat() &&
		!selfInvincible && attackerCount > 0 && owner->TryCastFirstKnown(me, { PaladinGuard_Invincible }))
		return true;

	float meLife = me->GetHealthPct();
	if (PaladinGuard_UnShield && !me->HasAura(PaladinGuard_UnShield) && owner->TryCastFirstKnown(me, { PaladinGuard_UnShield }))
		return true;
	if (spec == 2 && owner->TryCastFirstKnown(me, { PaladinAssist_UpPower }))
		return true;
	if (target->GetHealthPct() < 20 && owner->TryCastFirstKnown(target, { PaladinMelee_KillMace }))
		return true;

	if (spec == 1)
	{
		if (owner->TryCastFirstKnown(target, { PaladinMelee_FlyShield }))
			return true;
		if (owner->TryCastFirstKnown(target, { PaladinMelee_ShieldAtt }))
			return true;
		if (owner->TryCastFirstKnown(target, { PaladinMelee_MaceAtt }))
			return true;
	}
	else if (spec == 2)
	{
		if (me->HasAura(PaladinFlag_MomentHoly) && meLife < 90 && owner->TryCastFirstKnown(me, { PaladinHeal_FastHoly }))
			return true;
		// Real Retribution priority (ru.wowhead-confirmed Legion 7.3.5 guide, spell ids quoted
		// directly in it): burn Avenging Wrath on cooldown, keep Judgment's debuff up, spend
		// both Holy Power generators (Blade of Justice + Crusader Strike), then dump into the
		// matching finisher - Templar's Verdict at 1 target, Divine Storm at 2+.
		if (owner->TryCastFirstKnown(me, { PaladinMelee_AvengingWrath }))
			return true;
		if (owner->TryCastFirstKnown(target, { PaladinMelee_LifeJudge }))
			return true;
		if (owner->TryCastFirstKnown(target, { PaladinMelee_BladeJustice }))
			return true;
		if (owner->TryCastFirstKnown(target, { PaladinMelee_WeaponAtt }))
			return true;
		if (attackerCount > 1)
		{
			if (owner->TryCastFirstKnown(target, { PaladinMelee_HolyStrom }))
				return true;
		}
		else if (owner->TryCastFirstKnown(target, { PaladinMelee_TemplarVerdict }))
			return true;
	}

	return owner->TryCastFirstKnown(target, { PaladinMelee_LifeJudge });
}

bool SelfBotWarriorAI::ProcessDefanceMeleeSpell(SelfBotAI* owner, Player* me, Unit* target)
{
	uint32 ragePer = GetRagePowerPer(me);
	float healthPct = me->GetHealthPct();
	if (healthPct <= 25 && owner->TryCastFirstKnown(me, { WarriorDefance_MaxLife }))
		return true;
	if (target->HasUnitState(UNIT_STATE_CASTING) && owner->TryCastFirstKnown(target, { WarriorWeaponDefance_ShieldHit }))
		return true;
	if (!target->HasAura(WarriorWeaponDefance_Bleed) && owner->TryCastFirstKnown(target, { WarriorWeaponDefance_Bleed }))
		return true;
	if (owner->TryCastFirstKnown(target, { WarriorDefance_ShieldAtt }))
		return true;
	if (owner->TryCastFirstKnown(target, { WarriorDefance_Disarm }))
		return true;
	if (ragePer >= 40 && owner->TryCastFirstKnown(target, { WarriorDefance_HPojia }))
		return true;

	uint32 attackerCount = uint32(me->getAttackers().size());
	if (attackerCount >= 1 && owner->TryCastFirstKnown(target, { WarriorDefance_ShieldBlock }))
		return true;
	if (attackerCount >= 2 && owner->TryCastFirstKnown(target, { WarriorDefance_AOEConk }))
		return true;
	if (!target->HasAura(WarriorDefance_Conk) && owner->TryCastFirstKnown(target, { WarriorDefance_Conk }))
		return true;
	if (healthPct <= 25 && attackerCount >= 1 && owner->TryCastFirstKnown(me, { WarriorDefance_ShiledWall }))
		return true;
	if (ragePer >= 40 && attackerCount >= 1 && owner->TryCastFirstKnown(target, { WarriorWeaponDefance_AOEAtt }))
		return true;
	return false;
}
