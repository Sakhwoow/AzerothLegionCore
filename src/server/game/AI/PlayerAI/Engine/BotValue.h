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

#ifndef _BOT_VALUE_H_
#define _BOT_VALUE_H_

#include "Timer.h"

class Player;

// Typed, named slot a BotStrategy/BotAction/BotTrigger reads. Two flavors, mirroring
// mod-playerbots' CalculatedValue<T>/ManualSetValue<T> (Bot/Engine/Value/Value.h):
//   - CalculatedBotValue<T>: memoizes an expensive Calculate() for checkIntervalMs, so e.g.
//     "lowest HP group member" isn't rescanned every single trigger check within the same tick.
//   - ManualBotValue<T>: a plain externally-settable slot with no calculation at all - the right
//     shape for a command-driven flag (".selfbot stay" sets one directly), see Phase 8.
template <class T>
class BotValue
{
public:
	virtual ~BotValue() { }
	virtual T Get() = 0;
	virtual void Set(T value) = 0;
	virtual void Reset() { }
};

template <class T>
class CalculatedBotValue : public BotValue<T>
{
public:
	CalculatedBotValue(Player* bot, uint32 checkIntervalMs = 0) :
		m_bot(bot), m_checkInterval(checkIntervalMs), m_lastCheckTime(0) { }
	virtual ~CalculatedBotValue() { }

	T Get() override
	{
		uint32 now = getMSTime();
		if (!m_lastCheckTime || m_checkInterval == 0 || now - m_lastCheckTime >= m_checkInterval)
		{
			m_lastCheckTime = now;
			m_value = Calculate();
		}
		return m_value;
	}

	// Lets a trigger seed/override the cache without forcing a recalculation this tick.
	void Set(T value) override { m_value = value; }
	void Reset() override { m_lastCheckTime = 0; }

protected:
	virtual T Calculate() = 0;

	Player* m_bot;
	uint32 m_checkInterval;
	uint32 m_lastCheckTime;
	T m_value;
};

template <class T>
class ManualBotValue : public BotValue<T>
{
public:
	explicit ManualBotValue(T defaultValue) : m_value(defaultValue), m_defaultValue(defaultValue) { }

	T Get() override { return m_value; }
	void Set(T value) override { m_value = value; }
	void Reset() override { m_value = m_defaultValue; }

private:
	T m_value;
	T m_defaultValue;
};

#endif // !_BOT_VALUE_H_
