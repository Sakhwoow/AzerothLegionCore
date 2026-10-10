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

#include "BotAiObjectContext.h"
#include "BotAction.h"
#include "BotStrategy.h"
#include "BotTrigger.h"

BotAiObjectContext::BotAiObjectContext(Player* bot) : m_bot(bot) { }
BotAiObjectContext::~BotAiObjectContext() { }

std::map<std::string, BotAiObjectContext::StrategyCreator>& BotAiObjectContext::SharedStrategyCreators()
{
	static std::map<std::string, StrategyCreator> creators;
	return creators;
}

std::map<std::string, BotAiObjectContext::ActionCreator>& BotAiObjectContext::SharedActionCreators()
{
	static std::map<std::string, ActionCreator> creators;
	return creators;
}

std::map<std::string, BotAiObjectContext::TriggerCreator>& BotAiObjectContext::SharedTriggerCreators()
{
	static std::map<std::string, TriggerCreator> creators;
	return creators;
}

std::map<std::string, BotAiObjectContext::ValueCreator>& BotAiObjectContext::SharedValueCreators()
{
	static std::map<std::string, ValueCreator> creators;
	return creators;
}

void BotAiObjectContext::RegisterStrategy(std::string const& name, StrategyCreator creator)
{
	SharedStrategyCreators()[name] = std::move(creator);
}

void BotAiObjectContext::RegisterAction(std::string const& name, ActionCreator creator)
{
	SharedActionCreators()[name] = std::move(creator);
}

void BotAiObjectContext::RegisterTrigger(std::string const& name, TriggerCreator creator)
{
	SharedTriggerCreators()[name] = std::move(creator);
}

void BotAiObjectContext::RegisterValue(std::string const& name, ValueCreator creator)
{
	SharedValueCreators()[name] = std::move(creator);
}

BotStrategy* BotAiObjectContext::GetStrategy(std::string const& name)
{
	auto itr = m_strategies.find(name);
	if (itr != m_strategies.end())
		return itr->second.get();

	auto creatorItr = SharedStrategyCreators().find(name);
	if (creatorItr == SharedStrategyCreators().end())
		return nullptr;

	BotStrategy* strategy = creatorItr->second(m_bot);
	m_strategies.emplace(name, std::unique_ptr<BotStrategy>(strategy));
	return strategy;
}

BotTrigger* BotAiObjectContext::GetTrigger(std::string const& name)
{
	auto itr = m_triggers.find(name);
	if (itr != m_triggers.end())
		return itr->second.get();

	auto creatorItr = SharedTriggerCreators().find(name);
	if (creatorItr == SharedTriggerCreators().end())
		return nullptr;

	BotTrigger* trigger = creatorItr->second(m_bot);
	m_triggers.emplace(name, std::unique_ptr<BotTrigger>(trigger));
	return trigger;
}

UntypedBotValue* BotAiObjectContext::GetUntypedValue(std::string const& name)
{
	auto itr = m_values.find(name);
	if (itr != m_values.end())
		return itr->second.get();

	auto creatorItr = SharedValueCreators().find(name);
	if (creatorItr == SharedValueCreators().end())
		return nullptr;

	UntypedBotValue* value = creatorItr->second(m_bot);
	m_values.emplace(name, std::unique_ptr<UntypedBotValue>(value));
	return value;
}

BotActionNode* BotAiObjectContext::GetActionNode(std::string const& name)
{
	auto creatorItr = SharedActionCreators().find(name);
	if (creatorItr == SharedActionCreators().end())
		return nullptr;

	BotAction* action;
	auto itr = m_actions.find(name);
	if (itr != m_actions.end())
		action = itr->second.get();
	else
	{
		action = creatorItr->second(m_bot);
		m_actions.emplace(name, std::unique_ptr<BotAction>(action));
	}

	BotActionNode* node = new BotActionNode(name);
	node->SetAction(action);
	return node;
}
