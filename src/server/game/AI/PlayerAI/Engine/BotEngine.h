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

#ifndef _BOT_ENGINE_H_
#define _BOT_ENGINE_H_

#include "BotTrigger.h"
#include <map>
#include <string>
#include <vector>

class Player;
class Unit;
class BotAiObjectContext;
class BotStrategy;

// Owns a bot's set of active, named BotStrategy instances and decides what to do each tick.
// Mirrors mod-playerbots' Engine (Bot/Engine/Engine.h). Nothing calls this yet as of Phase 6 -
// see the "Legion Bot Architecture" plan, Phase 7 for SelfBotAI migrating its existing behavior
// onto it.
class TC_GAME_API BotEngine
{
public:
	BotEngine(Player* bot, BotAiObjectContext* context);
	~BotEngine();

	void AddStrategy(std::string const& name);
	void RemoveStrategy(std::string const& name);
	bool HasStrategy(std::string const& name) const;

	// One decision tick: collects every NextBotAction currently nominated by an active
	// strategy's fired triggers or its default-action list, across ALL active strategies, picks
	// the single highest-relevance one, and executes it against `target` (nullptr if the action
	// doesn't need one) - falling through to its GetAlternatives() chain on failure. Returns true
	// if something was actually executed this tick.
	bool DoNextAction(Unit* target);

private:
	Player* m_bot;
	BotAiObjectContext* m_context;
	std::map<std::string, BotStrategy*> m_strategies;
	std::vector<BotTriggerNode*> m_triggers;

	void RebuildTriggers();
	bool ExecuteByName(std::string const& name, Unit* target, int depth);
};

#endif // !_BOT_ENGINE_H_
