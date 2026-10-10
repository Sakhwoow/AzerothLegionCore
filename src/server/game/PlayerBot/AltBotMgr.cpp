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

#include "AltBotMgr.h"
#include "Player.h"
#include "ObjectMgr.h"
#include "ObjectAccessor.h"
#include "PlayerBotSession.h"
#include "PlayerBotMgr.h"
#include "Group.h"
#include "GroupMgr.h"
#include "Config.h"
#include "World.h"
#include "AccountMgr.h"
#include "CharacterPackets.h"
#include "Opcodes.h"
#include "WorldPacket.h"

AltBotMgr* AltBotMgr::instance()
{
    static AltBotMgr instance;
    return &instance;
}

uint32 AltBotMgr::CountForMaster(uint32 accountId) const
{
    uint32 count = 0;
    for (auto const& [guid, entry] : m_ActiveAltBots)
        if (entry.masterAccountId == accountId)
            ++count;
    return count;
}

bool AltBotMgr::IsActiveAltBotGuid(ObjectGuid const& guid) const
{
    return m_ActiveAltBots.find(guid) != m_ActiveAltBots.end();
}

bool AltBotMgr::AddAltBot(Player* master, std::string const& charName, std::string& outError)
{
    if (!sConfigMgr->GetBoolDefault("altbot_enable", false))
    {
        outError = "Alt-bot is disabled on this server.";
        return false;
    }
    if (!master || master->IsPlayerBot())
    {
        outError = "No valid character.";
        return false;
    }

    ObjectGuid altGuid = ObjectMgr::GetPlayerGUIDByName(charName);
    if (!altGuid)
    {
        outError = "No such character.";
        return false;
    }
    if (altGuid == master->GetGUID())
    {
        outError = "That is your own current character.";
        return false;
    }
    if (IsActiveAltBotGuid(altGuid))
    {
        outError = "That character is already an active alt-bot.";
        return false;
    }
    // Covers both "really connected right now" and "already puppeted by some other bot
    // system" - either way this guid is not free to take over.
    if (ObjectAccessor::FindConnectedPlayer(altGuid))
    {
        outError = "That character is already online.";
        return false;
    }

    uint32 masterAccountId = master->GetSession()->GetAccountId();
    uint32 altAccountId = ObjectMgr::GetPlayerAccountIdByGUID(altGuid);
    if (!altAccountId || altAccountId != masterAccountId)
    {
        // Never allow puppeting a character that isn't the inviter's own - this is the one
        // hard security line the whole feature rests on, mirroring mod-playerbots'
        // "sameAccount" check in PlayerbotHolder::AddPlayerBot (PlayerbotMgr.cpp).
        outError = "That character does not belong to your account.";
        return false;
    }

    uint32 maxPerMaster = sConfigMgr->GetIntDefault("altbot_max_per_master", 1);
    if (CountForMaster(masterAccountId) >= maxPerMaster)
    {
        outError = "You already have the maximum number of alt-bots active.";
        return false;
    }

    // Deliberately never calls sWorld->AddSession() - see the class comment in AltBotMgr.h.
    // master's account already owns the one live session slot World::AddSession_ enforces per
    // account id (World.cpp); registering a second session under that same id would kick and
    // delete master's own real connection. mod-playerbots' real equivalent
    // (PlayerbotMgr.cpp::HandlePlayerBotLoginCallback) hits the exact same constraint for its
    // own bot sessions and solves it the same way: build the WorldSession directly, never
    // register it, drive its Update() from the module's own tick instead of the engine's.
    std::string accountName = master->GetSession()->GetAccountName();
    uint32 battlenetAccountId = master->GetSession()->GetBattlenetAccountId();
    PlayerBotSession* botSession = new PlayerBotSession(masterAccountId, accountName, battlenetAccountId,
        AccountTypes::SEC_GAMEMASTER, 2, 0, master->GetSession()->GetSessionDbcLocale(), 0, false, std::string());
    botSession->LoadPermissions();

    // Same login-simulation pattern PlayerBotMgr::AllPlayerBotRandomLogin already uses to swap
    // an existing bot session onto a specific character by guid - reused as-is, not reinvented.
    WorldPacket rawPacket(CMSG_PLAYER_LOGIN);
    WorldPackets::Character::PlayerLogin cmd(std::move(rawPacket));
    cmd.Guid = altGuid;
    cmd.FarClip = 0.0f;
    botSession->HandlePlayerLoginOpcode(cmd);
    botSession->HandleContinuePlayerLogin();

    Player* altPlayer = botSession->GetPlayer();
    if (!altPlayer)
    {
        delete botSession;
        outError = "Failed to load that character.";
        return false;
    }

    // Group with master so BotGroupAI (not the autonomous BotFieldAI) is what
    // PlayerBotMgr::OnPlayerBotLogin attaches - that call already happened, automatically,
    // inside HandlePlayerLoginOpcode's own completion path (CharacterHandler.cpp checks
    // IsBotSession() alone, not any account-naming convention), but it only chose BotGroupAI if
    // the character was ALREADY a group member at that exact moment. A fresh alt-bot never is,
    // so it was attached as BotFieldAI (autonomous) - group it now and explicitly re-switch.
    Group* group = master->GetGroup();
    if (!group)
    {
        group = new Group();
        group->Create(master);
        sGroupMgr->AddGroup(group);
    }
    if (!group->AddMember(altPlayer))
    {
        botSession->LogoutPlayer(false);
        delete botSession;
        outError = "Could not add that character to your group (group full?).";
        return false;
    }
    group->BroadcastGroupUpdate();
    PlayerBotMgr::SwitchPlayerBotAI(altPlayer, PlayerBotAIType::PBAIT_GROUP, true);

    m_ActiveAltBots[altGuid] = AltBotEntry{ botSession, masterAccountId };
    return true;
}

bool AltBotMgr::RemoveAltBot(Player* master, std::string const& charName, std::string& outError)
{
    if (!master)
    {
        outError = "No valid character.";
        return false;
    }
    ObjectGuid altGuid = ObjectMgr::GetPlayerGUIDByName(charName);
    auto it = altGuid ? m_ActiveAltBots.find(altGuid) : m_ActiveAltBots.end();
    if (it == m_ActiveAltBots.end() || it->second.masterAccountId != master->GetSession()->GetAccountId())
    {
        outError = "That is not one of your active alt-bots.";
        return false;
    }
    RemoveAltBotByGuid(altGuid);
    return true;
}

void AltBotMgr::RemoveAltBotByGuid(ObjectGuid const& guid)
{
    auto it = m_ActiveAltBots.find(guid);
    if (it == m_ActiveAltBots.end())
        return;

    PlayerBotSession* session = it->second.session;
    m_ActiveAltBots.erase(it);

    if (session->GetPlayer())
        session->LogoutPlayer(true);
    delete session;
}

void AltBotMgr::RemoveAllForMaster(Player* master)
{
    if (!master)
        return;
    uint32 accountId = master->GetSession()->GetAccountId();
    for (auto it = m_ActiveAltBots.begin(); it != m_ActiveAltBots.end();)
    {
        if (it->second.masterAccountId == accountId)
        {
            ObjectGuid guid = it->first;
            ++it;
            RemoveAltBotByGuid(guid);
        }
        else
            ++it;
    }
}

void AltBotMgr::UpdateAltBotsFor(Player* master, uint32 diff)
{
    if (!master)
        return;
    uint32 accountId = master->GetSession()->GetAccountId();
    for (auto it = m_ActiveAltBots.begin(); it != m_ActiveAltBots.end();)
    {
        if (it->second.masterAccountId != accountId)
        {
            ++it;
            continue;
        }

        PlayerBotSession* session = it->second.session;
        WorldSessionFilter filter(session);
        bool keepAlive = session->Update(diff, filter);
        if (!keepAlive)
        {
            ObjectGuid guid = it->first;
            ++it;
            RemoveAltBotByGuid(guid);
            continue;
        }
        ++it;
    }
}
