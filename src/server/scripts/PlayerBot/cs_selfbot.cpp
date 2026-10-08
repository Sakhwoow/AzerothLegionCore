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
#include "SelfBotMgr.h"
#include "RBAC.h"

// Deliberately a separate command/file from pbotai_commandscript: that family is GM-only bot
// administration tooling (cs_pbotai.cpp), while .selfbot must be grantable to ordinary players
// via selfbot_level without also granting bot-admin commands.
static bool HandleSelfBotCommand(ChatHandler* handler, const char* /*args*/)
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
