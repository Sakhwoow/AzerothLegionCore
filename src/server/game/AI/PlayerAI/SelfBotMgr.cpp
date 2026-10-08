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
