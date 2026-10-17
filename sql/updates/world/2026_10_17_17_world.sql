-- Гилнеас, "Битва за Гилнеас" / "The Battle for Gilneas City" (24904): после сдачи "Полное уничтожение" ("Push Them Out", 24676) вокруг не остается ни одного НПС,
-- у которого можно взять следующий квест.
-- Скрипт Лорны Краули (npc_lorna_crowley_37783, zone_duskhaven.cpp) при сдаче 24676 снимает с игрока фазу 186 (аура 69484) и накладывает фазу 187
-- (аура 69485, окно в spell_area для зон 4714 и 4755 до сдачи 24904). Лорна 37783 на заставе Ливери (guid 802508, -1369.1, 1209.9, 35.6) стоит ТОЛЬКО в фазе 186,
-- и сразу после сдачи игрок остается на заставе, где в фазе 187 есть лишь Мириам Спеллвокер 38465, сестра Альмира 38466, охотник Блейк 38467 и мастифы (квестов
-- у них нет). У "Битвы за Гилнеас" в creature_queststarter два стартера - Лорна 37783 (застава) и Лорна 38611 (в городе, фаза 187, (-1664, 1590, 23), в
-- 480 ярдах от заставы): значит, у заставы Лорна должна быть видна и в фазе 187, а в сниф-базе у нее осталась одна запись (с фазой 186).
-- Ставим копию Лорны 37783 в фазе 187 в той же точке заставы (guid 900100, возрождение 60 секунд): игрок берет "Битву за Гилнеас" на заставе и идет в город,
-- сдавать ее будет Лорне 38611 (единственный ender квеста). Цель квеста - кредит 38854, его дает скрипт битвы в городе (zone_gilneas_city2.cpp).
-- Откат: DELETE FROM creature WHERE guid = 900100 AND id = 37783.
DELETE FROM `creature` WHERE `guid` = 900100 AND `id` = 37783;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `movementmode`, `VerifiedBuild`)
SELECT 900100, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, 187, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, 60, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `movementmode`, `VerifiedBuild`
FROM `creature` WHERE `guid` = 802508 AND `id` = 37783;
UPDATE `creature` SET `spawntimesecs` = 60 WHERE `guid` = 802508 AND `spawntimesecs` = 7200;
