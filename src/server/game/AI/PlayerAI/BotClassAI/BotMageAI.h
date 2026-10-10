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

#ifndef _BOT_MAGE_AI_H
#define _BOT_MAGE_AI_H

#include "ScriptSystem.h"
#include "BotAI.h"
#include "AIWaypointsMgr.h"

enum MageTalentType
{
	MageTalent_Arcane,
	MageTalent_Fire,
	MageTalent_Frost
};

class TC_GAME_API BotMageAI : public BotBGAI
{
public:
	BotMageAI(Player* player) :
		BotBGAI(player),
		m_BotTalentType(0),
		m_LastPolymorphTarget(ObjectGuid::Empty),
		m_StealthTick(0)
	{}
	~BotMageAI() {}

	void ResetBotAI() override;

protected:
	uint32 GetManaPowerPer();
	void ClearMechanicAura() override;
	bool NeedWaitSpecialSpell(uint32 diff) override;
	void InitializeSpells();
	void UpdateTalentType();
	bool TargetCanFreeze(Unit* pTarget);
	void EachTick() override;
	bool NeedFlee() override;
	void ProcessReady() override;
	void ProcessFlee() override;
	bool ProcessNormalSpell() override;
	void ProcessMeleeSpell(Unit* pTarget) override;
	void ProcessRangeSpell(Unit* pTarget) override;

	bool ProcessArcaneFlee();
	bool ProcessFireFlee();
	bool ProcessFrostFlee();
	void ProcessArcaneRangeSpell(Unit* pTarget);
	void ProcessFireRangeSpell(Unit* pTarget);
	void ProcessFrostRangeSpell(Unit* pTarget);
	void ProcessArcaneMeleeSpell(Unit* pTarget);
	void ProcessFireMeleeSpell(Unit* pTarget);
	void ProcessFrostMeleeSpell(Unit* pTarget);
	bool ProcessPolymorph(Unit* pTarget);
	bool ProcessFreezeSpell(Unit* pTarget);

	void ProcessPetAttack(Unit* pTarget);
	bool CastingControlCommandSpell() override;
	bool TryStartControlCommand() override;
	float TryPushControlCommand(Player* pTarget) override;
	bool IsStealthing();
	void OnCastTeleport();
	void OnCastPolymorph(Unit* pTarget);
	bool TargetCanPolymorph(Unit* pTarget);
	Position GetTeleportSpellPos();
	bool UseManaJewel();
	Item* FindExistManaJewel();
	uint32 TryCastSummonRiteSpell() override;

private:
	ObjectGuid m_LastPolymorphTarget;
	uint32 m_StealthTick;
	uint32 m_BotTalentType;
	std::set<uint32> m_JewelEntrys;


	uint32 MageIDLE_ManaGem;// 42985		������ʯ
	uint32 MageIDLE_ArcaneMagic;// 42995	�����ǻ�
	uint32 MageIDLE_AOEArcaneMagic;// 43002	ȫ������ǻ�
	uint32 MageIDLE_MgcArmor;// 43024		ħ����
	uint32 MageIDLE_FrostArmor;// 43008		������
	uint32 MageIDLE_IceArmor;// 7301		˪����
	uint32 MageIDLE_FireArmor;// 43046		����װ��
	uint32 MageIDLE_MagicAdd;// 43017		ħ����Ч
	uint32 MageIDLE_MagicDec;// 43015		ħ��ѹ��
	uint32 MageIDLE_SummonRite;// 58659		�ٻ�����

	uint32 MageGuard_MagicShield;// 43020	��������
	uint32 MageGuard_FrostShield;// 43039	��������
	uint32 MageGuard_FrostScherm;// 45438	��������
	uint32 MageGuard_FrostNova;// 42917		��������
	uint32 MageGuard_FireBreath;// 42950	��֮��Ϣ
	uint32 MageGuard_FireNova;// 42945		��������

	uint32 MageAssist_Mirror;// 55342		��ʦ����
	uint32 MageAssist_Rouse;// 12051		����
	uint32 MageAssist_Stealth;// 66			������
	uint32 MageAssist_Teleport;// 1953		������
	uint32 MageAssist_DecCurse;// 475		�������
	uint32 MageAssist_Grace;// 12043		��������
	uint32 MageAssist_ArcanePower;// 12042	����ǿ��
	uint32 MageAssist_CastSpeed;// 12472	����Ѫ��
	uint32 MageAssist_FastColddown;// 11958	���ñ�ϵ����CD
	uint32 MageAssist_FrostPet;// 31687		�ٻ�ˮԪ��
	uint32 MageAssist_FireCritAura;// 11129	����3�����ӻ��汩��AURA

	uint32 MageConfine_BreakCast;// 2139	��������
	uint32 MageConfine_AuraSteal;// 30449	BUFF͵ȡ
	uint32 MageConfine_ArcaneSlow;// 31589	��������
	uint32 MageConfine_ToSheep;// 12826		����
	uint32 MageConfine_Freeze;// 44572		���ᱻ������Ŀ��

	uint32 MageAOE_ArcaneExplode;// 42921	������ը
	uint32 MageAOE_Snowstorm;// 42940		����ѩ
	uint32 MageAOE_IcePiton;// 42931		��׶��
	uint32 MageAOE_FireStorm;// 42926		����籩

	uint32 MageArcane_Barrage;// 44781		������Ļ
	uint32 MageArcane_Bullet;// 42846		�����ɵ�
	uint32 MageArcane_Blast;					// Arcane Blast (core generator, new field)
	uint32 MageArcane_ArcaneShock;// 42897	�������

	uint32 MageFrost_IceArrow;// 42842		������
	uint32 MageFrost_IceLance;// 42914		��ǹ
	uint32 MageFrost_FFArrow;// 47610		˪���

	uint32 MageFire_FireArrow;// 42833		������
	uint32 MageFire_FireShock;// 42873		������
	uint32 MageFire_Firing;// 42859			����
	uint32 MageFire_BigFireBall;// 42891	�����
	uint32 MageFire_FireBomb;// 55360		����ը��

	uint32 MagePet_FrostNova;// 33395		ˮ������������

	uint32 MageFlag_FireStun;// 64343		Aura:���Ի�����
	uint32 MageFlag_FastFStorm;// 54741		Aura:����籩˲��
	uint32 MageFlag_FastBFBall;// 48108		Aura:˲�������
	uint32 MageFlag_FastFFArrow;// 57761	Aura:˲��˪���
	uint32 MageFlag_CanFrozen;// 74396		Aura:Ŀ�굱�ɱ�����״̬
	uint32 MageFlag_Scherm;// 45438			Aura:����״̬��
};

#endif // !_BOT_MAGE_AI_H
