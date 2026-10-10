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
#include "AltBotMgr.h"
#include "RBAC.h"

// ".altbot add <name>" / ".altbot remove <name>" - puppet one of your OWN other characters as a
// companion bot while this one is online. Own file, same reasoning as cs_selfbot.cpp: a
// separate, ordinary-player-grantable permission, not bundled with the GM-only PBOTAI admin
// command family.
static bool HandleAltBotCommand(ChatHandler* handler, const char* args)
{
    Player* self = handler->GetSession() ? handler->GetSession()->GetPlayer() : nullptr;
    if (!self)
        return false;

    std::string argStr = args ? args : "";
    size_t start = argStr.find_first_not_of(" \t");
    argStr = start == std::string::npos ? "" : argStr.substr(start);

    size_t sep = argStr.find(' ');
    std::string sub = sep == std::string::npos ? argStr : argStr.substr(0, sep);
    std::string name = sep == std::string::npos ? "" : argStr.substr(sep + 1);

    if (sub == "add" && !name.empty())
    {
        std::string error;
        // Загрузка асинхронная - AddAltBot тут только ставит её в очередь, реальное
        // подключение подтвердит сам альт шёпотом, когда действительно загрузится
        // (AltBotMgr::FinishPendingLogin).
        if (sAltBotMgr->AddAltBot(self, name, error))
            handler->PSendSysMessage("Альтбот: загружаю %s...", name.c_str());
        else
            handler->PSendSysMessage("Альтбот: %s", error.c_str());
        return true;
    }

    if (sub == "remove" && !name.empty())
    {
        std::string error;
        if (sAltBotMgr->RemoveAltBot(self, name, error))
            handler->PSendSysMessage("Альтбот: %s отключён.", name.c_str());
        else
            handler->PSendSysMessage("Альтбот: %s", error.c_str());
        return true;
    }

    handler->SendSysMessage("Использование: .altbot add <имя> | .altbot remove <имя>");
    return true;
}

class altbot_commandscript : public CommandScript
{
public:
    altbot_commandscript() : CommandScript("altbot_commandscript") { }

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> commandTable =
        {
            { "altbot", rbac::RBAC_PREM_COMMAND_ALTBOT, false, &HandleAltBotCommand, "" },
        };

        return commandTable;
    }
};

void AddSC_altbot_commandscript()
{
    new altbot_commandscript();
}
