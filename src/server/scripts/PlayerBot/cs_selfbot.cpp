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

namespace
{
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

		handler->SendSysMessage("Unknown selfbot subcommand. Known: stay, follow, co <auto|dps|heal>, ready.");
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
