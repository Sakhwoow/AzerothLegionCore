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

#include "BotEngine.h"
#include "BotAction.h"
#include "BotAiObjectContext.h"
#include "BotStrategy.h"
#include <algorithm>

BotEngine::BotEngine(Player* bot, BotAiObjectContext* context) : m_bot(bot), m_context(context) { }

BotEngine::~BotEngine()
{
	for (BotTriggerNode* node : m_triggers)
		delete node;
}

void BotEngine::AddStrategy(std::string const& name)
{
	if (m_strategies.count(name))
		return;

	BotStrategy* strategy = m_context->GetStrategy(name);
	if (!strategy)
		return;

	m_strategies[name] = strategy;
	RebuildTriggers();
}

void BotEngine::RemoveStrategy(std::string const& name)
{
	if (!m_strategies.erase(name))
		return;

	RebuildTriggers();
}

bool BotEngine::HasStrategy(std::string const& name) const
{
	return m_strategies.count(name) != 0;
}

void BotEngine::RebuildTriggers()
{
	// Simplest correct approach: throw away and re-collect every active strategy's trigger
	// nodes whenever the active strategy set changes (rare - only on AddStrategy/RemoveStrategy,
	// never on a normal tick), rather than trying to patch the list incrementally.
	for (BotTriggerNode* node : m_triggers)
		delete node;
	m_triggers.clear();

	for (auto const& pair : m_strategies)
		pair.second->InitTriggers(m_triggers);

	for (BotTriggerNode* node : m_triggers)
		if (!node->GetTrigger())
			node->SetTrigger(m_context->GetTrigger(node->GetName()));
}

bool BotEngine::DoNextAction(Unit* target)
{
	std::vector<NextBotAction> candidates;

	for (BotTriggerNode* node : m_triggers)
	{
		BotTrigger* trigger = node->GetTrigger();
		if (trigger && trigger->Check())
			for (NextBotAction const& action : node->GetHandlers())
				candidates.push_back(action);
	}

	for (auto const& pair : m_strategies)
		for (NextBotAction const& action : pair.second->GetDefaultActions())
			candidates.push_back(action);

	if (candidates.empty())
		return false;

	std::sort(candidates.begin(), candidates.end(),
		[](NextBotAction const& a, NextBotAction const& b) { return a.GetRelevance() > b.GetRelevance(); });

	for (NextBotAction const& candidate : candidates)
		if (ExecuteByName(candidate.GetName(), target, 0))
			return true;

	return false;
}

bool BotEngine::ExecuteByName(std::string const& name, Unit* target, int depth)
{
	// Guards against a cyclic GetAlternatives() chain (e.g. two actions naming each other as a
	// fallback by mistake) looping forever instead of just failing.
	if (depth > 10)
		return false;

	BotActionNode* node = m_context->GetActionNode(name);
	if (!node)
		return false;

	BotAction* action = node->GetAction();
	bool executed = action && action->IsUseful() && action->IsPossible() && action->Execute(target);

	if (!executed)
		for (NextBotAction const& alt : node->GetAlternatives())
			if (ExecuteByName(alt.GetName(), target, depth + 1))
			{
				executed = true;
				break;
			}

	delete node;
	return executed;
}
