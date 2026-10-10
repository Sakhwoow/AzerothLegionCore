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

#include "GuildTaskMgr.h"
#include "BotAITool.h"
#include "Player.h"
#include "Creature.h"
#include "Item.h"
#include "ItemTemplate.h"
#include "Guild.h"
#include "GuildMgr.h"
#include "DatabaseEnv.h"
#include "Log.h"
#include <sstream>

namespace
{
	// Only plain trash counts as a task target - never trivializes a rare/elite/boss kill into
	// routine task progress. `rank` is the long-stable CreatureEliteType field (0 = normal).
	bool IsEligibleTaskTarget(Creature* creature)
	{
		if (!creature || !creature->GetCreatureTemplate())
			return false;
		if (creature->GetCreatureTemplate()->rank != 0)
			return false;
		if (creature->IsDungeonBoss())
			return false;
		return true;
	}

	// Trade goods only (ore/herb/cloth/leather/etc.) - never gear (AutoGear already owns that
	// decision elsewhere, and "collect more" makes no sense for a unique equip slot) and never
	// anything above Uncommon quality (a rare/epic drop shouldn't turn into routine farm fodder).
	// No curated list: eligibility is just "is this the kind of stackable mat a guild would
	// plausibly want more of", the actual WHICH item is always whatever the bot already looted.
	bool IsEligibleItemTaskTarget(ItemTemplate const* proto)
	{
		if (!proto)
			return false;
		if (proto->GetClass() != ITEM_CLASS_TRADE_GOODS)
			return false;
		if (proto->GetQuality() > ITEM_QUALITY_UNCOMMON)
			return false;
		return true;
	}

	struct OnlineRealMemberChecker
	{
		bool found = false;
		void operator()(Player* player)
		{
			if (player && !player->IsPlayerBot())
				found = true;
		}
	};
}

GuildTaskMgr* GuildTaskMgr::instance()
{
	static GuildTaskMgr instance;
	return &instance;
}

bool GuildTaskMgr::HasOnlineRealGuildMember(ObjectGuid::LowType guildId) const
{
	Guild* guild = sGuildMgr->GetGuildById(guildId);
	if (!guild)
		return false;

	OnlineRealMemberChecker checker;
	guild->BroadcastWorker(checker);
	return checker.found;
}

GuildTask* GuildTaskMgr::GetOrLoadTask(ObjectGuid::LowType botGuid)
{
	// Caches a "confirmed no active task" sentinel (targetEntry == 0) just as much as a real
	// task, so a bot that doesn't currently have one only ever costs a single DB lookup (the
	// first kill after server start), not one per kill forever after - bots kill constantly,
	// and this exact "DB/expensive check on every tick/event instead of caching the miss" shape
	// has caused real perf incidents on this codebase before (see e.g. the x5 guild-bot GUID
	// cache freeze, the IsCraftedBySkill hang).
	auto itr = m_Tasks.find(botGuid);
	if (itr != m_Tasks.end())
		return itr->second.targetEntry != 0 ? &itr->second : nullptr;

	QueryResult result = CharacterDatabase.PQuery(
		"SELECT guild_id, task_type, target_entry, count_needed, count_done FROM character_guild_task WHERE guid = " UI64FMTD,
		botGuid);

	GuildTask task; // default-constructed targetEntry == 0 IS the "no task" sentinel
	if (result)
	{
		Field* fields = result->Fetch();
		task.guildId = fields[0].GetUInt64();
		task.taskType = fields[1].GetUInt8();
		task.targetEntry = fields[2].GetUInt32();
		task.countNeeded = fields[3].GetUInt16();
		task.countDone = fields[4].GetUInt16();
	}

	auto insertedItr = m_Tasks.emplace(botGuid, task).first;
	return insertedItr->second.targetEntry != 0 ? &insertedItr->second : nullptr;
}

void GuildTaskMgr::SaveTask(ObjectGuid::LowType botGuid, GuildTask const& task)
{
	CharacterDatabase.PExecute(
		"REPLACE INTO character_guild_task (guid, guild_id, task_type, target_entry, count_needed, count_done, created_time) "
		"VALUES (" UI64FMTD ", " UI64FMTD ", %u, %u, %u, %u, %u)",
		botGuid, task.guildId, uint32(task.taskType), task.targetEntry, uint32(task.countNeeded), uint32(task.countDone), uint32(time(nullptr)));
}

void GuildTaskMgr::DeleteTask(ObjectGuid::LowType botGuid)
{
	// Overwritten with the default-constructed "no task" sentinel rather than erased, so the
	// cache invariant GetOrLoadTask relies on (every seen botGuid has a cache entry) holds.
	m_Tasks[botGuid] = GuildTask();
	CharacterDatabase.PExecute("DELETE FROM character_guild_task WHERE guid = " UI64FMTD, botGuid);
}

void GuildTaskMgr::CreateTask(Player* bot, Creature* creature)
{
	GuildTask task;
	task.guildId = bot->GetGuildId();
	task.taskType = GuildTaskType::Kill;
	task.targetEntry = creature->GetEntry();
	task.countNeeded = uint16(urand(3, 6));
	task.countDone = 1; // the kill that triggered CreateTask already counts

	ObjectGuid::LowType botGuid = bot->GetGUID().GetCounter();
	m_Tasks[botGuid] = task;
	SaveTask(botGuid, task);

	if (BotUtility::GuildTaskDebug)
		TC_LOG_INFO("server.loading", ">> GuildTask: %s got a new task - kill %u more %s (entry %u)",
			bot->GetName().c_str(), task.countNeeded - task.countDone, creature->GetName().c_str(), task.targetEntry);
}

void GuildTaskMgr::CreateItemTask(Player* bot, Item* item)
{
	GuildTask task;
	task.guildId = bot->GetGuildId();
	task.taskType = GuildTaskType::CollectItem;
	task.targetEntry = item->GetEntry();
	task.countNeeded = uint16(urand(3, 6));
	task.countDone = 1; // the loot that triggered CreateItemTask already counts

	ObjectGuid::LowType botGuid = bot->GetGUID().GetCounter();
	m_Tasks[botGuid] = task;
	SaveTask(botGuid, task);

	if (BotUtility::GuildTaskDebug)
		TC_LOG_INFO("server.loading", ">> GuildTask: %s got a new task - collect %u more of item %u",
			bot->GetName().c_str(), task.countNeeded - task.countDone, task.targetEntry);
}

void GuildTaskMgr::CompleteTask(Player* bot, GuildTask const& task)
{
	// Reward goes to the bot's own character - simplest, safest option for a first version
	// (no cross-character/guild-bank gold transfer logic to get wrong). Scales modestly with
	// how many kills the task asked for.
	uint32 reward = uint32(task.countNeeded) * 2 * GOLD;
	bot->ModifyMoney(int64(reward));

	if (Guild* guild = sGuildMgr->GetGuildById(task.guildId))
	{
		std::ostringstream msg;
		msg << bot->GetName() << " completed a guild task.";
		guild->BroadcastToGuild(bot->GetSession(), false, msg.str(), LANG_UNIVERSAL);
	}

	if (BotUtility::GuildTaskDebug)
		TC_LOG_INFO("server.loading", ">> GuildTask: %s completed task (entry %u, x%u), rewarded %u copper",
			bot->GetName().c_str(), task.targetEntry, uint32(task.countNeeded), reward);

	DeleteTask(bot->GetGUID().GetCounter());
}

void GuildTaskMgr::OnCreatureKilled(Player* bot, Creature* creature)
{
	if (!BotUtility::GuildTaskEnabled || !bot || !creature || !bot->GetGuildId())
		return;

	ObjectGuid::LowType botGuid = bot->GetGUID().GetCounter();
	if (GuildTask* task = GetOrLoadTask(botGuid))
	{
		if (task->taskType != GuildTaskType::Kill || task->targetEntry != creature->GetEntry())
			return;

		task->countDone++;
		if (task->countDone >= task->countNeeded)
		{
			GuildTask finished = *task; // CompleteTask deletes the cached entry - copy first
			CompleteTask(bot, finished);
		}
		else
			SaveTask(botGuid, *task);
		return;
	}

	if (!IsEligibleTaskTarget(creature))
		return;
	if (urand(0, 99) >= BotUtility::GuildTaskChancePercent)
		return;
	if (!HasOnlineRealGuildMember(bot->GetGuildId()))
		return;

	CreateTask(bot, creature);
}

void GuildTaskMgr::OnItemLooted(Player* bot, Item* item)
{
	if (!BotUtility::GuildTaskEnabled || !bot || !item || !bot->GetGuildId())
		return;

	ObjectGuid::LowType botGuid = bot->GetGUID().GetCounter();
	if (GuildTask* task = GetOrLoadTask(botGuid))
	{
		if (task->taskType != GuildTaskType::CollectItem || task->targetEntry != item->GetEntry())
			return;

		task->countDone++;
		if (task->countDone >= task->countNeeded)
		{
			GuildTask finished = *task; // CompleteTask deletes the cached entry - copy first
			CompleteTask(bot, finished);
		}
		else
			SaveTask(botGuid, *task);
		return;
	}

	if (!IsEligibleItemTaskTarget(item->GetTemplate()))
		return;
	if (urand(0, 99) >= BotUtility::GuildTaskChancePercent)
		return;
	if (!HasOnlineRealGuildMember(bot->GetGuildId()))
		return;

	CreateItemTask(bot, item);
}

std::string GuildTaskMgr::GetStatusText(ObjectGuid::LowType guildId)
{
	QueryResult result = CharacterDatabase.PQuery(
		"SELECT c.name, t.task_type, t.target_entry, t.count_done, t.count_needed FROM character_guild_task t "
		"INNER JOIN characters c ON c.guid = t.guid WHERE t.guild_id = " UI64FMTD, guildId);
	if (!result)
		return "No active guild tasks.";

	std::ostringstream out;
	do
	{
		Field* fields = result->Fetch();
		uint8 taskType = fields[1].GetUInt8();
		out << fields[0].GetString() << ": " << (taskType == GuildTaskType::CollectItem ? "collect item " : "kill creature ")
			<< fields[2].GetUInt32() << " (" << fields[3].GetUInt16() << "/" << fields[4].GetUInt16() << ")\n";
	} while (result->NextRow());

	return out.str();
}
