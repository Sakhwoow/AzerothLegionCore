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

#ifndef _GUILD_TASK_MGR_H_
#define _GUILD_TASK_MGR_H_

#include "ObjectGuid.h"
#include <string>
#include <unordered_map>

class Player;
class Creature;
class Item;

// task_type column values (character_guild_task) - kept as plain constants rather than an enum
// class so they drop straight into the existing uint8/SQL plumbing without a cast at every site.
namespace GuildTaskType
{
	uint8 const Kill = 1;
	uint8 const CollectItem = 2;
}

// One bot's active guild task: either "kill countNeeded more of targetEntry" (taskType Kill) or
// "loot countNeeded more of targetEntry" (taskType CollectItem) - same targetEntry column,
// reinterpreted as a creature or item entry depending on taskType. Persisted in
// `character_guild_task` (characters DB) - see sql/updates/characters/2026_10_09_00_characters.sql.
struct GuildTask
{
	ObjectGuid::LowType guildId = 0;
	uint8 taskType = GuildTaskType::Kill;
	uint32 targetEntry = 0;
	uint16 countNeeded = 0;
	uint16 countDone = 0;
};

// Phase 9 ("Legion Bot Architecture" plan): a lightweight guild-task system for bot guild
// members - no AC port (mod-playerbots' GuildTaskMgr needs its own module database and a
// multi-type item/kill design this fork has no equivalent plumbing for), a fresh, deliberately
// small first version: one active task per bot, generated opportunistically off whatever the bot
// is already fighting/looting rather than a periodic world-wide sweep. The item-collection type
// (added after the kill-only first version) sidesteps the "needs a curated, level-appropriate
// item pool" problem the same way kill tasks do - it only ever targets an item entry the bot has
// *already organically looted*, never a guessed-at list, so it's inherently level-appropriate.
class TC_GAME_API GuildTaskMgr
{
public:
	GuildTaskMgr(GuildTaskMgr const&) = delete;
	GuildTaskMgr& operator=(GuildTaskMgr const&) = delete;

	static GuildTaskMgr* instance();

	// Called from the OnCreatureKill PlayerScript hook (sc_guildtask.cpp) for every kill a
	// provisioned bot account makes (real players/selfbot are never given tasks). Advances a
	// matching active task to completion+reward, or - if the bot has no active task - has a
	// small chance to start one targeting this same creature, provided the bot's guild actually
	// has an online real member (a task nobody can see the point of is pointless).
	void OnCreatureKilled(Player* bot, Creature* creature);

	// Called from BotGroupAI/BotFieldAI::OnLootedItem for every item a provisioned bot picks up
	// (same spot AutoGear's TryAutoEquipUpgrade already hooks). Advances a matching active
	// item-collection task to completion+reward, or - if the bot has no active task at all - has
	// a small chance to start one targeting this same item, under the same guild-has-a-real-
	// online-member gate OnCreatureKilled uses.
	void OnItemLooted(Player* bot, Item* item);

	// ".guildtask status" (cs_guildtask.cpp) - read-only, lists the caller's guild's currently
	// active bot tasks.
	std::string GetStatusText(ObjectGuid::LowType guildId);

private:
	GuildTaskMgr() = default;
	~GuildTaskMgr() = default;

	bool HasOnlineRealGuildMember(ObjectGuid::LowType guildId) const;
	GuildTask* GetOrLoadTask(ObjectGuid::LowType botGuid);
	void CreateTask(Player* bot, Creature* creature);
	void CreateItemTask(Player* bot, Item* item);
	void CompleteTask(Player* bot, GuildTask const& task);
	void SaveTask(ObjectGuid::LowType botGuid, GuildTask const& task);
	void DeleteTask(ObjectGuid::LowType botGuid);

	std::unordered_map<ObjectGuid::LowType, GuildTask> m_Tasks;
};

#define sGuildTaskMgr GuildTaskMgr::instance()

#endif // !_GUILD_TASK_MGR_H_
