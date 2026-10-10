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

#ifndef _BOT_AI_OBJECT_CONTEXT_H_
#define _BOT_AI_OBJECT_CONTEXT_H_

#include "BotValue.h"
#include <functional>
#include <map>
#include <memory>
#include <string>

class Player;
class BotAction;
class BotActionNode;
class BotStrategy;
class BotTrigger;

// Per-bot registry resolving string names to BotStrategy*/BotActionNode*/BotTrigger* instances.
// Mirrors mod-playerbots' AiObjectContext (Bot/Engine/AiObjectContext.h): strategy/action/trigger
// *factories* are registered once, globally, by name (Register*, usually from a script loader at
// startup); each BotAiObjectContext instance then lazily builds and caches its own per-bot
// Strategy/Action/Trigger objects the first time a name is actually requested. See the "Legion
// Bot Architecture" plan, Phase 6.
class TC_GAME_API BotAiObjectContext
{
public:
	using StrategyCreator = std::function<BotStrategy*(Player*)>;
	using ActionCreator = std::function<BotAction*(Player*)>;
	using TriggerCreator = std::function<BotTrigger*(Player*)>;
	using ValueCreator = std::function<UntypedBotValue*(Player*)>;

	explicit BotAiObjectContext(Player* bot);
	~BotAiObjectContext();

	static void RegisterStrategy(std::string const& name, StrategyCreator creator);
	static void RegisterAction(std::string const& name, ActionCreator creator);
	static void RegisterTrigger(std::string const& name, TriggerCreator creator);
	static void RegisterValue(std::string const& name, ValueCreator creator);

	BotStrategy* GetStrategy(std::string const& name);
	BotTrigger* GetTrigger(std::string const& name);

	// Resolves a named, pre-registered value to its typed interface (dynamic_cast against the
	// requested T) - e.g. GetValue<bool>("stay") for a command-driven flag (Phase 8). Lazily
	// created and cached per-bot on first request, same as strategies/actions/triggers. Returns
	// nullptr if nothing was ever registered under this name, or if it was registered with a
	// different T.
	template <class T>
	BotValue<T>* GetValue(std::string const& name)
	{
		return dynamic_cast<BotValue<T>*>(GetUntypedValue(name));
	}

	// Returns a freshly-allocated node the caller owns (BotEngine deletes it right after use -
	// see BotEngine.cpp); the underlying BotAction* instance itself is cached per-bot and reused
	// across calls, only the lightweight node wrapper is single-use. nullptr if no action with
	// this name was ever registered.
	BotActionNode* GetActionNode(std::string const& name);

private:
	UntypedBotValue* GetUntypedValue(std::string const& name);

	Player* m_bot;
	std::map<std::string, std::unique_ptr<BotStrategy>> m_strategies;
	std::map<std::string, std::unique_ptr<BotAction>> m_actions;
	std::map<std::string, std::unique_ptr<BotTrigger>> m_triggers;
	std::map<std::string, std::unique_ptr<UntypedBotValue>> m_values;

	static std::map<std::string, StrategyCreator>& SharedStrategyCreators();
	static std::map<std::string, ActionCreator>& SharedActionCreators();
	static std::map<std::string, TriggerCreator>& SharedTriggerCreators();
	static std::map<std::string, ValueCreator>& SharedValueCreators();
};

#endif // !_BOT_AI_OBJECT_CONTEXT_H_
