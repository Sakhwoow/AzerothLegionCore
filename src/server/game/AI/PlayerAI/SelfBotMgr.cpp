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

#include "SelfBotMgr.h"
#include "SelfBotAI.h"
#include "Player.h"
#include "Group.h"
#include "GroupMgr.h"
#include "ObjectAccessor.h"
#include "Log.h"
#include "BotAITool.h"
#include "BotAiObjectContext.h"
#include "BotValue.h"

// Defined here, not inline in the header: m_SelfBots holds std::unique_ptr<SelfBotAI>, and its
// destructor needs SelfBotAI to be a complete type, which it only is once SelfBotAI.h (above)
// is visible - SelfBotMgr.h itself only forward-declares SelfBotAI.
SelfBotMgr::SelfBotMgr() {}
SelfBotMgr::~SelfBotMgr() {}

SelfBotMgr* SelfBotMgr::instance()
{
	static SelfBotMgr instance;
	return &instance;
}

SelfBotAI* SelfBotMgr::GetSelfBotAI(Player* player)
{
	if (!player)
		return nullptr;
	auto itr = m_SelfBots.find(player->GetGUID());
	if (itr == m_SelfBots.end())
		return nullptr;
	return itr->second.get();
}

bool SelfBotMgr::IsSelfBotActive(Player* player)
{
	SelfBotAI* ai = GetSelfBotAI(player);
	return ai && ai->IsActive();
}

void SelfBotMgr::Enable(Player* player)
{
	if (!player)
		return;
	auto itr = m_SelfBots.find(player->GetGUID());
	if (itr == m_SelfBots.end())
		itr = m_SelfBots.emplace(player->GetGUID(), std::make_unique<SelfBotAI>(player)).first;
	itr->second->SetActive(true);
}

void SelfBotMgr::Disable(Player* player)
{
	if (!player)
		return;
	auto itr = m_SelfBots.find(player->GetGUID());
	if (itr == m_SelfBots.end())
		return;
	itr->second->SetActive(false);
	m_SelfBots.erase(itr);
}

void SelfBotMgr::TryAutoAcceptInvite(Player* invitedPlayer)
{
	if (!invitedPlayer || !IsSelfBotActive(invitedPlayer))
		return;

	Group* invite = invitedPlayer->GetGroupInvite();
	if (!invite)
		return;

	// Mirrors WorldSession::HandlePartyInviteResponseOpcode's Accept branch (GroupHandler.cpp)
	// exactly, same order of calls, same bail-out conditions - just without a real client
	// packet driving it.
	invite->RemoveInvite(invitedPlayer);

	if (invite->GetLeaderGUID() == invitedPlayer->GetGUID())
		return; // can't accept an invite to your own group (shouldn't happen, defensive)

	if (invite->IsFull())
		return;

	if (!invite->IsCreated())
	{
		Player* leader = ObjectAccessor::FindPlayer(invite->GetLeaderGUID());
		if (!leader)
		{
			invite->RemoveAllInvites();
			return;
		}
		invite->RemoveInvite(leader);
		invite->Create(leader);
		sGroupMgr->AddGroup(invite);
	}

	if (!invite->AddMember(invitedPlayer))
		return;

	invite->BroadcastGroupUpdate();

	if (BotUtility::SelfBotDebug)
		TC_LOG_INFO("server.loading", ">> SelfBot: %s auto-accepted group invite", invitedPlayer->GetName().c_str());
}

void SelfBotMgr::TryAutoConfirmReadyCheck(Player* player, Group* group)
{
	if (!player || !group || !IsSelfBotActive(player))
		return;

	SelfBotAI* ai = GetSelfBotAI(player);
	BotValue<bool>* autoReady = ai->GetContext()->GetValue<bool>("auto ready");
	if (autoReady && !autoReady->Get())
		return;

	group->SetMemberReadyCheck(player->GetGUID(), true);

	if (BotUtility::SelfBotDebug)
		TC_LOG_INFO("server.loading", ">> SelfBot: %s auto-confirmed ready check", player->GetName().c_str());
}
