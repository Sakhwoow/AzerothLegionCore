-- Removes the 13 npc_rate_xp_modifier ("Klauss") spawns and their creature_template row -
-- replaced by the ".xp rate" chat command (XpRateCommand.Enable in worldserver.conf), no NPC
-- needed anymore.
DELETE FROM `creature` WHERE `id` = 1000000;
DELETE FROM `creature_template` WHERE `entry` = 1000000;
