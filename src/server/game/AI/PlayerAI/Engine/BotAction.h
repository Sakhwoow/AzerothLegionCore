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

#ifndef _BOT_ACTION_H_
#define _BOT_ACTION_H_

#include <string>
#include <vector>

class Player;
class Unit;

// Common relevance bands, mirroring mod-playerbots' ACTION_DEFAULT/ACTION_HIGH/etc. (Strategy.h)
// closely enough to reuse the same mental model - not an exhaustive set, just the ones Phase 7+
// actually needs so far. A BotStrategy is free to use any float; these just name the common ones.
static constexpr float BOT_ACTION_IDLE = 1.0f;
static constexpr float BOT_ACTION_DEFAULT = 5.0f;
static constexpr float BOT_ACTION_HIGH = 20.0f;
static constexpr float BOT_ACTION_EMERGENCY = 90.0f;

// Named action with a priority ("relevance"), the unit a BotEngine executes once its triggers or
// a BotStrategy's default-action list nominate it for the current tick. Mirrors mod-playerbots'
// NextAction (Bot/Engine/Action/Action.h) - see the "Legion Bot Architecture" plan, Phase 6.
class TC_GAME_API NextBotAction
{
public:
	NextBotAction(std::string const& name, float relevance = 0.0f) : m_name(name), m_relevance(relevance) { }

	std::string const& GetName() const { return m_name; }
	float GetRelevance() const { return m_relevance; }

private:
	std::string m_name;
	float m_relevance;
};

// Does the real work for one named action. Mirrors mod-playerbots' Action (Bot/Engine/Action/
// Action.h), minus the generic Event wrapper - BotEngine passes the current combat/assist target
// (or nullptr) directly, which is all Phase 6-8's content needs. IsUseful()/IsPossible() are two
// separate gates on purpose, same as upstream: IsUseful() is a cheap "does this make sense right
// now" check, IsPossible() is the harder "can this actually execute" check (range/cooldown/mana) -
// splitting them lets a future cost-estimation pass short-circuit on the cheap check first.
class TC_GAME_API BotAction
{
public:
	BotAction(Player* bot, std::string const& name) : m_bot(bot), m_name(name) { }
	virtual ~BotAction() { }

	std::string const& GetName() const { return m_name; }

	virtual bool IsUseful() { return true; }
	virtual bool IsPossible() { return true; }
	virtual bool Execute(Unit* target) = 0;

	// Tried in order if Execute() returns false - same role as mod-playerbots'
	// Action::getAlternatives()/ActionNode prerequisite-chain, simplified to one list.
	virtual std::vector<NextBotAction> GetAlternatives() { return {}; }

protected:
	Player* m_bot;

private:
	std::string m_name;
};

// Resolved, per-tick wrapper binding an action name to its (possibly shared/cached) BotAction
// instance plus its alternatives list - mirrors mod-playerbots' ActionNode. Allocated fresh by
// BotAiObjectContext::GetActionNode() each time it's resolved and owned by whoever asked for it
// (BotEngine deletes it immediately after executing - see BotEngine.cpp).
class TC_GAME_API BotActionNode
{
public:
	BotActionNode(std::string const& name, std::vector<NextBotAction> alternatives = {})
		: m_name(name), m_action(nullptr), m_alternatives(std::move(alternatives)) { }

	std::string const& GetName() const { return m_name; }
	BotAction* GetAction() const { return m_action; }
	void SetAction(BotAction* action) { m_action = action; }
	std::vector<NextBotAction> const& GetAlternatives() const { return m_alternatives; }

private:
	std::string m_name;
	BotAction* m_action;
	std::vector<NextBotAction> m_alternatives;
};

#endif // !_BOT_ACTION_H_
