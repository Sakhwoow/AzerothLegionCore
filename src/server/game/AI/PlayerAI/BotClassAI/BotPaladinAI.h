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

#ifndef _BOT_PALADIN_AI_H
#define _BOT_PALADIN_AI_H

#include "ScriptSystem.h"
#include "BotAI.h"
#include "AIWaypointsMgr.h"

enum PaladinTalentType
{
	PaladinTalent_Holy,
	PaladinTalent_Defance,
	PaladinTalent_Punish
};

class TC_GAME_API BotPaladinAI : public BotBGAI
{
public:
	BotPaladinAI(Player* player) :
		BotBGAI(player),
		m_BotTalentType(0)
	{}
	~BotPaladinAI() {}

	void ResetBotAI() override;

protected:
	uint32 GetManaPowerPer();
	void InitializeSpells();
	void UpdateTalentType();
	void EachTick() override;
	void ProcessReady() override;
	bool ProcessNormalSpell() override;
	void ProcessHealthSpell(Unit* pTarget) override;
	void ProcessMeleeSpell(Unit* pTarget) override;
	void ProcessRangeSpell(Unit* pTarget) override;
	void ProcessFlee() override;
	bool ProcessArenaHealthMember();

	bool ProcessStamp();
	bool ProcessDispel();
	bool ProcessAura();
	bool ProcessControl(Unit* pTarget);
	bool ProcessFreeAura();
	bool ProcessTryFriendImmune();
	bool ProcessTryFullHealth();

	bool TryStartControlCommand() override;
	float TryPushControlCommand(Player* pTarget) override;
	bool TargetNeedInvincible(Unit* player);
	bool TargetNeedFree(Unit* player);
	bool IsHealerBotAI() override;
	bool IsAttacker() override;
	bool NeedUseGuardWish(Player* player);
	bool NeedUseKingWish(Player* player);
	bool NeedUseWitWish(Player* player);
	bool NeedUseStrWish(Player* player);
	bool ExistWish(Unit* player);
	bool TargetIsCtrl(Unit* pTarget);

private:
	uint32 m_BotTalentType;

	uint32 PaladinIDLE_MountAura;// 32223			�����ٶȹ⻷
	uint32 PaladinIDLE_CastAura;// 19746			ʩ���⻷
	uint32 PaladinIDLE_JudgeAura;// 54043			�ͽ�⻷
	uint32 PaladinIDLE_ArmorAura;// 48942			�����⻷
	uint32 PaladinIDLE_AOEGuardWish;// 25899			Ⱥ��ӻ�ף��(����ϵ)
	uint32 PaladinIDLE_AOEKingWish;// 25898			Ⱥ������ף��
	uint32 PaladinIDLE_AOEWitWish;// 48938			Ⱥ���ǻ�ף��
	uint32 PaladinIDLE_AOEStrWish;// 48934			Ⱥ������ף��
	uint32 PaladinIDLE_JusticeRage;// 25780			����֮ŭ ����ʹ��

	uint32 PaladinGuard_UnShield;// 53601			��ʥ����
	uint32 PaladinGuard_FreeAura;// 1044			����ף��
	uint32 PaladinGuard_Invincible;// 642			ʥ���� �޵�
	uint32 PaladinGuard_Sacrifice;// 6940			����֮�� Ŀ������ת��
	uint32 PaladinGuard_AOESacrifice;// 64205		��ʥ���� �Ŷ�����ת��(����ϵ)
	uint32 PaladinGuard_BlockShield;// 48952			��ʥ��(����ϵ)
	uint32 PaladinGuard_PhyImmune;// 10278			Ŀ����������

	uint32 PaladinAssist_UpPower;// 31884			����� UP�˺�
	uint32 PaladinAssist_RevengeStamp;// 31801		����ʥӡ ����5���˺����
	uint32 PaladinAssist_LifeStamp;// 20165			����ʥӡ ������Ѫ
	uint32 PaladinAssist_ManaStamp;// 20166			�ǻ�ʥӡ ��������
	uint32 PaladinAssist_JusticeStamp;// 21084		����ʥӡ �������
	uint32 PaladinAssist_StunStamp;// 20164			����ʥӡ �������ʻ���
	uint32 PaladinAssist_ComStamp;// 20375			����ʥӡ ������ǿ(�ͽ�ϵ)
	uint32 PaladinAssist_Confession;// 20066			��� ����(�ͽ�ϵ)
	uint32 PaladinAssist_StunMace;// 10308			�Ʋ�֮�� ����
	uint32 PaladinAssist_ReviveMana;// 54428			����BUF
	uint32 PaladinAssist_HealCrit;// 20216			next���Ʊ���(��ʥϵ)
	uint32 PaladinAssist_LowMana;// 31842			������������(��ʥϵ)
	uint32 PaladinAssist_AuraUP;// 31821			�⻷Ч����ǿBUF(��ʥϵ)
	uint32 PaladinAssist_Dispel;// 4987				��ɢħ���ж�

	uint32 PaladinHeal_FastHoly;// 48785			ʥ������
	uint32 PaladinHeal_BigHoly;// 48782				ʥ����
	uint32 PaladinHeal_FullHoly;// 48788			ʥ��

	uint32 PaladinMelee_AOEOffertory;// 48819		����
	uint32 PaladinMelee_KillMace;// 48806			նɱ֮�� Ŀ�����20%Ѫ
	uint32 PaladinMelee_FlyShield;// 48827			����ɶ�(����ϵ)
	uint32 PaladinMelee_ShieldAtt;// 61411			���ƴ��(����ϵ)
	uint32 PaladinMelee_MaceAtt;// 53595			����֮��(����ϵ)
	uint32 PaladinMelee_HolyAtt;// 48825			��ʥ���(��ʥϵ)
	uint32 PaladinMelee_LifeJudge;// 20271			��������
	uint32 PaladinMelee_ManaJudge;// 53408			�ǻ�����
	uint32 PaladinMelee_FleeJudge;// 53407			��������
	uint32 PaladinMelee_WeaponAtt;// 35395			ʮ�־����(�ͽ�ϵ)
	uint32 PaladinMelee_HolyStrom;// 53385			��ʥ�籩(�ͽ�ϵ)
	uint32 PaladinMelee_BladeJustice;// 184575		Blade of Justice
	uint32 PaladinMelee_TemplarVerdict;// 85256		Templar's Verdict
	uint32 PaladinMelee_AvengingWrath;// 231895		Avenging Wrath

	uint32 PaladinFlag_MomentHoly;// 59578			ս������ ˲��ʥ��
	uint32 PaladinFlag_Discipline;// 25771			���� DEBUFF
};

#endif // !_BOT_PALADIN_AI_H
