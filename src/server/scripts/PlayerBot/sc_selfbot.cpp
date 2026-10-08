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
#include "SelfBotAI.h"
#include "SelfBotMgr.h"

// Drives SelfBotAI from the engine's own per-player update tick (Player::Update() ->
// sScriptMgr->OnPlayerUpdate(), called unconditionally for every connected player, bot or
// real - see Player.cpp). Deliberately not using Unit::SetAI()/UnitAI: that mechanism is
// reserved for spawned bot characters throughout this codebase, and selfbot must stay fully
// decoupled from IsPlayerBot() and everything gated on it.
class SelfBotPlayerScript : public PlayerScript
{
public:
	SelfBotPlayerScript() : PlayerScript("SelfBotPlayerScript") { }

	void OnUpdate(Player* player, uint32 diff) override
	{
		if (SelfBotAI* ai = sSelfBotMgr->GetSelfBotAI(player))
			ai->Update(diff);
	}

	void OnLogout(Player* player) override
	{
		sSelfBotMgr->Disable(player);
	}
};

void AddSC_selfbot_script()
{
	new SelfBotPlayerScript();
}
