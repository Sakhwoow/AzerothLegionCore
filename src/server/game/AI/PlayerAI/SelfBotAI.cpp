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
#include "BotAiObjectContext.h"
#include "BotValue.h"
#include "BotEngine.h"
#include "SelfBotStrategies.h"
#include "SelfBotClassRotation.h"
#include <algorithm>
#include <cctype>
#include <cstdlib>

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

	EnsureSelfBotStrategiesRegistered();
	m_Context = std::make_unique<BotAiObjectContext>(me);
	m_Engine = std::make_unique<BotEngine>(me, m_Context.get());
	m_Engine->AddStrategy("heal");
	m_Engine->AddStrategy("rotation");
	m_Engine->AddStrategy("buff");
	m_Engine->AddStrategy("autogear");
	m_Engine->AddStrategy("follow");
}

SelfBotAI::~SelfBotAI() { }

void SelfBotAI::SetHealEnabled(bool enabled)
{
	if (enabled)
		m_Engine->AddStrategy("heal");
	else
		m_Engine->RemoveStrategy("heal");
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

	// One well-known, long-stable self-buff base id per class - same "hand-picked classic rank
	// 1 id, resolved via FindMaxRankSpellByExist" convention as the two tables above, not pulled
	// from BotAISpells.h's Legion-specific per-spec tables. No entry for Rogue - classic rogues
	// have no real self-buff spell (poisons need reagents/weapon-application handling, out of
	// scope here). Confidence follows the same pattern as the heal table: these are the
	// well-documented classic ids for each spell, not yet individually confirmed against a live
	// character of every class on this fork.
	std::vector<uint32> const& GetClassBuffBaseSpells(uint8 cls)
	{
		static std::vector<uint32> const warrior = { 6673 };      // Battle Shout
		static std::vector<uint32> const paladin = { 20217 };     // Blessing of Kings
		static std::vector<uint32> const hunter = { 13165 };      // Aspect of the Hawk
		static std::vector<uint32> const priest = { 1243 };       // Power Word: Fortitude
		static std::vector<uint32> const deathKnight = { 57330 }; // Horn of Winter
		static std::vector<uint32> const shaman = { 324 };        // Lightning Shield
		static std::vector<uint32> const mage = { 1459 };         // Arcane Intellect
		static std::vector<uint32> const warlock = { 687 };       // Demon Armor
		static std::vector<uint32> const druid = { 1126 };        // Mark of the Wild
		static std::vector<uint32> const none;

		switch (cls)
		{
		case 1: return warrior;
		case 2: return paladin;
		case 3: return hunter;
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
	m_HealSpells.clear();
	m_BuffSpells.clear();
	m_WarriorRotation.reset();
	m_PaladinRotation.reset();
	if (active)
	{
		// Pilot of the real per-class rotation port (Strategies/SelfBotClassRotation.h) -
		// TryUseRotationSpell prefers these over the thin m_RotationSpells list below when
		// present. Warrior and Paladin so far; the other classes fall through to the old list
		// until they get the same treatment.
		if (me->getClass() == CLASS_WARRIOR)
		{
			m_WarriorRotation = std::make_unique<SelfBotWarriorAI>();
			m_WarriorRotation->InitializeSpells(me);
		}
		else if (me->getClass() == CLASS_PALADIN)
		{
			m_PaladinRotation = std::make_unique<SelfBotPaladinAI>();
			m_PaladinRotation->InitializeSpells(me);
		}

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
		for (uint32 baseId : GetClassBuffBaseSpells(me->getClass()))
		{
			uint32 known = BotUtility::FindMaxRankSpellByExist(me, baseId);
			if (known)
				m_BuffSpells.push_back(known);
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
		std::string buffList;
		for (uint32 id : m_BuffSpells)
			buffList += std::to_string(id) + " ";
		TC_LOG_INFO("server.loading", ">> SelfBot: %s (%s) %s (rotation: %s) (heal: %s) (buff: %s)", me->GetName().c_str(), me->GetGUID().ToString().c_str(),
			active ? "enabled" : "disabled", knownList.empty() ? "none" : knownList.c_str(), healList.empty() ? "none" : healList.c_str(),
			buffList.empty() ? "none" : buffList.c_str());
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

	// Phase 7: heal-vs-rotation exclusivity is now arbitrated by m_Engine instead of this
	// explicit if/else - "heal ally" carries a higher relevance than "rotation spell" (see
	// Strategies/SelfBotStrategies.cpp), so the engine tries heal first and automatically falls
	// through to rotation only when HealAllySpellAction::Execute() returns false, same as
	// before. Neither action needs an externally-supplied target (heal picks its own ally,
	// rotation resolves its own victim via ResolveCombatVictim()), so there's nothing to pass.
	m_Engine->DoNextAction(nullptr);

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

std::string SelfBotAI::ProcessWhisperCommand(std::string const& rawCmd)
{
	// Whisper-driven command surface, matching how every other bot type on this fork already
	// works (BotGroupAI::ProcessBotCommand, dispatched from ChatHandler.cpp's CHAT_MSG_WHISPER
	// handling via receiver->GetAI()) - confirmed against mod-playerbots' real equivalent too
	// (Playerbots.cpp::OnPlayerCanUseChat intercepts CHAT_MSG_WHISPER and routes to
	// PlayerbotAI::HandleCommand regardless of whether sender == receiver, which is exactly how
	// a selfbot can be whispered by its own owner - the client UI doesn't offer your own name in
	// the whisper box, but a macro/addon calling SendChatMessage(msg, "WHISPER", nil, myName)
	// isn't restricted that way). This is a second entry point into the same actions
	// cs_selfbot.cpp's ".selfbot <sub>" dispatch already exposes - not a separate command set,
	// just a different way to reach the same handful of toggles.
	std::string cmd = rawCmd;
	size_t start = cmd.find_first_not_of(" \t");
	cmd = start == std::string::npos ? "" : cmd.substr(start);
	size_t sep = cmd.find(' ');
	std::string sub = sep == std::string::npos ? cmd : cmd.substr(0, sep);
	std::string rest = sep == std::string::npos ? "" : cmd.substr(sep + 1);

	if (sub == "attack")
		return TryAttackSelection() ? "атакую твою цель." : "нет подходящей выбранной цели.";

	if (sub == "stay")
	{
		BotValue<bool>* stay = m_Context->GetValue<bool>("stay");
		if (!stay)
			return "";
		stay->Set(!stay->Get());
		return stay->Get() ? "стою на месте." : "стоять выключено.";
	}

	if (sub == "follow")
	{
		BotValue<bool>* follow = m_Context->GetValue<bool>("follow");
		if (!follow)
			return "";
		follow->Set(!follow->Get());
		return follow->Get() ? "следую за лидером." : "следование выключено.";
	}

	if (sub == "ready")
	{
		BotValue<bool>* autoReady = m_Context->GetValue<bool>("auto ready");
		if (!autoReady)
			return "";
		autoReady->Set(!autoReady->Get());
		return autoReady->Get() ? "авто-подтверждение готовности включено." : "авто-подтверждение готовности выключено.";
	}

	if (sub == "co")
	{
		if (rest == "dps")
		{
			SetHealEnabled(false);
			return "порядок боя: ДД (без самолечения).";
		}
		if (rest == "heal" || rest == "auto" || rest.empty())
		{
			SetHealEnabled(true);
			return "порядок боя: авто (лечение, потом ротация).";
		}
		return "использование: co <auto|dps|heal>";
	}

	if (sub == "autogear")
	{
		if (!BotUtility::AutoGearEnabled)
			return "АвтоГир отключён на этом сервере.";

		size_t aSep = rest.find(' ');
		std::string arg1 = aSep == std::string::npos ? rest : rest.substr(0, aSep);
		std::string arg2 = aSep == std::string::npos ? "" : rest.substr(aSep + 1);

		// Same word-parsing as cs_selfbot.cpp's ApplyAutoGearLimitWord (dot-command path) -
		// small enough to duplicate rather than thread a shared helper through two otherwise
		// unrelated files for one function.
		auto applyLimitWord = [this](std::string const& word) -> bool
		{
			uint32 quality = 0;
			if (BotUtility::ParseGearQualityWord(word, quality))
			{
				if (BotValue<uint32>* qualityVal = m_Context->GetValue<uint32>("autogear quality"))
					qualityVal->Set(std::min(quality, BotUtility::AutoGearMaxQuality));
				return true;
			}
			bool allDigits = !word.empty();
			for (char c : word)
				if (!isdigit(static_cast<unsigned char>(c)))
					allDigits = false;
			if (allDigits)
			{
				uint32 target = uint32(atoi(word.c_str()));
				if (BotValue<uint32>* ilvlVal = m_Context->GetValue<uint32>("autogear ilvl"))
					ilvlVal->Set(std::min(target, BotUtility::AutoGearMaxItemLevel));
				return true;
			}
			return false;
		};

		if (arg1.empty())
		{
			BotValue<bool>* autoGear = m_Context->GetValue<bool>("autogear");
			if (!autoGear)
				return "";
			autoGear->Set(!autoGear->Get());
			return autoGear->Get() ? "автогир включён." : "автогир выключен.";
		}

		if (arg1 == "reset")
		{
			if (!arg2.empty() && !applyLimitWord(arg2))
				return "использование: autogear reset [<цвет>|<уровень предмета>]";
			TryResetAndRegear();
			return "шмот снят в сумки и переодет заново под текущий лимит.";
		}

		if (applyLimitWord(arg1))
		{
			TryUseAutoGear();
			return "лимит автогира: '" + arg1 + "'.";
		}

		return "использование: autogear [<цвет>|<уровень предмета>|reset [<цвет>|<уровень предмета>]]";
	}

	return "";
}

bool SelfBotAI::TryAttackSelection()
{
	// ".selfbot attack" - the explicit counterpart to ResolveCombatVictim's implicit
	// IsInCombat() gate below: that gate stops a bare tab-target from silently starting a
	// fight, but a real player still needs a deliberate way to say "attack what I've got
	// selected right now" - same shape as the x5 MultiBot addon's "attack my target" button,
	// and the same pattern BotGroupAI::ProcessAttackCommand already uses for companion bots
	// (reads the selection, attacks it, no IsInCombat requirement - the command itself IS the
	// explicit intent).
	if (!CanAct())
		return false;
	Unit* selected = me->GetSelectedUnit();
	if (!selected || !selected->IsAlive() || !me->IsValidAttackTarget(selected))
		return false;
	me->Attack(selected, true);
	return true;
}

Unit* SelfBotAI::ResolveCombatVictim()
{
	Unit* victim = me->GetVictim();
	if (!victim || !victim->IsAlive())
	{
		// Still never go looking for a fight on our own - only continue what the real client
		// already selected, or fight back if something is already attacking us (that's not
		// "picking a target", it's not standing there and eating hits). Selection alone must
		// NOT start a fight that doesn't exist yet - confirmed against mod-playerbots' real
		// master-assist trigger (PlayerbotMgr.cpp: "master->IsInCombat() || bot->IsInCombat()"),
		// which never looks at the master's current selection at all for this purpose -
		// GetSelectedUnit() there is only used for explicit actions (pull, trainer), never as an
		// implicit "start swinging" signal. Without the IsInCombat() gate, merely tabbing/
		// clicking a hostile mob to check its level made the selfbot attack it on the spot.
		Unit* selected = me->GetSelectedUnit();
		bool selectedValid = selected && selected->IsAlive() && me->IsValidAttackTarget(selected) && me->IsInCombat();
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
			return nullptr;

		me->Attack(victim, true);
	}

	// Phase 8 (".selfbot stay"): skip the chase-into-range step entirely when the player has
	// toggled "stay" on - keeps fighting/casting from wherever they already are instead of
	// being dragged into melee, useful for ranged specs. Attack() above still happens
	// regardless (never refuses to fight back), only the movement is suppressed.
	if (BotValue<bool>* stay = m_Context->GetValue<bool>("stay"); stay && stay->Get())
		return victim;

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

	return victim;
}

bool SelfBotAI::TryUseRotationSpell(Unit* target)
{
	if (!target)
		return false;

	if (m_WarriorRotation)
		return m_WarriorRotation->ProcessMeleeSpell(this, me, target);
	if (m_PaladinRotation)
		return m_PaladinRotation->ProcessMeleeSpell(this, me, target);

	return TryCastFirstKnown(target, m_RotationSpells);
}

bool SelfBotAI::TryUseBuffSpell()
{
	if (m_BuffSpells.empty())
		return false;

	// Pre-pull maintenance only - never interrupts an actual fight to refresh a buff.
	if (me->IsInCombat())
		return false;

	for (uint32 spellId : m_BuffSpells)
	{
		if (me->HasAura(spellId))
			continue;
		if (TryCastFirstKnown(me, { spellId }))
			return true;
	}
	return false;
}

bool SelfBotAI::TryUseAutoGear()
{
	if (me->IsInCombat())
		return false;

	uint32 quality = 0, itemLevel = 0;
	if (BotValue<uint32>* qualityVal = GetContext()->GetValue<uint32>("autogear quality"))
		quality = qualityVal->Get();
	if (BotValue<uint32>* ilvlVal = GetContext()->GetValue<uint32>("autogear ilvl"))
		itemLevel = ilvlVal->Get();

	return BotUtility::TryAutoGearFromBags(me, me->GetRoleForGroup() == ROLE_TANK, quality, itemLevel);
}

bool SelfBotAI::TryResetAndRegear()
{
	if (me->IsInCombat())
		return false;

	BotUtility::TryUnequipAllToBags(me);

	uint32 quality = 0, itemLevel = 0;
	if (BotValue<uint32>* qualityVal = GetContext()->GetValue<uint32>("autogear quality"))
		quality = qualityVal->Get();
	if (BotValue<uint32>* ilvlVal = GetContext()->GetValue<uint32>("autogear ilvl"))
		itemLevel = ilvlVal->Get();

	bool isTank = me->GetRoleForGroup() == ROLE_TANK;
	uint8 maxEquipSlots = EquipmentSlots::EQUIPMENT_SLOT_END - EquipmentSlots::EQUIPMENT_SLOT_START;
	for (uint8 i = 0; i < maxEquipSlots; i++)
		if (!BotUtility::TryAutoGearFromBags(me, isTank, quality, itemLevel))
			break;
	return true;
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
