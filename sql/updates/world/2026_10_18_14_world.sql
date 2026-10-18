-- Затерянные острова, сцена оживления после катсцены потопления яхты ("На краю гибели!" 69010 -> Док Заппоцел 36608 -> квест 14239 "Не иди на свет!"): игрок оставался обездвиженным навсегда,
-- потому что Дока никто не призывал. Заппоцела призывает спелл 69018 (его вызывает скрипт spell_lost_isles_near_death при наложении 69010), точка призыва у него TARGET_DEST_NEARBY_ENTRY,
-- и условие (conditions, SourceType 13, спелл 69018) требует рядом существо 28960 "Totally Generic Bunny (JSB)". На карте 648 ни одного такого существа не было (сниффер не видит невидимые триггеры),
-- поэтому призыв не находил цель и срывался молча.
-- Ставим невидимый триггер 28960 в точку, куда Док плывёт по сценарию скрипта (538.785, 3271.09, -1.08, около спасательной шлюпки), в фазе 170 игрока на берегу.
-- Откат: DELETE FROM creature WHERE guid = 900110;
DELETE FROM `creature` WHERE `guid` = 900110;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `movementmode`, `VerifiedBuild`)
SELECT 900110, 28960, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, 0, 0, 538.785, 3271.09, -1.08, 3.0, 120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0
FROM `creature` WHERE `guid` = 21016403 AND `id` = 36600;
