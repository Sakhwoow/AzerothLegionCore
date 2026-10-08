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

#ifndef _SELF_BOT_MGR_H_
#define _SELF_BOT_MGR_H_

#include "ObjectGuid.h"
#include <unordered_map>
#include <memory>

class Player;
class SelfBotAI;

// Side-table of which REAL, connected players currently have .selfbot active, keyed by GUID.
// Deliberately separate from PlayerBotMgr (which owns the provisioned playerbotN account
// pool) and never touches IsPlayerBot() - selfbot activation must not be confused with "this
// is a bot account" anywhere else in the codebase.
class TC_GAME_API SelfBotMgr
{
public:
	SelfBotMgr(SelfBotMgr const&) = delete;
	SelfBotMgr(SelfBotMgr&&) = delete;
	SelfBotMgr& operator= (SelfBotMgr const&) = delete;
	SelfBotMgr& operator= (SelfBotMgr&&) = delete;

	static SelfBotMgr* instance();

	SelfBotAI* GetSelfBotAI(Player* player);
	bool IsSelfBotActive(Player* player);
	void Enable(Player* player);
	void Disable(Player* player);

	// Phase 4: auto-accept a pending group invite for a player with selfbot active. Called
	// right after the invite packet is sent out to them (GroupHandler.cpp::HandlePartyInviteOpcode)
	// - inlines the same Group:: calls WorldSession::HandlePartyInviteResponseOpcode's accept
	// branch makes, since that handler is written to run on the invited player's own session via
	// a real CMSG_PARTY_INVITE_RESPONSE packet and isn't something to fake a packet for. No-op if
	// the player doesn't have selfbot active, or isn't actually the invited player (defensive).
	void TryAutoAcceptInvite(Player* invitedPlayer);

private:
	SelfBotMgr();
	~SelfBotMgr();

	std::unordered_map<ObjectGuid, std::unique_ptr<SelfBotAI>> m_SelfBots;
};

#define sSelfBotMgr SelfBotMgr::instance()

#endif // !_SELF_BOT_MGR_H_
