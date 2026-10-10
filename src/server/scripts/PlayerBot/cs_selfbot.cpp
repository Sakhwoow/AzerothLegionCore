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

#include "Chat.h"
#include "ScriptMgr.h"
#include "WorldSession.h"
#include "BotAITool.h"
#include "SelfBotAI.h"
#include "SelfBotMgr.h"
#include "BotAiObjectContext.h"
#include "BotValue.h"
#include "RBAC.h"
#include <algorithm>
#include <cstdlib>
#include <cctype>

namespace
{
	bool IsAllDigits(std::string const& word)
	{
		if (word.empty())
			return false;
		for (char c : word)
			if (!isdigit(static_cast<unsigned char>(c)))
				return false;
		return true;
	}

	// Sets a per-player quality or item-level override from a single word argument ("green",
	// "200") - clamped to the realm ceiling so a player can only tighten the limit, never
	// loosen it past BotUtility::AutoGearMaxQuality/AutoGearMaxItemLevel. Returns false (and
	// touches nothing) if the word is neither a recognized color nor a plain number.
	bool ApplyAutoGearLimitWord(SelfBotAI* ai, std::string const& word)
	{
		uint32 quality = 0;
		if (BotUtility::ParseGearQualityWord(word, quality))
		{
			if (BotValue<uint32>* qualityVal = ai->GetContext()->GetValue<uint32>("autogear quality"))
				qualityVal->Set(std::min(quality, BotUtility::AutoGearMaxQuality));
			return true;
		}
		if (IsAllDigits(word))
		{
			uint32 target = uint32(atoi(word.c_str()));
			if (BotValue<uint32>* ilvlVal = ai->GetContext()->GetValue<uint32>("autogear ilvl"))
				ilvlVal->Set(std::min(target, BotUtility::AutoGearMaxItemLevel));
			return true;
		}
		return false;
	}

	// ".selfbot autogear [<color>|<itemLevel>|reset [<color>|<itemLevel>]]" - mirrors AC's
	// "autogear"/"autogear <quality>"/"autogear <itemlevel>"/"autogear reset [...]" command
	// family (AiPlayerbot.AutoGearCommand in mod-playerbots), adapted for a real player's own
	// character rather than a commanded companion bot. Deliberately has no "autogear match":
	// AC's version matches the COMMANDING player's average item level, but a selfbot has no
	// separate commander to match against - it IS the character.
	bool HandleSelfBotAutoGear(ChatHandler* handler, SelfBotAI* ai, std::string const& rest)
	{
		if (!BotUtility::AutoGearEnabled)
		{
			handler->SendSysMessage("AutoGear is disabled on this server (admin needs autogear_enable=1).");
			return true;
		}

		size_t sep = rest.find(' ');
		std::string arg1 = sep == std::string::npos ? rest : rest.substr(0, sep);
		std::string arg2 = sep == std::string::npos ? "" : rest.substr(sep + 1);

		if (arg1.empty())
		{
			BotValue<bool>* autoGear = ai->GetContext()->GetValue<bool>("autogear");
			if (!autoGear)
				return true;
			autoGear->Set(!autoGear->Get());
			handler->PSendSysMessage("Selfbot: autogear %s.", autoGear->Get() ? "enabled" : "disabled");
			return true;
		}

		if (arg1 == "reset")
		{
			if (!arg2.empty() && !ApplyAutoGearLimitWord(ai, arg2))
			{
				handler->SendSysMessage("Usage: .selfbot autogear reset [<color>|<itemLevel>]");
				return true;
			}
			ai->TryResetAndRegear();
			handler->SendSysMessage("Selfbot: gear moved to bags and re-geared from whatever qualifies.");
			return true;
		}

		if (ApplyAutoGearLimitWord(ai, arg1))
		{
			handler->PSendSysMessage("Selfbot: autogear limit set to '%s'.", arg1.c_str());
			ai->TryUseAutoGear();
			return true;
		}

		handler->SendSysMessage("Usage: .selfbot autogear [<color>|<itemLevel>|reset [<color>|<itemLevel>]]");
		return true;
	}

	// Phase 8: a handful of subcommands proving the command-driven flag pattern (plan's
	// "Legion Bot Architecture", Phase 8) - not a general parser, just enough to dispatch on
	// the first whitespace-separated word. "stay"/"follow" toggle a ManualBotValue<bool> the
	// matching strategy's action reads every tick (SelfBotStrategies.cpp); "co" swaps whether
	// the "heal" strategy is on the engine at all; "ready" toggles the ready-check auto-confirm
	// hook in GroupHandler.cpp. Each requires selfbot to already be active - there's nothing to
	// configure on an inactive one.
	bool HandleSelfBotSubcommand(ChatHandler* handler, Player* self, std::string const& sub, std::string const& rest)
	{
		SelfBotAI* ai = sSelfBotMgr->GetSelfBotAI(self);
		if (!ai || !ai->IsActive())
		{
			handler->SendSysMessage("Enable selfbot first with .selfbot");
			return true;
		}

		if (sub == "stay")
		{
			BotValue<bool>* stay = ai->GetContext()->GetValue<bool>("stay");
			if (!stay)
				return true;
			stay->Set(!stay->Get());
			handler->PSendSysMessage("Selfbot: stay %s.", stay->Get() ? "enabled" : "disabled");
			return true;
		}

		if (sub == "follow")
		{
			BotValue<bool>* follow = ai->GetContext()->GetValue<bool>("follow");
			if (!follow)
				return true;
			follow->Set(!follow->Get());
			handler->PSendSysMessage("Selfbot: follow leader %s.", follow->Get() ? "enabled" : "disabled");
			return true;
		}

		if (sub == "co")
		{
			if (rest == "dps")
			{
				ai->SetHealEnabled(false);
				handler->SendSysMessage("Selfbot: combat order set to dps (no self-heal).");
			}
			else if (rest == "heal" || rest == "auto" || rest.empty())
			{
				ai->SetHealEnabled(true);
				handler->SendSysMessage("Selfbot: combat order set to auto (heal, then rotation).");
			}
			else
				handler->SendSysMessage("Usage: .selfbot co <auto|dps|heal>");
			return true;
		}

		if (sub == "ready")
		{
			BotValue<bool>* autoReady = ai->GetContext()->GetValue<bool>("auto ready");
			if (!autoReady)
				return true;
			autoReady->Set(!autoReady->Get());
			handler->PSendSysMessage("Selfbot: auto-confirm ready checks %s.", autoReady->Get() ? "enabled" : "disabled");
			return true;
		}

		if (sub == "autogear")
			return HandleSelfBotAutoGear(handler, ai, rest);

		if (sub == "attack")
		{
			if (ai->TryAttackSelection())
				handler->SendSysMessage("Selfbot: attacking your current target.");
			else
				handler->SendSysMessage("Selfbot: no valid target selected.");
			return true;
		}

		handler->SendSysMessage("Unknown selfbot subcommand. Known: stay, follow, co <auto|dps|heal>, ready, autogear, attack.");
		return true;
	}
}

// Deliberately a separate command/file from pbotai_commandscript: that family is GM-only bot
// administration tooling (cs_pbotai.cpp), while .selfbot must be grantable to ordinary players
// via selfbot_level without also granting bot-admin commands.
static bool HandleSelfBotCommand(ChatHandler* handler, const char* args)
{
	Player* pSelf = handler->GetSession() ? handler->GetSession()->GetPlayer() : nullptr;
	if (!pSelf)
		return false;

	if (BotUtility::SelfBotLevel == 0)
	{
		handler->SendSysMessage("Selfbot is disabled on this server.");
		return true;
	}
	if (BotUtility::SelfBotLevel == 1 && !pSelf->CanBeGameMaster())
	{
		handler->SendSysMessage("You do not have permission to use selfbot.");
		return true;
	}

	std::string argStr = args ? args : "";
	size_t start = argStr.find_first_not_of(" \t");
	argStr = start == std::string::npos ? "" : argStr.substr(start);

	if (!argStr.empty())
	{
		size_t sep = argStr.find(' ');
		std::string sub = sep == std::string::npos ? argStr : argStr.substr(0, sep);
		std::string rest = sep == std::string::npos ? "" : argStr.substr(sep + 1);
		return HandleSelfBotSubcommand(handler, pSelf, sub, rest);
	}

	if (sSelfBotMgr->IsSelfBotActive(pSelf))
	{
		sSelfBotMgr->Disable(pSelf);
		handler->SendSysMessage("Selfbot disabled.");
	}
	else
	{
		sSelfBotMgr->Enable(pSelf);
		handler->SendSysMessage("Selfbot enabled.");
	}
	return true;
}

class selfbot_commandscript : public CommandScript
{
public:
	selfbot_commandscript() : CommandScript("selfbot_commandscript") { }

	std::vector<ChatCommand> GetCommands() const override
	{
		static std::vector<ChatCommand> commandTable =
		{
			{ "selfbot", rbac::RBAC_PREM_COMMAND_SELFBOT, false, &HandleSelfBotCommand, "" },
		};

		return commandTable;
	}
};

void AddSC_selfbot_commandscript()
{
	new selfbot_commandscript();
}
