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

#include "ScriptMgr.h"
#include "Player.h"
#include "AltBotMgr.h"

// Drives every active alt-bot session's WorldSession::Update() from its master's own update
// tick - an alt-bot's session is deliberately never registered into sWorld's session map (see
// AltBotMgr.h), so nothing else would ever call it. Tying the tick to the master being online
// also means a disconnected/zoned-stuck master can't leave an alt-bot session running forever
// unattended - OnLogout cleans it up outright.
class AltBotPlayerScript : public PlayerScript
{
public:
    AltBotPlayerScript() : PlayerScript("AltBotPlayerScript") { }

    void OnUpdate(Player* player, uint32 diff) override
    {
        sAltBotMgr->UpdateAltBotsFor(player, diff);
    }

    void OnLogout(Player* player) override
    {
        sAltBotMgr->RemoveAllForMaster(player);
    }
};

void AddSC_altbot_script()
{
    new AltBotPlayerScript();
}
