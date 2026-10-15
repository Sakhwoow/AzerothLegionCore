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

// Replaces the old npc_rate_xp_modifier gossip NPC (13 copies spawned across the world) with a
// ".xp rate" chat command - same underlying mechanic (Player::SetPersonnalXpRate, already
// engine-native and DB-persisted), just reachable from anywhere instead of requiring a walk to
// one of the NPCs. Min/max of the selectable range are configurable (XpRateCommand.Min/.Max),
// unlike the old NPC's hardcoded MAX_RATE=10.

#include "Chat.h"
#include "Configuration/Config.h"
#include "Player.h"
#include "RBAC.h"
#include "ScriptMgr.h"
#include "World.h"
#include "WorldSession.h"
#include <algorithm>
#include <cctype>
#include <cstdlib>

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

    uint32 XpRateMin()
    {
        return std::max<uint32>(1, uint32(sConfigMgr->GetIntDefault("XpRateCommand.Min", 1)));
    }

    uint32 XpRateMax()
    {
        return std::max(XpRateMin(), uint32(sConfigMgr->GetIntDefault("XpRateCommand.Max", 5)));
    }
}

static bool HandleXpRateCommand(ChatHandler* handler, const char* args)
{
    if (!sConfigMgr->GetBoolDefault("XpRateCommand.Enable", false))
    {
        handler->SendSysMessage("Смена личного рейта опыта отключена на этом сервере.");
        return true;
    }

    Player* player = handler->GetSession() ? handler->GetSession()->GetPlayer() : nullptr;
    if (!player)
        return false;

    uint32 const minRate = XpRateMin();
    uint32 const maxRate = XpRateMax();
    uint32 const serverRate = uint32(sWorld->getRate(RATE_XP_KILL));

    std::string argStr = args ? args : "";
    size_t start = argStr.find_first_not_of(" \t");
    argStr = start == std::string::npos ? "" : argStr.substr(start);

    // Accept both ".xp rate <value>" and ".xp <value>" - strip a leading "rate" word if present.
    // Flat top-level command (no ChildCommands table) on purpose: a nested "xp"->"rate" table
    // falls back to the engine's own trinity_string (id 7/10, "There is no such subcommand" /
    // "Incorrect syntax.") on a typo - confirmed in the live DB, no ruRU translation exists for
    // those. Keeping this flat means every output path goes through our own Russian strings only.
    if (argStr.rfind("rate", 0) == 0 && (argStr.size() == 4 || argStr[4] == ' '))
    {
        argStr = argStr.substr(4);
        size_t afterRate = argStr.find_first_not_of(" \t");
        argStr = afterRate == std::string::npos ? "" : argStr.substr(afterRate);
    }

    if (argStr.empty())
    {
        float current = player->GetPersonnalXpRate();
        if (current > 0.0f)
            handler->PSendSysMessage("Твой личный рейт опыта: x%.0f (серверный: x%u). Доступно: x%u-x%u. .xp rate <число> - сменить, .xp rate default - сбросить.", current, serverRate, minRate, maxRate);
        else
            handler->PSendSysMessage("Личный рейт опыта не задан, используется серверный x%u. Доступно: x%u-x%u. Использование: .xp rate <число>.", serverRate, minRate, maxRate);
        return true;
    }

    if (argStr == "default" || argStr == "0")
    {
        player->SetPersonnalXpRate(0.0f);
        handler->PSendSysMessage("Личный рейт опыта сброшен, используется серверный x%u.", serverRate);
        return true;
    }

    if (!IsAllDigits(argStr))
    {
        handler->PSendSysMessage("Использование: .xp rate <число от %u до %u>, .xp rate default.", minRate, maxRate);
        return true;
    }

    uint32 requested = uint32(atoi(argStr.c_str()));
    if (requested < minRate || requested > maxRate)
    {
        handler->PSendSysMessage("Рейт должен быть от %u до %u.", minRate, maxRate);
        return true;
    }

    player->SetPersonnalXpRate(float(requested));
    handler->PSendSysMessage("Личный рейт опыта установлен: x%u.", requested);
    return true;
}

class xp_rate_commandscript : public CommandScript
{
public:
    xp_rate_commandscript() : CommandScript("xp_rate_commandscript") { }

    std::vector<ChatCommand> GetCommands() const override
    {
        static std::vector<ChatCommand> commandTable =
        {
            { "xp", rbac::RBAC_PREM_COMMAND_XPRATE, false, &HandleXpRateCommand, "" },
        };
        return commandTable;
    }
};

void AddSC_xp_rate_commandscript()
{
    new xp_rate_commandscript();
}
