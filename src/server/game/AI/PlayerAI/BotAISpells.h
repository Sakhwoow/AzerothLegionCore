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

#ifndef _BOT_AI_SPELLS_H_
#define _BOT_AI_SPELLS_H_

#include "ScriptSystem.h"
#include "BotAITool.h"

class BotWarriorSpells
{
public:
	void InitializeSpells(Player* player);

protected:
	uint32 WarriorIDLE_AOEAddLife = 45517;			// ����ŭ��
	uint32 WarriorIDLE_AOEAddPower = 27578;			// ��ǿŭ��

	uint32 WarriorWeapon_Status = 122990;
	uint32 WarriorDefance_Status = 71;
	uint32 WarriorRage_Status = 122989;

	uint32 WarriorCommon_PowerAtt = 25712;			// Ӣ�´��
	uint32 WarriorCommon_PowerThrow = 57755;			// Ӣ��Ͷ��
	uint32 WarriorCommon_PowerRelife = 184364;		// ��ŭ�ָ����п�ʱʹ�û�Ѫ��
	uint32 WarriorCommon_ClearCtrl = 18499;			// ��֮ŭ���Ƴ����ƣ�
	uint32 WarriorCommon_AOEFear = 65930;			// ��ս��ΧȺ�־�
	uint32 WarriorCommon_SweepAtt = 231833;			// ˳��ն
	uint32 WarriorCommon_AddPower = 173401;			// ��ŭ��
	uint32 WarriorCommon_AOEDecPower = 27579;		// Ⱥ�����ǿ��

	uint32 WarriorDefance_HPojia = 186688;			// ������
	uint32 WarriorDefance_Fuchou = 40392;			// ����
	uint32 WarriorDefance_ShieldBlock = 38031;		// ���Ƹ�
	uint32 WarriorDefance_ShieldAtt= 23922;			// �����ͻ�
	uint32 WarriorDefance_Pojia = 25051;				// �Ƽ�
	uint32 WarriorDefance_MaxLife = 12975;			// �Ƹ�����
	uint32 WarriorDefance_ShiledWall = 871;			// ��ǽ
	uint32 WarriorDefance_Disarm = 11879;				// ��е
	uint32 WarriorDefance_Support = 41198;			// Ԯ��
	uint32 WarriorDefance_Conk = 22427;				// �������
	uint32 WarriorDefance_AOEConk = 46968;			// ǰ����Χ����
	uint32 WarriorDefance_Pull = 355;				// ����

	uint32 WarriorWeapon_SwordStorm = 9632;			// ���з籩
	uint32 WarriorWeaponDefance_AOEAtt = 165749;		// ����һ��
	uint32 WarriorWeaponDefance_Bleed = 43931;		// ˺��
	uint32 WarriorWeaponDefance_SpellReflect = 57643;	// ��������
	uint32 WarriorWeaponDefance_ShieldHit = 149383;		// �ܻ���ʩ����ϣ�

	uint32 WarriorWeapon_HighThrow = 65940;			// ���޵�Ͷ��
	uint32 WarriorWeapon_Charge = 100;			// ���
	uint32 WarriorWeapon_Suppress = 7384;			// ѹ��
	uint32 WarriorWeapon_Backstorm = 22857;			// �����籩
	uint32 WarriorWeapon_DeadAtt = 27580;			// �������

	uint32 WarriorWeaponRage_FullKill = 5308;		// նɱ
	uint32 WarriorWeaponRage_WinAttack = 34428;		// ��ʤ׷��
	uint32 WarriorWeaponRage_Backfillet = 1715;		// �Ͻ�

	uint32 WarriorRage_Harsh = 12323;				// �̶�ŭ��
	uint32 WarriorRage_HeadAtt = 6552;				// ȭ����ʩ����ϣ�
	uint32 WarriorRage_Intercept = 20615;			// ����
	uint32 WarriorRage_Whirlwind = 12950;			// ����ն
	uint32 WarriorRage_Impertinency = 13847;			// ³ç
	uint32 WarriorRage_Needdead = 199261;			// ����֮Ը
	uint32 WarriorRage_Bloodthirsty = 39071;			// ��Ѫ
	uint32 WarriorRage_ReIntercept = 184364;			// ����ƶ����ƺͽ������CD
};

class BotPaladinSpells
{
public:
	void InitializeSpells(Player* player);

protected:
	uint32 PaladinIDLE_MountAura = 225454;			//�����ٶȹ⻷
	uint32 PaladinIDLE_CastAura = 81455;// 19746			ʩ���⻷
	uint32 PaladinIDLE_JudgeAura = 8990;// 54043			�ͽ�⻷
	uint32 PaladinIDLE_ArmorAura = 41105;// 48942			�����⻷
	uint32 PaladinIDLE_AOEGuardWish = 210256;// 25899			Ⱥ��ӻ�ף��(����ϵ)
	uint32 PaladinIDLE_GuardWish = 210256;// 20911			�ӻ�ף��(����ϵ)
	uint32 PaladinIDLE_AOEKingWish = 43223;// 25898			Ⱥ������ף��
	uint32 PaladinIDLE_KingWish = 56525;// 20217			����ף��
	uint32 PaladinIDLE_AOEWitWish = 203539;// 48938			Ⱥ���ǻ�ף��
	uint32 PaladinIDLE_WitWish = 175365;// 48936				�ǻ�ף��
	uint32 PaladinIDLE_AOEStrWish = 29381;// 48934			Ⱥ������ף��
	uint32 PaladinIDLE_StrWish = 56520;// 48932				����ף��
	uint32 PaladinIDLE_JusticeRage = 25780;// 25780			����֮ŭ ����ʹ��
	uint32 PaladinIDLE_Revive = 7328;// 48950				�������

	uint32 PaladinGuard_UnShield =29386;// 53601			��ʥ����
	uint32 PaladinGuard_FreeAura = 1044;// 1044			����ף��
	uint32 PaladinGuard_Invincible = 642;// 642			ʥ���� �޵�
	uint32 PaladinGuard_Sacrifice = 187190;// 6940			����֮�� Ŀ������ת��
	uint32 PaladinGuard_AOESacrifice = 13903;// 64205		��ʥ���� �Ŷ�����ת��(����ϵ)
	uint32 PaladinGuard_BlockShield = 31904;// 48952			��ʥ��(����ϵ)
	uint32 PaladinGuard_PhyImmune = 66009;// 10278			Ŀ����������
	uint32 PaladinGuard_Pull = 210487;// 62124				����

	uint32 PaladinAssist_UpPower = 31842;// 31884			����� UP�˺�
	uint32 PaladinAssist_RevengeStamp = 45095;// 31801		����ʥӡ ����5���˺����
	uint32 PaladinAssist_LifeStamp = 165745;// 20165			����ʥӡ ������Ѫ
	uint32 PaladinAssist_ManaStamp = 130433;// 20166			�ǻ�ʥӡ ��������
	uint32 PaladinAssist_JusticeStamp = 38008;// 21084		����ʥӡ �������
	uint32 PaladinAssist_StunStamp =50907;// 20164			����ʥӡ �������ʻ���
	uint32 PaladinAssist_ComStamp =13903;// 20375			����ʥӡ ������ǿ(�ͽ�ϵ)
	uint32 PaladinAssist_Confession =173315;// 20066			��� ����(�ͽ�ϵ)
	uint32 PaladinAssist_StunMace = 66863;// 10308			�Ʋ�֮�� ����
	uint32 PaladinAssist_ReviveMana =173521;// 54428			����BUF
	uint32 PaladinAssist_HealCrit =210294;// 20216			next���Ʊ���(��ʥϵ)
	uint32 PaladinAssist_LowMana =20271;// 31842			������������(��ʥϵ)
	uint32 PaladinAssist_AuraUP =31821;// 31821			�⻷Ч����ǿBUF(��ʥϵ)
	uint32 PaladinAssist_Dispel =4987;// 4987				��ɢħ���ж�

	uint32 PaladinHeal_FastHoly =19750;// 48785			ʥ������
	uint32 PaladinHeal_BigHoly =13952;// 48782				ʥ����
	uint32 PaladinHeal_FullHoly =9257;// 48788			ʥ��

	uint32 PaladinMelee_AOEOffertory = 251152;// 48819		����
	uint32 PaladinMelee_KillMace =37259;// 48806			նɱ֮�� Ŀ�����20%Ѫ
	uint32 PaladinMelee_FlyShield =31935;// 48827			����ɶ�(����ϵ)
	uint32 PaladinMelee_ShieldAtt =53600;// 61411			���ƴ��(����ϵ)
	uint32 PaladinMelee_MaceAtt =53595;// 53595			����֮��(����ϵ)
	uint32 PaladinMelee_HolyAtt =25914;// 48825			��ʥ���(��ʥϵ)
	// Confirmed against a real Legion 7.3.5 Retribution rotation guide (ru.wowhead ids
	// quoted directly in it) - the old hardcoded values below (now in the comment) never
	// resolved to anything a Legion character actually knows, so the whole rotation silently
	// cast nothing: PaladinMelee_LifeJudge/WeaponAtt/HolyStrom are Judgment/Crusader
	// Strike/Divine Storm, not the WotLK-era ids that were there before.
	uint32 PaladinMelee_LifeJudge = 20271;// was 31804			����(Judgment)
	uint32 PaladinMelee_ManaJudge =41368;// 53408			�ǻ�����
	uint32 PaladinMelee_FleeJudge =201371;// 53407			��������
	uint32 PaladinMelee_WeaponAtt = 35395;// was 213844		ʮ�־����(Crusader Strike)
	uint32 PaladinMelee_HolyStrom = 53385;// was 163888		��ʥ�籩(Divine Storm)
	// New fields (Retribution rotation had no slot for these at all before): second Holy
	// Power generator, single-target finisher, and the main DPS cooldown.
	uint32 PaladinMelee_BladeJustice = 184575;			// Blade of Justice
	uint32 PaladinMelee_TemplarVerdict = 85256;			// Templar's Verdict
	uint32 PaladinMelee_AvengingWrath = 231895;			// Avenging Wrath

	uint32 PaladinFlag_MomentHoly = 251152;// 59578			ս������ ˲��ʥ��
	uint32 PaladinFlag_Discipline =25771;// 25771			���� DEBUFF
};

class BotDeathknightSpells
{
public:
	void InitializeSpells(Player* player);

protected:
	uint32 DKStatus_Frost =50689;// 48263			��˪����
	uint32 DKStatus_Evil =50689;// 48265			а������
	uint32 DKStatus_Blood =50689;// 48266			��Ѫ����

	uint32 DKIDLE_Buffer =165762;// 57623			ȫ������������BUFF
	uint32 DKIDLE_SummonPet =52451;//	46584		�ٻ�ʳʬ��
	uint32 DKIDLE_SummonAllPets =52478;//	42650	�ٻ�ʳʬ������

	uint32 DKBlock_Silence =66018;// 47476			��ĬĿ��
	uint32 DKBlock_Cast =173047;// 47528			���ʩ��

	uint32 DKPulls_Pull =222409;// 56222			���峰��
	uint32 DKPulls_DKPull =53276;// 49576			����֮��

	uint32 DKDefense_MgcShield =19645;// 48707		��ħ����
	uint32 DKDefense_NoMgcArea =52893;// 51052		��ħ�����򣬶��Լ�ʩ�ţ������ڷ�ħ��(а��ϵ)
	uint32 DKDefense_Contract =48743;// 48743		ɱ��BB��Ѫ40%
	uint32 DKDefense_IceBody =66023;// 48792		DK��ǽ
	uint32 DKDefense_IceArmor =132103;// 51271		ͭǽ����(�ṩ���׺�����20��)(����ϵ)
	uint32 DKDefense_BoneShield =232049;// 49222	�׹�֮��(а��ϵ)

	uint32 DKAssist_RuneLife =59754;// 48982		����������ת������Ϊ����(��Ѫϵ)
	uint32 DKAssist_BloodBrand =206940;// 49005		��Ѫӡ�ǣ�Ŀ�깥����Ŀ���Ѫ(��Ѫϵ)
	uint32 DKAssist_Frenzied = 188541;// 49016		���ң���Ŀ�������˺�UP(��Ѫϵ)
	uint32 DKAssist_BloodBuf =55233;// 55233		�����Ƹ�����(��Ѫϵ)
	uint32 DKAssist_SummonRuneWeapon =49028;// 49028	�ٻ���������������ս��(��Ѫϵ)
	uint32 DKAssist_RuneWeapon =47568;// 47568		����ȫ���ģ�25��������
	uint32 DKAssist_Infect =91939;// 50842			Ŀ��ı�Ѫ������ɢ��Ⱦ
	uint32 DKAssist_RuneShunt =7122;// 45529		�������� Ѫ����ת��������
	uint32 DKAssist_IceLock=53534;// 45524		��������Ŀ��10�����ƶ��ٶȵ�
	uint32 DKAssist_DeadRevive =121147;// 49895		�������ƣ�����Ŀ���������ָ�
	uint32 DKAssist_NonFear =49039;// 49039		���������߿־��Ȼ�(����ϵ)
	uint32 DKAssist_NextCrit =79092;// 49796		������˪���������ɼ�������˪�������(����ϵ)
	uint32 DKAssist_EatIce =79092; //=79092// 49203			����֮��������10�뷶ΧĿ�꣬�Ǽ����˺����(����ϵ)
	uint32 DKAssist_PetPower =49206;// 63560		ʳʬ������(а��ϵ)
	uint32 DKAssist_SummonFlyAtt = 49206;// 49206	�ٻ���ը��(а��ϵ)

	uint32 DKAttack_IceSickness = 52372;// 49909	��˪������������ʱ�߳��
	uint32 DKAttack_NearAOE =92025;// 49941		��ս��ΧAOE����Ѫ�ͱ������˺�UP
	uint32 DKAttack_AreaAOE =43265;// 49938		��ή���㣬ָ����ΧAOE
	uint32 DKAttack_BloodAtt =60945;// 49930		��Ѫ�������м���ʱ�˺�UP
	uint32 DKAttack_ShadowAtt =50688;// 49921		��Ӱ�����Ѫ����
	uint32 DKAttack_FrostAtt =60951;// 55268		��˪���(����ϵ)
	uint32 DKAttack_DoDestroy =246593;// 51425		���ɼ��������˺�
	uint32 DKAttack_RuneAttack =62322;// 56815		���Ĵ��������ѹ��
	uint32 DKAttack_LifeAttack =53639;// 49924		�����ָ�������һ������5%Ѫ
	uint32 DKAttack_IceWindAtt =61061;// 51411		������(����ϵ)
	uint32 DKAttack_CorpseExplosion =17616;// 51328	ʬ��(а��ϵ)
	uint32 DKAttack_NaturalAtt =164330;// 55271		���ִ��(а��ϵ)
	uint32 DKAttack_CoreAtt =206930;// 55262		������(��Ѫϵ)
};

class BotRogueSpells
{
public:
	void InitializeSpells(Player* player);

protected:
	uint32 RogueGuard_Sneak =1784;// 1784				Ǳ��
	uint32 RogueGuard_ShadowCloak =31224;// 31224		��Ӱ����
	uint32 RogueGuard_Disappear =1856;// 26889		��ʧ
	uint32 RogueGuard_Dodge =248777;// 26669			����
	uint32 RogueGuard_Sprint =65864;// 11305			����

	uint32 RogueSneak_Stick =30980;// 51724			�ƹ�
	uint32 RogueSneak_Premeditate =235777;// 14183		Ԥı(����ϵ)
	uint32 RogueSneak_Ambush =8676;// 48691			����
	uint32 RogueSneak_Surprise =1833;// 1833			͵Ϯ

	uint32 RogueAssist_ShadowDance =185313;// 51713		��Ӱ֮��(����ϵ)
	uint32 RogueAssist_ShadowFlash =145426;// 36554		��Ӱ��(����ϵ)
	uint32 RogueAssist_ReadyCD =145426;// 14185			Ԥ��(����ϵ)
	uint32 RogueAssist_Blind =2094;// 2094			��ä
	uint32 RogueAssist_Disarm = 236077;// 51722			��е
	uint32 RogueAssist_NextCrit =213981;// 14177		��Ѫ next����(��ɱϵ)
	uint32 RogueAssist_blood =60177;// 51662			��Ѫ Ŀ����Ѫʱʩ��(��ɱϵ)
	uint32 RogueAssist_FastEnergy =13750;// 13750		�������ٻظ�(ս��ϵ)
	uint32 RogueAssist_BlockCast =1766;// 1766		���� ���ʩ��
	uint32 RogueAssist_Paralyze =1776;// 1776			��� ̱��Ŀ��
	uint32 RogueAssist_FastSpeed=33735;// 13877		�ӹ����ٶ�20(ս��ϵ)

	uint32 RogueAOE_Knife =51723;// 51723				���з���
	uint32 RogueAOE_AllDance =51723;// 51690			����ɱ��(ս��ϵ)

	uint32 RogueAttack_Blood =65954;// 48660			��Ѫ(����ϵ)
	// Confirmed via Wowhead/wiki cross-reference (2+ sources each, same discipline as Paladin/
	// Hunter this session): Mutilate/Shadowstrike/Envenom/Rupture/Eviscerate were all wrong -
	// live testing would've shown zero casts of any Assassination/Subtlety finisher or generator.
	// Sinister Strike(1752)/Backstab(53)/Kidney Shot(408) below were ALREADY correct - this
	// class needed id fixes only, not the structural rebuild Hunter needed (combo-point
	// generator/finisher split was already right).
	uint32 RogueAttack_Ghost = 185438;// was 123437		Shadowstrike (Subtlety generator)
	uint32 RogueAttack_Injure = 1329;// was 31022			Mutilate (Assassination generator)
	uint32 RogueAttack_PoisonAtt =76511;// 5938		����
	uint32 RogueAttack_BackAtt =53;// 48657			���� (confirmed: real Backstab)
	uint32 RogueAttack_EvilAtt =1752;// 48638			а�񹥻� (confirmed: real Sinister Strike)

	uint32 RogueAttack_Damage = 2098;// was 196819		Eviscerate (generic finisher)
	uint32 RogueAttack_Separate = 1943;// was 1079		Rupture (bleed finisher)
	uint32 RogueAttack_Stun =408;// 8643				���� (confirmed: real Kidney Shot)
	uint32 RogueAttack_PoisonDmg = 32645;// was 145416	Envenom (Assassination finisher - unknown
														// to other specs, safely skipped if not)
	uint32 RogueAttack_Incision =5171;// 6774			�и�(�����ٶ��սἼ)
	uint32 RogueRange_Throw =158692;// 48674			����Ͷ��

	uint32 RogueFlag_Dance =185313;// 51713				��Ӱ֮����
};

class BotDruidSpells
{
public:
	void InitializeSpells(Player* player);

protected:
	uint32 DruidIDLE_FerityWish =24752;// 48469		Ұ��ף��
	uint32 DruidIDLE_AOEFerityWish =165754;// 48470		Ⱥ��Ұ��ף��
	uint32 DruidIDLE_Revive =50769;// 50769			�������
	uint32 DruidIDLE_CombatReive =20484;// 20484		ս���������

	uint32 DruidStatus_Travel =783;// 783			������̬
	uint32 DruidStatus_Bear =5487;// 9634				������̬
	uint32 DruidStatus_Cat =768;// 768				�Ա���̬
	uint32 DruidStatus_Bird =24858;// 24858			������̬(ƽ��ϵ)
	uint32 DruidStatus_Tree =33891;// 33891			������̬(�ָ�ϵ)

	uint32 DruidGuard_Sneak =5215;// 5215				�Ա�Ǳ��
	uint32 DruidGuard_Harden =182872;// 22812			��Ƥ�� ����20%
	uint32 DruidGuard_Thorns =209334;// 53307			������ ��������
	uint32 DruidGuard_AutoTwine =66071;// 53312		�ܻ�����Ŀ��
	uint32 DruidGuard_Twine =339;// 53308			����Ŀ��
	uint32 DruidGuard_Control =33786;// 33786			���� ����Ŀ��Ŀ�����
	uint32 DruidGuard_Pofu =61336;// 61336				Ұ����̬�Ƹ�����(Ұ��ϵ)
	uint32 DruidGuard_TreeMan =6913;// 33831			��Ȼ֮���ٻ�����(ƽ��ϵ)

	uint32 DruidAssist_PersonSpirit =13752;// 770		����̬����֮��
	uint32 DruidAssist_BeastSpirit =13752;// 16857		Ұ����̬����֮��
	uint32 DruidAssist_Active =6950;// 29166			���� Ŀ�����
	uint32 DruidAssist_DecCruse =30281;// 2782			��³���������
	uint32 DruidAssist_DecCruel =14253;// 2893			��³���ⶾ��BUF

	uint32 DruidCast_Moonfire =65856;// 48463			�»� �����˺�����
	uint32 DruidCast_Insect =65855;// 48468			��Ⱥ �����˺�����(ƽ��ϵ)
	uint32 DruidCast_Anger =65862;// 48461				��ŭ
	uint32 DruidCast_Spark =98993;// 48465				�ǻ� cast��

	uint32 DruidAOE_Hurricane=55881;// 48467			쫷� AOE
	uint32 DruidAOE_Typhoon =51817;// 61384			̨�� AOE(ƽ��ϵ)
	uint32 DruidAOE_FallStar =100806;// 48505			Ⱥ��׹�� AOE(ƽ��ϵ)

	uint32 DruidHeal_Nourishing =63556;// 50464		�̲��� С�����Ѫ �г�������Ч��ʱ��ǿ
	uint32 DruidHeal_Relife =774;// 48441			�ش��� С������Ѫ
	uint32 DruidHeal_Coalescence =66067;// 48443		������ С��Ѫ
	uint32 DruidHeal_Touch =5185;// 48378				����֮�� ���Ѫ
	uint32 DruidHeal_LifeBurst =57763;// 48451			�������� ����Ч������ʱ�ټ�Ѫ
	uint32 DruidHeal_MergerLife =18562;// 18562		Ѹ������ �̲��ش������� ��Ѫ(�ָ�ϵ)
	uint32 DruidHeal_MomentHeal =127316;// 17116		��Ȼ֮�� nextHealʩ��˲��(�ָ�ϵ)

	uint32 DruidHeal_AOETranquility =740;// 48447		����
	uint32 DruidHeal_AOEFerity =173170;// 53251			Ұ��Ⱥ������(�ָ�ϵ)

	uint32 DruidCat_Stun =203123;// 49802				è ���� �սἼ
	uint32 DruidCat_Bite =22568;// 48577				è ����ҧ �����˺��սἼ
	uint32 DruidCat_Roar =52610;// 52610				è ���� ���Լ����˺����սἼ
	uint32 DruidCat_Separate =1943;// 49800			è ���� �����˺��սἼ

	uint32 DruidCat_Tiger=5217;// 50213				è �ͻ�֮ŭ �˺�BUF
	uint32 DruidCat_FastMove =1850;// 33357			è ����
	uint32 DruidCat_Charge =16979;// 49376				è ���(Ұ��ϵ)
	uint32 DruidCat_Surprise =75008;// 49803			è Ǳ��ʱ��1������
	uint32 DruidCat_Sack =201427;// 48579				è Ǳ��ʱ��1���˺�
	uint32 DruidCat_Claw =91776;// 48570				è צ��
	uint32 DruidCat_BackStab =5221;// 48572			è ����
	uint32 DruidCat_Attack =26103;// 62078				è �ӻ�Ⱥ��
	uint32 DruidCat_Sweep =1822;// 48574				è ��Ѫ����
	uint32 DruidCat_Laceration =19820;// 48566			è ����(Ұ��ϵ)

	uint32 DruidBear_DecAtt = 10968;// 48560			�� ����ǿ��
	uint32 DruidBear_AddPower =8599;// 5229			�� ��ŭ��
	uint32 DruidBear_PowerLife =22842;// 22842			�� ŭ����Ѫ
	uint32 DruidBear_Laceration =22689;// 48564		�� ����(Ұ��ϵ)
	uint32 DruidBear_Sweep =61896;// 48568				�� ��Ѫ����
	uint32 DruidBear_Attack =61598;// 48562			�� �ӻ�Ⱥ��
	uint32 DruidBear_NextAtt =6807;// 48480			�� Next������ǿ
	uint32 DruidBear_Stun =1464;// 8983				�� ����
	uint32 DruidBear_Charge =39435;// 16979			�� ���(Ұ��ϵ)
};

class BotHunterSpells
{
public:
	void InitializeSpells(Player* player);

protected:
	uint32 HunterIDLE_SummonPet =23498;// 883			�ٻ�����
	uint32 HunterIDLE_RevivePet =982;// 982			�������
	uint32 HunterIDLE_ManaAura =210754;// 34074			���������ػ�
	uint32 HunterIDLE_DodgeAura =210753;// 13163		�����ػ�
	uint32 HunterIDLE_EagleAura =231555;// 27044		����ػ�
	uint32 HunterIDLE_DragonAura =210752;// 61847		��ӥ�ػ� ����������ػ�
	uint32 HunterIDLE_ShotAura =31519;// 19506			ǿ���⻷(���ϵ)

	uint32 HunterTrap_FarFrozen =209789;// 60192		Զ�̱�������
	uint32 HunterTrap_Frozen =43447;// 14311			��������
	uint32 HunterTrap_Ice =165769;// 13809				��˪����
	uint32 HunterTrap_Viper =43449;// 34600			��������
	uint32 HunterTrap_Explode =43444;// 49067			��ը����
	uint32 HunterTrap_Fire =155623;// 49056				��������
	uint32 HunterTrap_Shot=80003;// 63672				���Ǽ�(����ϵ)

	uint32 HunterAssist_ClearRoot =53271;// 53271		�Ƴ�����
	uint32 HunterAssist_PetCommand =205440;// 34026		����ɱ��
	uint32 HunterAssist_HealPet =37381;// 48990		��������
	uint32 HunterAssist_PetStun =7093;// 19577		�������Ŀ��(Ұ��ϵ)
	uint32 HunterAssist_PetRage =19574;// 19574		������Լ���(Ұ��ϵ)
	uint32 HunterAssist_Stamp =1130;// 53338			����ӡ��
	uint32 HunterAssist_FalseDead =5384;// 5384		����
	uint32 HunterAssist_BackJump =781;// 781			����
	uint32 HunterAssist_FastSpeed =3045;// 3045		�������BUF
	uint32 HunterAssist_ReadyCD =203551;// 23989		׼������CD(���ϵ)
	uint32 HunterAssist_Mislead =34477;// 34477		��

	uint32 HunterMelee_BackRoot = 116599;// 48999		�мܺ󷴻�����(����ϵ)
	uint32 HunterMelee_NoDamage =31567;// 19263		���� �޷�����
	uint32 HunterMelee_DecSpeed = 195645;// 2974			ˤ�� ��ս���ƶ���
	uint32 HunterMelee_NextAtt =31566;// 48996			next��ս������ǿ
	// HunterMelee_MeleeAtt's old value (190928) already matched real Legion Mongoose Bite - kept
	// as-is, just renamed in spirit by the new fields around it. Legion's Survival rework made
	// this spec melee (polearm), which FieldHunterAI::ProcessMeleeSpell never implemented at all
	// (empty function, confirmed by reading it) - these are new, not fixes of something broken.
	// Confirmed via multiple sources (Kill Command/Kill Shot/Bestial Wrath/Marked Shot
	// cross-checked against 2+ independent sites each); Flanking Strike's id is the one field
	// here with lower confidence - no clean Legion-era-specific source found, used the best
	// candidate from a Hunter wiki page. FindMaxRankSpellByExist/TryCastFirstKnown already fail
	// safe (skip to the next ability) if this turns out wrong, so the risk of including it is low.
	uint32 HunterMelee_MeleeAtt =190928;// 53339		��ս���� (confirmed: real Mongoose Bite)
	uint32 HunterMelee_RaptorStrike = 186270;			// Raptor Strike
	uint32 HunterMelee_Carve = 187708;					// Carve (AoE)
	uint32 HunterMelee_FlankingStrike = 269751;		// Flanking Strike - lower confidence, see above

	uint32 HunterDebug_Damage =160503;// 49001			�˺�����
	uint32 HunterDebug_Mana =31407;// 3034				��������
	uint32 HunterDebug_Sleep =19386;// 49012			��˯����(����ϵ)

	uint32 HunterShot_AOEShot =22908;// 58434			AOE���
	uint32 HunterShot_CharmShot =23601;// 19503		������(����ϵ)
	uint32 HunterShot_Explode =15495;// 60053			��ը���(����ϵ)
	// Aimed Shot/Arcane Shot/Kill Shot were all wrong - confirmed live, zero casts of any
	// Hunter ranged rotation spell. HunterShot_MgcShot and HunterShot_KillShot both pointed at
	// the exact same literal id (69989), a copy-paste bug - neither was the real spell either.
	// Real ids confirmed via Wowhead/wiki cross-reference (see class comment above for sourcing
	// notes). HunterShot_MulShot (2643, Multi-Shot) was ALREADY correct - left untouched.
	uint32 HunterShot_Aim = 19434;// was 48871			��׼���(���ϵ) - Aimed Shot
	uint32 HunterShot_Silence =248919;// 34490			��Ĭ���(���ϵ)
	uint32 HunterShot_Shock = 5116;// 5116				�����
	uint32 HunterShot_Cast =65867;// 49052				�ȹ���� ʩ��ʱ������
	uint32 HunterShot_MgcShot = 3044;// was 69989			������� - Arcane Shot
	uint32 HunterShot_KillShot = 53351;// was 69989		��ɱ��� Ŀ��20%����Ѫնɱʽ��� - Kill Shot
	uint32 HunterShot_MulShot =2643;// 49048			ȷ����ȷ - Multi-Shot
	uint32 HunterShot_QMLShot =53209;// 53209			���������(���ϵ)

	// New fields - no existing slot for these at all before.
	uint32 HunterShot_KillCommand = 34026;				// Kill Command (BM core)
	uint32 HunterShot_CobraShot = 77767;				// Cobra Shot (BM focus generator)
	uint32 HunterShot_MarkedShot = 185901;				// Marked Shot (MM, during Vulnerable)
	uint32 HunterShot_HuntersMark = 1130;				// Hunter's Mark (MM, classic tracking debuff, maintained as a buff)
	// Bestial Wrath (BM cooldown) is already correctly 19574 under HunterAssist_PetRage above -
	// reused as-is rather than duplicating a field with the identical value.
};

class BotShamanSpells
{
public:
	void InitializeSpells(Player* player);

protected:
	uint32 ShamanIDLE_LifeWeapon =32911;// 51994		��������
	uint32 ShamanIDLE_IceWeapon =78273;// 58796		��˪����
	uint32 ShamanIDLE_FireWeapon =160098;// 58790		��������
	uint32 ShamanIDLE_PhyWeapon =159974;// 10399		ʯ������
	uint32 ShamanIDLE_FastWeapon =32911;// 58804		��ŭ����
	uint32 ShamanIDLE_Revive =2008;// 49277			�������

	uint32 ShamanShield_Earth =226078;// 49284			���֮��(�ָ�ϵ)
	uint32 ShamanShield_Water =79949;// 57960			ˮ֮��
	uint32 ShamanShield_Lightning =20545;// 49281		����֮��

	uint32 ShamanAssist_Frog =11641;// 51514			��������
	uint32 ShamanAssist_HealCrit =137531;// 55198		next3�������Ʊ���(�ָ�ϵ)
	uint32 ShamanAssist_MomentHeal =127316;// 16188		nextHealʩ��˲��(�ָ�ϵ)
	uint32 ShamanAssist_MomentCast =16166;// 16166		nextCastʩ��˲��(Ԫ��ϵ)
	uint32 ShamanAssist_BlockCast =52870;// 57994		���ʩ��
	uint32 ShamanAssist_Cleansing =370;// 8012		����Ŀ��2��BUFF
	uint32 ShamanAssist_FireNova =11969;// 61657		�û���ͼ��AOEһ��
	uint32 ShamanAssist_Heroic =32182;// 32182			����Ӣ��
	uint32 ShamanAssist_DecCruel =14253;// 526			�����ⶾ �⼲��

	uint32 ShamanAtt_StormStrike =17364;// 17364		�籩���(��ǿϵ)
	uint32 ShamanAtt_FireStrike =60103;// 60103		���Ҵ��(��ǿϵ)

	uint32 ShamanCast_LightningArrow =218013;// 49238	�����
	uint32 ShamanCast_LightningChain =190332;// 49271	������
	uint32 ShamanCast_LightningStorm =71935;// 59159	����籩(Ԫ��ϵ)
	uint32 ShamanCast_FireThud =23038;// 49233			�������
	uint32 ShamanCast_IceThud =22582;// 49236			��˪���
	uint32 ShamanCast_EarthThud =43305;// 49231		������
	uint32 ShamanCast_FireStrike =58972;// 60043		���Ҵ�� Զ�̷���

	uint32 ShamanHealth_Fast =71985;// 49276			��������
	uint32 ShamanHealth_Bast =253330;// 49273			��������
	uint32 ShamanHealth_Chain =237925;// 55459			������
	uint32 ShamanHealth_Torrent =237920;// 61301		���� ˲��С����+��������(�ָ�ϵ)
	uint32 ShamanDispel_Refine =234893;// 51886			��ɢ

	uint32 ShamanTotem_Recycle=5394;// 36936			����ͼ��

	uint32 ShamanTotem_Life=35199;// 58757			����ͼ��
	uint32 ShamanTotem_Mana =24854;// 58774			����ͼ��
	uint32 ShamanTotem_BMana=24854;// 16190			����ͼ��

	uint32 ShamanTotem_SummonFire = 27623;// 2894		�ٻ���Ԫ��ͼ��
	uint32 ShamanTotem_MgcPower = 31985;// 57722		��������ͼ��(Ԫ��ϵ)
	uint32 ShamanTotem_Attack = 38116;// 58704			�������湥��ͼ��
	uint32 ShamanTotem_AOEAttack = 39591;// 58734		��������Ⱥ��ͼ��
	uint32 ShamanTotem_MgcHeal =31633;// 58656			��������������Ч��ͼ��

	uint32 ShamanTotem_DecMove =51485;// 2484			���ƶ��ٶ�ͼ��
	uint32 ShamanTotem_SummonSoil =73903;// 2062		�ٻ���Ԫ��ͼ��
	uint32 ShamanTotem_PhyPower = 65992;// 58643		��������ͼ��
	uint32 ShamanTotem_Armor = 73393;// 58753			����ͼ��

	uint32 ShamanTotem_AbsorbBuff = 148819;// 8177		�����к�BUFFͼ��
	uint32 ShamanTotem_AttSpeed =27621;// 8512			��ս�����ٶ�ͼ��
	uint32 ShamanTotem_MgcSpeed =27621;// 3738			����ʩ���ٶ�ͼ��

	uint32 ShamanFlag_NoHeroic = 27621;// 57723			�޷�giveӢ��״̬��ʶ
};

class BotMageSpells
{
public:
	void InitializeSpells(Player* player);

protected:
	uint32 MageIDLE_ManaGem =36883;// 42985		������ʯ
	uint32 MageIDLE_ArcaneMagic =13326;// 42995	�����ǻ�
	uint32 MageIDLE_AOEArcaneMagic = 129171;// 43002	ȫ������ǻ�
	uint32 MageIDLE_MgcArmor =164309;// 43024		ħ����
	uint32 MageIDLE_FrostArmor =79563;// 43008		������
	uint32 MageIDLE_IceArmor =165743;// 7301		˪����
	uint32 MageIDLE_FireArmor =35915;// 43046		����װ��
	uint32 MageIDLE_MagicAdd =70408;// 43017		ħ����Ч
	uint32 MageIDLE_MagicDec =44475;// 43015		ħ��ѹ��
	uint32 MageIDLE_SummonRite =43987;// 58659		�ٻ�����

	uint32 MageGuard_MagicShield =56778;// 43020	��������
	uint32 MageGuard_FrostShield =201565;// 43039	��������
	uint32 MageGuard_FrostScherm =41590;// 45438	��������
	uint32 MageGuard_FrostNova =64919;// 42917		��������
	uint32 MageGuard_FireBreath =31661;// 42950	��֮��Ϣ
	uint32 MageGuard_FireNova =11969;// 42945		��������

	uint32 MageAssist_Mirror =166894;// 55342		��ʦ����
	uint32 MageAssist_Rouse =12051;// 12051		����
	uint32 MageAssist_Stealth =66;// 66			������
	uint32 MageAssist_Teleport =14514;// 1953		������
	uint32 MageAssist_DecCurse =15729;// 475		�������
	uint32 MageAssist_Grace =29976;// 12043		��������
	uint32 MageAssist_ArcanePower =12042;// 12042	����ǿ��
	uint32 MageAssist_CastSpeed =12472;// 12472	����Ѫ��
	uint32 MageAssist_FastColddown =235219;// 11958	���ñ�ϵ����CD
	uint32 MageAssist_FrostPet =31687;// 31687		�ٻ�ˮԪ��
	uint32 MageAssist_FireCritAura =19428;// 11129	����3�����ӻ��汩��AURA

	uint32 MageConfine_BreakCast =29443;// 2139	��������
	uint32 MageConfine_AuraSteal =30449;// 30449	BUFF͵ȡ
	uint32 MageConfine_ArcaneSlow =246;// 31589	��������
	uint32 MageConfine_ToSheep =118;// 12826		����
	uint32 MageConfine_Freeze =79130;// 44572		���ᱻ������Ŀ��

	uint32 MageAOE_ArcaneExplode =9433;// 42921	������ը
	uint32 MageAOE_Snowstorm =15783;// 42940		����ѩ
	uint32 MageAOE_IcePiton =12557;// 42931		��׶��
	uint32 MageAOE_FireStorm =13899;// 42926		����籩

	uint32 MageArcane_Barrage =44425;// 44781		������Ļ
	uint32 MageArcane_Bullet =5143;// 42846		�����ɵ�
	uint32 MageArcane_ArcaneShock =16067;// 42897	�������

	uint32 MageFrost_IceArrow =9672;// 42842		������
	uint32 MageFrost_IceLance =43571;// 42914		��ǹ
	uint32 MageFrost_FFArrow =70616;// 47610		˪���

	uint32 MageFire_FireArrow =133;// 42833		������
	uint32 MageFire_FireShock =15574;// 42873		������
	uint32 MageFire_Firing =2948;// 42859			����
	uint32 MageFire_BigFireBall =33051;// 42891	�����
	uint32 MageFire_FireBomb =178551;// 55360		����ը��

	uint32 MagePet_FrostNova =40875;// 33395		ˮ������������

	uint32 MageFlag_FireStun =201565;// 64343		Aura:���Ի�����
	uint32 MageFlag_FastFStorm =201565;// 54741		Aura:����籩˲��
	uint32 MageFlag_FastBFBall =201565;// 48108		Aura:˲�������
	uint32 MageFlag_FastFFArrow =201565;// 57761	Aura:˲��˪���
	uint32 MageFlag_CanFrozen =201565;// 74396		Aura:Ŀ�굱�ɱ�����״̬
	uint32 MageFlag_Scherm =201565;// 45438			Aura:����״̬��
};

class BotWarlockSpells
{
public:
	void InitializeSpells(Player* player);

protected:
	uint32 WarlockIDLE_LowArmor =20798;// 696			�ͼ�����
	uint32 WarlockIDLE_Armor = 13787;// 47889			�м�����
	uint32 WarlockIDLE_HighArmor = 44520;// 47893		�߼�����
	uint32 WarlockIDLE_SoulLink =79957;// 19028		�����������(��ħϵ)
	uint32 WarlockIDLE_ShadowShield =53915;// 47891		��Ӱ��
	uint32 WarlockIDLE_SummonFireDemon =688;// 688	�ٻ�С��
	uint32 WarlockIDLE_SummonHollowDemon =697;// 697	�ٻ����
	uint32 WarlockIDLE_SummonSuccubus =712;// 712		�ٻ���ħ
	uint32 WarlockIDLE_SummonDogDemon =691;// 691		�ٻ���Ȯ
	uint32 WarlockIDLE_SummonGuardDemon =30146;// 30146	�ٻ���������
	uint32 WarlockIDLE_FastSummon =53915;// 18708		�����ٻ�(��ħϵ)
	uint32 WarlockIDLE_OpenGate =48018;// 48018		�������ͷ���
	uint32 WarlockIDLE_TeleGate =48020;// 48020		˲�Ƶ����ͷ���
	uint32 WarlockIDLE_SummonRite =60429;// 29893		�����ʽ

	uint32 WarlockDemon_ToDemon =54840;// 47241		�������ħ
	uint32 WarlockDemon_Charge =104205;// 54785			��ħ���
	uint32 WarlockDemon_MeleeAOE =215559;// 50581		��ħ˳��ն
	uint32 WarlockDemon_Sacrifice =192502;// 50589		��ħ�׼�

	uint32 WarlockAssist_DemonPower =193396;// 47193		ǿ���ٻ��Ķ�ħ(��ħϵ)
	uint32 WarlockAssist_ExtractMana =108416;// 59092	�������ϳ���(ʹ��ϵ)
	uint32 WarlockAssist_ConvertMana =1454;// 57946	�������� Ѫת��
	uint32 WarlockAssist_StealLife =12693;// 47857		��ȡ����
	uint32 WarlockAssist_StealMana =17008;// 5138		��ȡ����
	uint32 WarlockAssist_BaseFear =12096;// 6215		�־���
	uint32 WarlockAssist_FastFear =6789;// 47860		��������
	uint32 WarlockAssist_AOEFear =5484;// 17928		Ⱥ��־���

	uint32 WarlockAOE_MeleeFire=22539;// 61290		��սǰ��AOE
	uint32 WarlockAOE_RainFire =16005;// 47820			������AOE
	uint32 WarlockAOE_ShadowRage =39082;// 47847		��Ӱ֮ŭAOEȺ�����(����ϵ)

	uint32 WarlockCurse_UpDmg =79956;// 47865			Ԫ���˺��������
	uint32 WarlockCurse_MoveLow=29539;// 18223		ƣ������ �ƶ��ٶȽ���(ʹ��ϵ)
	uint32 WarlockCurse_MgcDmg =14868;// 47864			ʹ������ DOT�˺�
	uint32 WarlockCurse_MeleeLow =8552;// 50511		�������� ��ǿ����
	uint32 WarlockCurse_CastLow =12889;// 11719		�������� ʩ��ʱ���ӳ�

	uint32 WarlockDot_LeechSoul =48181;// 59164		�ǻ���(ʹ��ϵ)
	uint32 WarlockDot_HighDmg =30108;// 47843			ʹ�ද��(ʹ��ϵ)
	uint32 WarlockDot_LowDmg =172;// 47813			������
	uint32 WarlockDot_AOEDmg =32863;// 47836			�������� dot��Χ�˺�
	uint32 WarlockDot_Sacrifice =15505;// 47811		�����׼�

	uint32 WarlockCast_ShadowArrow =9613;// 47809		��Ӱ֮��
	uint32 WarlockCast_ShadowShock =131792;// 47827		��Ӱ���24��(����ϵ)
	uint32 WarlockCast_ChaosArrow =79939;// 59172		����֮��(����ϵ)
	uint32 WarlockCast_FullBurn =41960;// 47838		ȼ�� ���׼�ʱ��ǿЧ��(����ϵ)
	uint32 WarlockCast_FireBurn =19428;// 17962		���� �����׼�(����ϵ)
	uint32 WarlockCast_BigFireBall =131381;// 47825		�������

	uint32 WarlockPetDemon_Charge =225417;// 47996		��ħpet���
	uint32 WarlockPetDemon_Melee =161703;// 47994		��ħpet˳��ն
	uint32 WarlockPetDog_MagicBuf =69994;// 57567		��Ȯpet�Ŷ�BUF
	uint32 WarlockPetDog_EatMgc =19505;// 48011		��Ȯpet��ʳħ��
	uint32 WarlockPetDog_Bite =138750;// 54053			��Ȯpetҧ��
	uint32 WarlockPetDog_Silence =67519;// 19647		��Ȯpet��Ĭ
	uint32 WarlockPetSuccubus_Lash =15968;// 47992		��ħpet�޴�
	uint32 WarlockPetSuccubus_Sneak =12845;// 7870		��ħpetǱ��
	uint32 WarlockPetSuccubus_Charm =36241;// 6358		��ħpet�Ȼ�
	uint32 WarlockPetGhost_Shield =18968;// 47983		С��pet���
	uint32 WarlockPetGhost_Sneak =169009;// 4511		С��petǱ��
	uint32 WarlockPetGhost_Stamp =244189;// 47982		С��petѪӡ��
	uint32 WarlockPetGhost_FireArrow =9057;// 47964	С��pet�����

	uint32 WarlockFlag_SoulItem =6265;// 6265			�����Ƭ����
	uint32 WarlockFlag_SoulLink =79957;// 25228		�����������BUF
	uint32 WarlockFlag_OpenGate =48018;// 48018		���ͷ���BUF
	uint32 WarlockFlag_Sacrifice =223061;// 50589		��ħ�׼�BUF
};

class BotPriestSpells
{
public:
	void InitializeSpells(Player* player);

protected:
	uint32 PriestIDLE_AllHardRes =43939;// 48162			ȫ�����
	uint32 PriestIDLE_HardRes =23948;// 48161				�������
	uint32 PriestIDLE_SoulFire =48168;// 48168				����֮��
	uint32 PriestIDLE_AllSpiritRes =43939;// 48074			ȫ�徫��
	uint32 PriestIDLE_SpiritRes =23948;// 48073			���徫��
	uint32 PriestIDLE_Bloodsucker =15286;// 15286			��Ѫ��ӵ��
	uint32 PriestIDLE_AllShadowRes =53915;// 48170			ȫ�尵Ӱ����
	uint32 PriestIDLE_ShadowRes =53915;// 48169			���尵Ӱ����
	uint32 PriestIDLE_ShadowStatus =16592;// 15473			��Ӱ��̬
	uint32 PriestIDLE_Revive =2006;// 48171				�������

	uint32 PriestGuard_ShadowFear =34984;// 64044			����־�(��Ӱϵ)
	uint32 PriestGuard_AOEFear =8122;// 10890				��ս��ΧȺ�־�
	uint32 PriestGuard_DefFear =65544;// 6346				���־���
	uint32 PriestGuard_RecoverMana =65544;// 47585			��Ӱ����������(��Ӱϵ)
	uint32 PriestGuard_DmgAnnul =33206;// 33206			ʹ��ѹ��(����ϵ)
	uint32 PriestGuard_DefShield =17;// 48066			������ ��
	uint32 PriestGuard_SelfHealth =19236;// 48173			�������� �Լ�˲������(��ʥϵ)
	uint32 PriestGuard_GuardSoul =47788;// 47788			����ػ� target����ʱ�ػ�(��ʥϵ)

	uint32 PriestAssist_SoulAbs =196762;// 14751			����רעnext0����(����ϵ)
	uint32 PriestAssist_AddHolyPower =10060;// 10060		����ע��targetʩ�����ٺͱ���(����ϵ)
	uint32 PriestAssist_AllDispel =4526;// 32375			ȫ����ɢħ��
	uint32 PriestAssist_Dispel =528;// 988				������ɢħ��
	uint32 PriestAssist_ShadowDemon =10060;// 34433			��Ӱ��ħ
	uint32 PriestAssist_Silence =8988;// 15487			��Ӱ��Ĭ(��Ӱϵ)
	uint32 PriestAssist_AllResMana =64843;// 64901			����ȫ�����
	uint32 PriestAssist_AllResLife =64843;// 64843			����ȫ���Ѫ
	uint32 PriestAssist_DecIllness =3592;// 552			������ɢ������BUF

	uint32 PriestDebuf_Ache =11639;// 48125				ʹ
	uint32 PriestDebuf_Drown =41375;// 48158				��
	uint32 PriestDebuf_Plague =138490;// 48300				����

	uint32 PriestAOE_ShadowExplode =32000;// 53023			��Ӱ��ըAOE(��Ӱϵ)
	uint32 PriestAOE_HolyNova =20694;// 48078				��ʥ����

	uint32 PriestShadow_ShadowTouch =18152;// 48160			��Ѫ֮��(��Ӱϵ)
	uint32 PriestShadow_Knocking =17194;// 48127			������
	uint32 PriestShadow_Lech =15407;// 48156				�����̢(��Ӱϵ)
	uint32 PriestHoly_Smite =585;// 48123				�ͻ�
	uint32 PriestHoly_BigFire =17141;// 48135				��ʥ֮��
	uint32 PriestPrecept_ManaBurn =2691;// 8129			����ȼ��

	uint32 PriestHeal_ZeroHeal =29170;// 2050				�μ�����
	uint32 PriestHeal_LowHeal =8812;// 6064				�ͼ�����
	uint32 PriestHeal_Resume =27606;// 48068				�ָ�
	uint32 PriestHeal_FastHeal =27608;// 48071				��������
	uint32 PriestHeal_BigHeal =34119;// 48063				������
	uint32 PriestHeal_LinkHeal =32546;// 48120				�����Լ���Ŀ������
	uint32 PriestHeal_UnionHeal =225275;// 48113			���ϵ��� target next heal
	uint32 PriestHeal_RingHeal =49306;// 48089				����֮��(��ʥϵ)
	uint32 PriestHeal_AOEHeal =596;// 48072				���Ƶ��� aoe heal
	uint32 PriestHeal_Awareness =47540;// 53007			���� ����3�������ӵ�����Ŀ��(����ϵ)

	uint32 PriestFlag_DeadSoul =20711;// 27827				����֮�� ����������
	uint32 PriestFlag_NonShield =6788;// 6788				���Զ�DEBUFF
};

#endif // !_BOT_AI_SPELLS_H_
