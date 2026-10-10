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

#ifndef _ALT_BOT_MGR_H_
#define _ALT_BOT_MGR_H_

#include "ObjectGuid.h"
#include <string>
#include <unordered_map>

class Player;
class PlayerBotSession;

// Lets a real player puppet one of their OWN other characters (an "alt") as a companion bot
// while their main is online - the one piece ".selfbot"'s session confirmed genuinely missing
// from this fork (AiPlayerbot's existing "offline group member becomes a bot" convenience,
// PlayerBotMgr::LoginGroupBotByPlayer/AddNewPlayerBotByGUID2, only ever matches characters that
// already live on a pre-provisioned playerbotN/accountbotN account - never a real player's own
// regular account).
//
// Why this needs its own manager instead of reusing PlayerBotMgr's existing session plumbing:
// every existing bot session (random/account) gets its WorldSession registered the normal way
// (sWorld->AddSession(session)), which is only safe because playerbotN/accountbotN accounts are
// never also logged in for real. An alt-bot's account is the SAME account as the real player's
// own, ALREADY live in sWorld's session map - registering a second session under that same
// account id would hit World::AddSession_'s own "kick already loaded player with same account"
// path (World.cpp) and disconnect the real player's own live connection. Confirmed by reading
// mod-playerbots' real equivalent (PlayerbotMgr.cpp::HandlePlayerBotLoginCallback): it builds the
// bot's WorldSession with a plain `new WorldSession(...)` and NEVER calls AddSession on it at
// all - the module drives that session's Update() itself from its own tick, entirely outside the
// engine's normal per-account session map. This class does the same thing for exactly one case
// (same-account alt), not the general pattern - every other bot type keeps using the engine's
// normal session registration unchanged.
class AltBotMgr
{
public:
    static AltBotMgr* instance();

    // ".altbot add <name>" - validates (same account as master, not already connected for real,
    // not already an active alt-bot, under the per-master cap), builds the PlayerBotSession
    // (never registered into sWorld), logs the specific character into it via the same
    // CMSG_PLAYER_LOGIN simulation PlayerBotMgr::AllPlayerBotRandomLogin already uses for other
    // bot types, and groups it with master (BotGroupAI attachment then follows automatically -
    // CharacterHandler.cpp's login completion already calls PlayerBotMgr::OnPlayerBotLogin for
    // any IsBotSession() player, purely by session type, independent of account naming).
    bool AddAltBot(Player* master, std::string const& charName, std::string& outError);

    // ".altbot remove <name>" / internal cleanup (master logout, or the real player logging into
    // this same character directly - see sc_altbot.cpp's secure-login guard).
    bool RemoveAltBot(Player* master, std::string const& charName, std::string& outError);
    void RemoveAltBotByGuid(ObjectGuid const& guid);
    void RemoveAllForMaster(Player* master);

    bool IsActiveAltBotGuid(ObjectGuid const& guid) const;
    uint32 CountForMaster(uint32 accountId) const;

    // Drives every active alt-bot session belonging to this master - called from master's own
    // PlayerScript::OnUpdate (sc_altbot.cpp), same reasoning as SelfBotAI: there's no engine-side
    // session-map entry to get ticked automatically, and tying the lifetime to the master's own
    // update tick means a disconnected/zoned-out master can't leave a session spinning forever.
    void UpdateAltBotsFor(Player* master, uint32 diff);

private:
    AltBotMgr() = default;

    struct AltBotEntry
    {
        PlayerBotSession* session;
        uint32 masterAccountId;
        ObjectGuid masterGuid;

        // Character loading is async (a DB query queued by HandlePlayerLoginOpcode, resolved
        // over later ticks - confirmed live: checking session->GetPlayer() immediately after
        // the login calls always saw nullptr, even on what turned out to be a successful load).
        // A session registered the normal way (sWorld->AddSession) gets ticked automatically by
        // the engine's own main loop regardless, so the existing bot-login code this was copied
        // from (PlayerBotMgr::AllPlayerBotRandomLogin) never needed to wait for it either - ours
        // does, since nothing else ever calls Update() on an alt-bot's session. grouped tracks
        // whether the one-time "group with master + switch to BotGroupAI" step has run yet;
        // pendingSinceMs bounds how long UpdateAltBotsFor keeps waiting before giving up.
        bool grouped;
        uint32 pendingSinceMs;
    };

    void FinishPendingLogin(ObjectGuid const& altGuid, AltBotEntry& entry);

    std::unordered_map<ObjectGuid, AltBotEntry> m_ActiveAltBots;
};

#define sAltBotMgr AltBotMgr::instance()

#endif // !_ALT_BOT_MGR_H_
