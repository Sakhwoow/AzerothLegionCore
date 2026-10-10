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

#include "BotHunterAI.h"
#include "PlayerBotSession.h"
#include "Pet.h"
#include "BotBGAIMovement.h"

void BotHunterAI::InitializeSpells()
{
	HunterIDLE_SummonPet = FindMaxRankSpellByExist(23498);// 883			????
	HunterIDLE_RevivePet = FindMaxRankSpellByExist(982);// 982			????
	HunterIDLE_ManaAura = FindMaxRankSpellByExist(210754);// 34074			??????
	HunterIDLE_DodgeAura = FindMaxRankSpellByExist(210753);// 13163		????
	HunterIDLE_EagleAura = FindMaxRankSpellByExist(231555);// 27044		????
	HunterIDLE_DragonAura = FindMaxRankSpellByExist(210752);// 61847		???? ???????
	HunterIDLE_ShotAura = FindMaxRankSpellByExist(31519);// 19506			????(???)

	// Was "uint32 X = ..." for every field in this block - a local-variable shadow bug, not an
	// assignment to the member at all (compare to the correctly-written blocks above/below that
	// omit the type and assign the real field). Every Trap/Assist/Melee field here stayed at its
	// default-constructed value (garbage/0) forever for every BG/arena-context Hunter bot -
	// confirmed by reading it, found while fixing the real rotation that depends on several of
	// these (HunterAssist_PetRage, HunterMelee_MeleeAtt).
	HunterTrap_FarFrozen = FindMaxRankSpellByExist(209789);// 60192		??????
	HunterTrap_Frozen = FindMaxRankSpellByExist(43447);// 14311			????
	HunterTrap_Ice = FindMaxRankSpellByExist(165769);// 13809				????
	HunterTrap_Viper = FindMaxRankSpellByExist(43449);// 34600			????
	HunterTrap_Explode = FindMaxRankSpellByExist(43444);// 49067			????
	HunterTrap_Fire = FindMaxRankSpellByExist(155623);// 49056				????
	HunterTrap_Shot= FindMaxRankSpellByExist(80003);// 63672				???(???)

	HunterAssist_ClearRoot = FindMaxRankSpellByExist(53271);// 53271		????
	HunterAssist_PetCommand = FindMaxRankSpellByExist(205440);// 34026		????
	HunterAssist_HealPet = FindMaxRankSpellByExist(37381);// 48990		????
	HunterAssist_PetStun = FindMaxRankSpellByExist(7093);// 19577		??????(???)
	HunterAssist_PetRage = FindMaxRankSpellByExist(19574);// 19574		???????(???)
	HunterAssist_Stamp = FindMaxRankSpellByExist(1130);// 53338			????
	HunterAssist_FalseDead = FindMaxRankSpellByExist(5384);// 5384		??
	HunterAssist_BackJump = FindMaxRankSpellByExist(781);// 781			??
	HunterAssist_FastSpeed = FindMaxRankSpellByExist(3045);// 3045		????BUF
	HunterAssist_ReadyCD = FindMaxRankSpellByExist(203551);// 23989		????CD(???)

	HunterMelee_BackRoot = FindMaxRankSpellByExist(116599);// 48999		???????(???)
	HunterMelee_NoDamage = FindMaxRankSpellByExist(31567);// 19263		?? ????
	HunterMelee_DecSpeed = FindMaxRankSpellByExist( 195645);// 2974			?? ??????
	HunterMelee_NextAtt = FindMaxRankSpellByExist(31566);// 48996			next??????
	HunterMelee_MeleeAtt = FindMaxRankSpellByExist(190928);// 53339		????
	HunterMelee_RaptorStrike = FindMaxRankSpellByExist(186270);
	HunterMelee_Carve = FindMaxRankSpellByExist(187708);
	HunterMelee_FlankingStrike = FindMaxRankSpellByExist(269751);

	HunterDebug_Damage = FindMaxRankSpellByExist(160503);
	HunterDebug_Mana = FindMaxRankSpellByExist(31407);
	HunterDebug_Sleep = FindMaxRankSpellByExist(19386);

	HunterShot_AOEShot = FindMaxRankSpellByExist(22908);
	HunterShot_CharmShot = FindMaxRankSpellByExist(23601);
	HunterShot_Explode = FindMaxRankSpellByExist(15495);
	HunterShot_Aim = FindMaxRankSpellByExist(19434);
	HunterShot_Silence = FindMaxRankSpellByExist(248919);
	HunterShot_Shock = FindMaxRankSpellByExist(5116);
	HunterShot_Cast = FindMaxRankSpellByExist(65867);
	HunterShot_MgcShot = FindMaxRankSpellByExist(3044);
	HunterShot_KillShot = FindMaxRankSpellByExist(53351);
	HunterShot_MulShot = FindMaxRankSpellByExist(2643);
	HunterShot_QMLShot = FindMaxRankSpellByExist(53209);
	HunterShot_KillCommand = FindMaxRankSpellByExist(34026);
	HunterShot_CobraShot = FindMaxRankSpellByExist(77767);
	HunterShot_MarkedShot = FindMaxRankSpellByExist(185901);
}

void BotHunterAI::UpdateTalentType()
{
	m_BotTalentType = me->FindTalentType();// PlayerBotSetting::FindPlayerTalentType(me);
}

void BotHunterAI::ResetBotAI()
{
	// UpdateTalentType() must run before BotBGAI::ResetBotAI() - that call caches
	// m_IsRangeBot/m_IsMeleeBot via the now-spec-aware overrides above, see FieldHunterAI's
	// identical fix for the full reasoning.
	UpdateTalentType();
	BotBGAI::ResetBotAI();
	m_IsSupplemented = false;
	m_IsReviveManaModel = false;
	InitializeSpells();
	if (Pet* pet = me->GetPet())
		pet->SettingAllSpellAutocast(true);
	if (HunterShot_QMLShot == 0 && m_BotTalentType == 1 && me->getLevel() == 80)
	{
		me->LearnSpell(53209, false);
		HunterShot_QMLShot = FindMaxRankSpellByExist(53209);
	}
}

uint32 BotHunterAI::GetManaPowerPer()
{
	// Legion hunters have no mana pool at all - GetMaxPower(POWER_MANA) is 0, so the original
	// POWER_MANA version of this divided by zero every single call (NaN propagating into every
	// manaPct > X / < X threshold throughout ProcessRangeSpell). Confirmed live. Hunters use
	// Focus in Legion; kept the function name to avoid touching every call site in this file.
	float per = (float)me->GetPower(POWER_FOCUS) / (float)me->GetMaxPower(POWER_FOCUS);
	return (uint32)(per * 100);
}

bool BotHunterAI::NeedFlee()
{
	if (m_Flee.Fleeing())
		return true;
	NearUnitVec nearEnemys = RangeEnemyListByTargetIsMe(NEEDFLEE_CHECKRANGE);
	if (me->InArena())
	{
		for (Unit* pUnit : nearEnemys)
		{
			if (m_NeedFlee.TargetHasFleeAura(pUnit))
			{
				me->SetSelection(pUnit->GetGUID());
				return true;
			}
		}
	}
	else if (nearEnemys.size() > 0)
	{
		Unit* pNear = nearEnemys[urand(0, nearEnemys.size() - 1)];
		me->SetSelection(pNear->GetGUID());
		return true;
	}
	Unit* pTarget = me->GetSelectedUnit();
	if (!pTarget)
		return false;
	if (me->InArena() && !IsFleeTargetByRangeBot(pTarget))
		return false;
	float fleeDistance = m_Flee.CalcMaxFleeDistance(pTarget);
	if (me->GetDistance(pTarget->GetPosition()) < fleeDistance)//BOTAI_FLEE_JUDGE)
		return true;
	return false;
}

void BotHunterAI::ProcessReady()
{
	if (me->HasUnitState(UNIT_STATE_CASTING))
		return;

	if (!m_IsSupplemented)
	{
		m_IsSupplemented = true;
		me->SupplementAmmo();
		return;
	}
	if (me->GetPetGUID().IsEmpty())
	{
		TC_LOG_INFO("BotBGAI", "Hunter Ai check pet, is no pet!");
		PlayerBotSetting::CheckHunterPet(me);
		return;
	}
	ProcessNormalSpell();
}

void BotHunterAI::ProcessFlee()
{
	FleeMovement();

	Unit* pSelectTarget = me->GetSelectedUnit();
	NearUnitVec enemys = RangeEnemyListByTargetIsMe(NEEDFLEE_CHECKRANGE);
	if (enemys.empty())
		return;
	if (!pSelectTarget && !enemys.empty())
		pSelectTarget = enemys[urand(0, enemys.size() - 1)];
	if (!pSelectTarget)
		return;
	Pet* pPet = me->GetPet();
	if (TargetIsSuppress(pSelectTarget))
	{
		if (pPet)
		{
			pPet->AttackStop();
			pPet->SetTarget(ObjectGuid::Empty);
		}
		me->AttackStop();
		return;
	}
	if (pPet)
	{
		Unit* pPetTarget = pPet->GetVictim();
		if (pPetTarget && pPetTarget != pSelectTarget)
			PetAction(pPet, pSelectTarget);
	}
	
	if (enemys.size() > 1 && TryCastSpell(HunterTrap_Ice, me) == SpellCastResult::SPELL_CAST_OK)
		return;
	else if (TryCastSpell(HunterTrap_Frozen, me) == SpellCastResult::SPELL_CAST_OK)
		return;
	if (ProcessAura(true))
		return;
	if (enemys.size() > 1 && TryCastSpell(HunterMelee_NoDamage, me) == SpellCastResult::SPELL_CAST_OK)
		return;
	bool hasRoot = HasRootMechanic();
	if (hasRoot && HunterAssist_ClearRoot && TryCastSpell(HunterAssist_ClearRoot, me) == SpellCastResult::SPELL_CAST_OK)
		return;
	if (enemys.size() > 1 && TryCastSpell(HunterAssist_FalseDead, me) == SpellCastResult::SPELL_CAST_OK)
		return;

	Unit* pCastEnemy = RandomRangeEnemyByCasting(BOTAI_RANGESPELL_DISTANCE);
	if (pCastEnemy)
	{
		if (m_BotTalentType == 1 && HunterShot_Silence && TryCastSpell(HunterShot_Silence, pCastEnemy) == SpellCastResult::SPELL_CAST_OK)
			return;
		else if (m_BotTalentType == 2 && HunterShot_CharmShot && TryCastSpell(HunterShot_CharmShot, pCastEnemy) == SpellCastResult::SPELL_CAST_OK)
			return;
	}

	if (m_BotTalentType == 0)
	{
		if (hasRoot && HunterAssist_PetRage && TryCastSpell(HunterAssist_PetRage, me) == SpellCastResult::SPELL_CAST_OK)
			return;
		if (TryCastSpell(HunterAssist_PetStun, pSelectTarget) == SpellCastResult::SPELL_CAST_OK)
			return;
	}
	if (CastMeleeSpell(pSelectTarget))
		return;
	if (CastRangeSpell(pSelectTarget))
		return;
	if (me->InArena())
	{
		uint32 minLifePct = 100;
		Unit* pMinUnit = NULL;
		Unit* pMeleeUnit = NULL;
		NearUnitVec enemys = RangeEnemyListByHasAura(0, BOTAI_RANGESPELL_DISTANCE);
		for (Unit* pUnit : enemys)
		{
			if (pUnit == pSelectTarget || TargetIsSuppress(pUnit))
				continue;
			float dist = me->GetDistance(pUnit->GetPosition());
			if (dist <= 9)
			{
				if (dist < 7)
					pMeleeUnit = pUnit;
				continue;
			}
			uint32 lifePct = uint32(pUnit->GetHealthPct());
			if (!pMinUnit || lifePct < minLifePct)
			{
				pMinUnit = pUnit;
				minLifePct = lifePct;
			}
		}
		if (pMinUnit && CastRangeSpell(pMinUnit))
			return;
		if (pMeleeUnit && CastMeleeSpell(pMeleeUnit))
			return;
	}
}

bool BotHunterAI::ProcessNormalSpell()
{
	if (me->HasUnitState(UNIT_STATE_CASTING))
		return true;
	//if (me->GetPetGUID().IsEmpty() && CanCastSpell(HunterIDLE_SummonPet, me) == SpellCastResult::SPELL_CAST_OK)
	//	return false;
	if (!me->HasAura(m_UseMountID))
	{
		Pet* pPet = me->GetPet();
		if (pPet && !pPet->IsAlive())
		{
			me->StopMoving();
			TryCastSpell(HunterIDLE_RevivePet, pPet);
			return true;
		}
		else if (pPet && pPet->GetHealthPct() < 85 && !pPet->HasAura(HunterAssist_HealPet))
		{
			if (TryCastSpell(HunterAssist_HealPet, pPet) == SpellCastResult::SPELL_CAST_OK)
				return false;
		}
		else if (!pPet && TryCastSpell(HunterIDLE_SummonPet, me) == SpellCastResult::SPELL_CAST_OK)
		{
			return false;
		}
		PetAction(pPet, NULL);
	}
	if (me->HasAura(m_UseMountID))
		return false;
	if (m_BotTalentType == 1)
	{
		if (HunterIDLE_ShotAura && !me->HasAura(HunterIDLE_ShotAura) && TryCastSpell(HunterIDLE_ShotAura, me) == SpellCastResult::SPELL_CAST_OK)
			return false;
	}
	if (HunterIDLE_DragonAura)
	{
		if (!me->HasAura(HunterIDLE_DragonAura) && TryCastSpell(HunterIDLE_DragonAura, me) == SpellCastResult::SPELL_CAST_OK)
			return false;
	}
	else
	{
		if (!me->HasAura(HunterIDLE_EagleAura) && TryCastSpell(HunterIDLE_EagleAura, me) == SpellCastResult::SPELL_CAST_OK)
			return false;
	}

	return TryUpMount();
}

void BotHunterAI::ProcessMeleeSpell(Unit* pTarget)
{
	CastMeleeSpell(pTarget);
	if (me->InArena())
	{
		uint32 minLifePct = 100;
		Unit* pMinUnit = NULL;
		NearUnitVec enemys = RangeEnemyListByHasAura(0, BOTAI_RANGESPELL_DISTANCE);
		for (Unit* pUnit : enemys)
		{
			if (pUnit == pTarget || TargetIsSuppress(pUnit))
				continue;
			if (me->GetDistance(pUnit->GetPosition()) <= 9)
				continue;
			uint32 lifePct = uint32(pUnit->GetHealthPct());
			if (!pMinUnit || lifePct < minLifePct)
			{
				pMinUnit = pUnit;
				minLifePct = lifePct;
			}
		}
		if (pMinUnit && CastRangeSpell(pMinUnit))
			return;
	}
}

void BotHunterAI::ProcessRangeSpell(Unit* pTarget)
{
	Pet* pPet = me->GetPet();
	if (!pPet && TryCastSpell(HunterIDLE_SummonPet, me) == SpellCastResult::SPELL_CAST_OK)
		return;
	PetAction(pPet, pTarget);
	if (pPet && pPet->IsAlive())
	{
		if (pPet->GetHealthPct() < 70 && !pPet->HasAura(HunterAssist_HealPet) && TryCastSpell(HunterAssist_HealPet, pPet) == SpellCastResult::SPELL_CAST_OK)
			return;
	}
	if (ProcessAura(false))
		return;

	NearUnitVec selMeEnemys = RangeEnemyListByTargetIsMe(BOTAI_RANGESPELL_DISTANCE);
	if (selMeEnemys.size() > 0)
	{
		if (selMeEnemys.size() > 1 && TryCastSpell(HunterAssist_FalseDead, me) == SpellCastResult::SPELL_CAST_OK)
			return;
		Unit* pRndPlayer = selMeEnemys[urand(0, selMeEnemys.size() - 1)];
		if (HunterTrap_FarFrozen && pRndPlayer != pTarget && !TargetIsSuppress(pRndPlayer) && TryCastSpell(HunterTrap_FarFrozen, pRndPlayer) == SpellCastResult::SPELL_CAST_OK)
			return;
	}

	Unit* pCastEnemy = RandomRangeEnemyByCasting(BOTAI_RANGESPELL_DISTANCE);
	if (pCastEnemy)
	{
		if (m_BotTalentType == 1 && HunterShot_Silence && TryCastSpell(HunterShot_Silence, pCastEnemy) == SpellCastResult::SPELL_CAST_OK)
			return;
		else if (m_BotTalentType == 2 && HunterShot_CharmShot && TryCastSpell(HunterShot_CharmShot, pCastEnemy) == SpellCastResult::SPELL_CAST_OK)
			return;
	}

	if (!pTarget->HasAura(HunterAssist_Stamp) && TryCastSpell(HunterAssist_Stamp, pTarget) == SpellCastResult::SPELL_CAST_OK)
		return;
	if (TryCastSpell(HunterAssist_FastSpeed, me) == SpellCastResult::SPELL_CAST_OK)
		return;

	if (CastRangeSpell(pTarget))
		return;
	if (me->InArena())
	{
		uint32 minLifePct = 100;
		Unit* pMinUnit = NULL;
		Unit* pMeleeUnit = NULL;
		NearUnitVec enemys = RangeEnemyListByHasAura(0, BOTAI_RANGESPELL_DISTANCE);
		for (Unit* pUnit : enemys)
		{
			if (pUnit == pTarget || TargetIsSuppress(pUnit))
				continue;
			float dist = me->GetDistance(pUnit->GetPosition());
			if (dist <= 9)
			{
				if (dist < 7)
					pMeleeUnit = pUnit;
				continue;
			}
			uint32 lifePct = uint32(pUnit->GetHealthPct());
			if (!pMinUnit || lifePct < minLifePct)
			{
				pMinUnit = pUnit;
				minLifePct = lifePct;
			}
		}
		if (pMinUnit && CastRangeSpell(pMinUnit))
			return;
		if (pMeleeUnit && CastMeleeSpell(pMeleeUnit))
			return;
	}
}

bool BotHunterAI::ProcessAura(bool isFlee)
{
	if (HunterIDLE_ManaAura && CheckManaModel())
	{
		if (!me->HasAura(HunterIDLE_ManaAura) && TryCastSpell(HunterIDLE_ManaAura, me, true) == SpellCastResult::SPELL_CAST_OK)
			return true;
	}
	else
	{
		if (HunterIDLE_DragonAura)
		{
			if (!me->HasAura(HunterIDLE_DragonAura) && TryCastSpell(HunterIDLE_DragonAura, me, true) == SpellCastResult::SPELL_CAST_OK)
				return true;
		}
		else
		{
			if (isFlee)
			{
				if (!me->HasAura(HunterIDLE_DodgeAura) && TryCastSpell(HunterIDLE_DodgeAura, me, true) == SpellCastResult::SPELL_CAST_OK)
					return true;
			}
			else
			{
				if (!me->HasAura(HunterIDLE_EagleAura) && TryCastSpell(HunterIDLE_EagleAura, me, true) == SpellCastResult::SPELL_CAST_OK)
					return true;
			}
		}
	}
	return false;
}

//bool BotHunterAI::TryStartControlCommand()
//{
//	if (m_CruxControlTarget == ObjectGuid::Empty)
//		return false;
//	if (!HunterTrap_FarFrozen)
//	{
//		m_CruxControlTarget = ObjectGuid::Empty;
//		return false;
//	}
//	Player* pTarget = ObjectAccessor::FindPlayer(m_CruxControlTarget);
//	if (!pTarget || !TargetIsNotDiminishingByType2(pTarget, DIMINISHING_DISORIENT) || !pTarget->IsAlive() || TargetIsControl(pTarget))
//	{
//		m_CruxControlTarget = ObjectGuid::Empty;
//		return false;
//	}
//	SpellInfo const* spellInfo = sSpellMgr->GetSpellInfo(HunterTrap_FarFrozen);
//	if (!spellInfo || spellInfo->IsPassive())
//	{
//		m_CruxControlTarget = ObjectGuid::Empty;
//		return false;
//	}
//	if (me->GetSpellHistory()->HasGlobalCooldown(spellInfo))
//		return true;
//	if (!me->GetSpellHistory()->IsReady(spellInfo))
//	{
//		m_CruxControlTarget = ObjectGuid::Empty;
//		return false;
//	}
//
//	if (me->IsWithinLOSInMap(pTarget) && me->GetDistance(pTarget) < BOTAI_RANGESPELL_DISTANCE)
//	{
//		TryCastSpell(HunterTrap_FarFrozen, pTarget);
//	}
//	else
//	{
//		if (!IsNotMovement())
//			m_Movement->MovementTo(m_CruxControlTarget);
//	}
//	return true;
//}
//
//float BotHunterAI::TryPushControlCommand(Player* pTarget)
//{
//	if (!pTarget || !pTarget->IsAlive() || !pTarget->IsInWorld() || me->GetMap() != pTarget->GetMap())
//	{
//		ClearCruxControlCommand();
//		return -1;
//	}
//	if (!HunterTrap_FarFrozen)
//		return -1;
//	if (!TargetIsNotDiminishingByType2(pTarget, DIMINISHING_DISORIENT))
//		return -1;
//	if (!BotUtility::SpellHasReady(me, HunterTrap_FarFrozen))
//		return -1;
//	m_CruxControlTarget = pTarget->GetGUID();
//	m_LastControlTarget = m_CruxControlTarget;
//	return me->GetDistance(pTarget->GetPosition());
//}

bool BotHunterAI::CastRangeSpell(Unit* pTarget)
{
	if (!pTarget)
		return false;
	if (me->GetDistance(pTarget->GetPosition()) <= 9)
		return false;
	NearUnitVec targetRanges = RangeEnemyListByTargetRange(pTarget, NEEDFLEE_CHECKRANGE);
	if (targetRanges.size() > 5)
	{
		if (HunterShot_MulShot && TryCastSpell(HunterShot_MulShot, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
		if (HunterShot_AOEShot && TryCastSpell(HunterShot_AOEShot, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
	}

	if (HunterShot_KillShot && pTarget->GetHealthPct() < 20 && TryCastSpell(HunterShot_KillShot, pTarget) == SpellCastResult::SPELL_CAST_OK)
		return true;
	if (CheckManaModel())
	{
		if (!pTarget->HasAura(HunterDebug_Mana, me->GetGUID()) && !pTarget->HasAura(HunterDebug_Damage, me->GetGUID()) && TryCastSpell(HunterDebug_Mana, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
	}
	else
	{
		if (!pTarget->HasAura(HunterDebug_Mana, me->GetGUID()) && !pTarget->HasAura(HunterDebug_Damage, me->GetGUID()) && TryCastSpell(HunterDebug_Damage, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
	}
	if (me->InArena() && TryCastSpell(HunterShot_MulShot, pTarget) == SpellCastResult::SPELL_CAST_OK)
		return true;
	if (TryCastSpell(HunterAssist_FastSpeed, me) == SpellCastResult::SPELL_CAST_OK)
		return true;
	if (TargetIsMelee(pTarget->ToPlayer()) && !pTarget->HasAura(HunterMelee_DecSpeed) && !pTarget->HasAura(HunterShot_Shock) && !TargetIsSuppress(pTarget))
	{
		if (TryCastSpell(HunterShot_Shock, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
	}
	// Real BM(0)/MM(1) priority - Survival (branch 2) is handled entirely in CastMeleeSpell
	// below now, so the old ranged-Explosive-Shot/trap branches for it were dead weight.
	if (m_BotTalentType == 0)
	{
		if (HunterAssist_PetRage && TryCastSpell(HunterAssist_PetRage, me) == SpellCastResult::SPELL_CAST_OK)
			return true;
		if (HunterShot_KillCommand && TryCastSpell(HunterShot_KillCommand, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
		if (HunterShot_CobraShot && TryCastSpell(HunterShot_CobraShot, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
	}
	else if (m_BotTalentType == 1)
	{
		if (HunterShot_Aim && TryCastSpell(HunterShot_Aim, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
		if (HunterShot_MarkedShot && TryCastSpell(HunterShot_MarkedShot, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
	}
	if (TryCastSpell(HunterShot_MgcShot, pTarget) == SpellCastResult::SPELL_CAST_OK)
		return true;
	if (pTarget->GetTarget() != me->GetGUID() && TryCastSpell(HunterShot_Cast, pTarget) == SpellCastResult::SPELL_CAST_OK)
		return true;
	return false;
}

bool BotHunterAI::CastMeleeSpell(Unit* pTarget)
{
	if (!pTarget)
		return false;

	// Real Survival (branch 2) priority - see FieldHunterAI's ProcessMeleeSpell for the full
	// reasoning (Legion reworked this spec into melee).
	if (m_BotTalentType == 2)
	{
		if (HunterMelee_FlankingStrike && TryCastSpell(HunterMelee_FlankingStrike, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
		NearUnitVec meleeTargets = RangeEnemyListByTargetRange(pTarget, NEEDFLEE_CHECKRANGE);
		if (meleeTargets.size() > 1 && HunterMelee_Carve && TryCastSpell(HunterMelee_Carve, me) == SpellCastResult::SPELL_CAST_OK)
			return true;
		if (HunterMelee_RaptorStrike && TryCastSpell(HunterMelee_RaptorStrike, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
	}

	if (m_BotTalentType == 2 && HunterDebug_Sleep && TargetIsMelee(pTarget->ToPlayer()) && me->GetDistance(pTarget->GetPosition()) < 12)
	{
		if (!TargetIsSuppress(pTarget) && TryCastSpell(HunterDebug_Sleep, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
	}
	if (TargetIsMelee(pTarget->ToPlayer()) && !pTarget->HasAura(HunterMelee_DecSpeed) && !pTarget->HasAura(HunterShot_Shock) && !TargetIsSuppress(pTarget))
	{
		if (TryCastSpell(HunterMelee_DecSpeed, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
		if (TryCastSpell(HunterShot_Shock, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
	}
	if (!me->HasAura(HunterMelee_NextAtt))
		TryCastSpell(HunterMelee_NextAtt, pTarget);
	if (TryCastSpell(HunterMelee_MeleeAtt, pTarget) == SpellCastResult::SPELL_CAST_OK)
		return true;
	if (m_BotTalentType == 2 && HunterMelee_BackRoot)
	{
		if (TryCastSpell(HunterMelee_BackRoot, pTarget) == SpellCastResult::SPELL_CAST_OK)
			return true;
	}
	return false;
}

void BotHunterAI::PetAction(Pet* pPet, Unit* pTarget)
{
	if (!pPet)
		return;
	if (pPet->GetVictim() == pTarget)
		return;
	WorldSession* pSession = me->GetSession();
	if (pTarget)
		pSession->HandlePetActionHelper(pPet, pPet->GetGUID(), 2, 7, pTarget->GetGUID(), pPet->GetPosition());
	else
		pSession->HandlePetActionHelper(pPet, pPet->GetGUID(), 1, 7, ObjectGuid::Empty, pPet->GetPosition());
}

bool BotHunterAI::HasRootMechanic()
{
	if (HasAuraMechanic(me, Mechanics::MECHANIC_CHARM) ||
		HasAuraMechanic(me, Mechanics::MECHANIC_FEAR) ||
		HasAuraMechanic(me, Mechanics::MECHANIC_ROOT) ||
		HasAuraMechanic(me, Mechanics::MECHANIC_SLEEP) ||
		HasAuraMechanic(me, Mechanics::MECHANIC_POLYMORPH) ||
		HasAuraMechanic(me, Mechanics::MECHANIC_HORROR) ||
		HasAuraMechanic(me, Mechanics::MECHANIC_STUN))
		return true;
	return false;
}

bool BotHunterAI::TargetIsSuppress(Unit* pTarget)
{
	if (HasAuraMechanic(pTarget, Mechanics::MECHANIC_CHARM) ||
		HasAuraMechanic(pTarget, Mechanics::MECHANIC_DISORIENTED) ||
		HasAuraMechanic(pTarget, Mechanics::MECHANIC_DISTRACT) ||
		HasAuraMechanic(pTarget, Mechanics::MECHANIC_SLEEP) ||
		HasAuraMechanic(pTarget, Mechanics::MECHANIC_POLYMORPH) ||
		HasAuraMechanic(pTarget, Mechanics::MECHANIC_BANISH)/* ||
		HasAuraMechanic(pTarget, Mechanics::MECHANIC_IMMUNE_SHIELD)*/)
		return true;
	return false;
}

bool BotHunterAI::CheckManaModel()
{
	uint32 manaPct = GetManaPowerPer();
	if (m_IsReviveManaModel)
	{
		if (manaPct > 70)
			m_IsReviveManaModel = false;
	}
	else
	{
		if (manaPct < 8)
			m_IsReviveManaModel = true;
	}
	return m_IsReviveManaModel;
}
