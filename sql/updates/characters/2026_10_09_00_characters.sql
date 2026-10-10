-- Phase 9 ("Legion Bot Architecture" plan): guild tasks for bot guild members. One active
-- task per bot character (guid is the PK on purpose - a bot never has more than one task at a
-- time in this first version). task_type: 1 = kill creature (target_entry is a creature entry),
-- 2 = collect item (target_entry is an item entry, see GuildTaskMgr::OnItemLooted).
DROP TABLE IF EXISTS `character_guild_task`;

CREATE TABLE `character_guild_task` (
  `guid` bigint(20) unsigned NOT NULL,
  `guild_id` bigint(20) unsigned NOT NULL,
  `task_type` tinyint unsigned NOT NULL DEFAULT '1',
  `target_entry` int unsigned NOT NULL,
  `count_needed` smallint unsigned NOT NULL DEFAULT '1',
  `count_done` smallint unsigned NOT NULL DEFAULT '0',
  `created_time` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_guild_id` (`guild_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
