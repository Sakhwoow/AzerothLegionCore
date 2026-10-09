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

#ifndef _BOT_STRATEGY_H_
#define _BOT_STRATEGY_H_

#include "BotTrigger.h"
#include <vector>

class Player;

// Named, pluggable bundle of triggers plus a priority-ordered default-action list - a single
// "behavior module" a BotEngine can add/remove by name (e.g. "rotation", "heal", "stay").
// Mirrors mod-playerbots' Strategy (Bot/Engine/Strategy/Strategy.h). See the "Legion Bot
// Architecture" plan, Phase 6 (this scaffolding) and Phase 7 (SelfBotAI's existing behavior
// re-expressed as strategies built on it).
class TC_GAME_API BotStrategy
{
public:
	BotStrategy(Player* bot) : m_bot(bot) { }
	virtual ~BotStrategy() { }

	virtual std::string const GetName() = 0;

	// Always-candidate actions for this strategy, independent of any trigger firing - e.g. a
	// rotation strategy's per-class spell-priority list. Mirrors Strategy::getDefaultActions().
	virtual std::vector<NextBotAction> GetDefaultActions() { return {}; }

	// Appends this strategy's own trigger nodes to the engine's combined list. Mirrors
	// Strategy::InitTriggers() - implementations push_back() new BotTriggerNode*s they own;
	// BotEngine resolves each node's underlying BotTrigger* via BotAiObjectContext afterward.
	virtual void InitTriggers([[maybe_unused]] std::vector<BotTriggerNode*>& triggers) { }

protected:
	Player* m_bot;
};

#endif // !_BOT_STRATEGY_H_
