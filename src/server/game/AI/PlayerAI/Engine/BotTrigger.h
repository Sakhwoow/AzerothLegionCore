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

#ifndef _BOT_TRIGGER_H_
#define _BOT_TRIGGER_H_

#include "BotAction.h"
#include <vector>

class Player;

// Checked once per BotEngine tick; when Check() returns true, its handlers (NextBotActions)
// become candidates for that tick's decision. Mirrors mod-playerbots' Trigger (Bot/Engine/
// Trigger/Trigger.h), minus the generic Event return value - Phase 6-8's triggers only ever need
// a yes/no (e.g. "is there a hurt group member", "did '.selfbot stay' just get issued").
class TC_GAME_API BotTrigger
{
public:
	BotTrigger(Player* bot, std::string const& name) : m_bot(bot), m_name(name) { }
	virtual ~BotTrigger() { }

	std::string const& GetName() const { return m_name; }
	virtual bool Check() { return false; }

protected:
	Player* m_bot;

private:
	std::string m_name;
};

// Binds a named trigger to the handlers a BotStrategy wants run when it fires - mirrors
// mod-playerbots' TriggerNode. A BotStrategy builds these in InitTriggers(); BotEngine resolves
// GetTrigger() via BotAiObjectContext once and keeps it for the strategy's lifetime.
class TC_GAME_API BotTriggerNode
{
public:
	BotTriggerNode(std::string const& name, std::vector<NextBotAction> handlers = {})
		: m_name(name), m_trigger(nullptr), m_handlers(std::move(handlers)) { }

	std::string const& GetName() const { return m_name; }
	BotTrigger* GetTrigger() const { return m_trigger; }
	void SetTrigger(BotTrigger* trigger) { m_trigger = trigger; }
	std::vector<NextBotAction> const& GetHandlers() const { return m_handlers; }

private:
	std::string m_name;
	BotTrigger* m_trigger;
	std::vector<NextBotAction> m_handlers;
};

#endif // !_BOT_TRIGGER_H_
