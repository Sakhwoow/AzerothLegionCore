-- Гилнеас, "Застрявшие в болоте" (24468) и "Знакомство обязательно" (24472).
--
-- 1) 24468 (спасти 5 уцелевших в Хейлвудской трясине): цель квеста - убийство Swamp Crocolisk 37078 x5, но в таблице creature
-- не было НИ ОДНОГО крокодила 37078 (сниф дал 5 других, 36882, раскиданных вдали от уцелевших). Уцелевшие (Crash Survivor 37067,
-- 12 штук, фаза 186) не интерактивны (npcflag 0): их роль - драться с крокодилами, а скрипты npc_crash_survivor_37067 и
-- npc_swamp_crocolisk_37078 (zone_duskhaven.cpp) делают как раз это: уцелевший ищет крокодила 37078 в 4 ярдах и "дерётся" с
-- ним (урон между ними обнуляется), игрок убивает крокодила и получает кредит. Поэтому рядом с каждым уцелевшим ставим по
-- одному крокодилу 37078 (в 2.8 ярда, лицом к уцелевшему), фаза и зона те же, что у уцелевшего; респаун 60 секунд, чтобы
-- квест проходили и следующие игроки. guid 900035-900069 (900000 + разница с guid уцелевшего от 802000, диапазон 900000-900099
-- был свободен).
-- Откат: DELETE FROM creature WHERE id = 37078 AND guid BETWEEN 900000 AND 900099.
DELETE FROM `creature` WHERE `id` = 37078 AND `guid` BETWEEN 900000 AND 900099;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `movementmode`, `VerifiedBuild`)
SELECT s.`guid` - 802000 + 900000, 37078, s.`map`, s.`zoneId`, s.`areaId`, s.`spawnDifficulties`, s.`phaseUseFlags`, s.`PhaseId`, s.`PhaseGroup`, s.`terrainSwapMap`, 0, 0, s.`position_x` + 2, s.`position_y` + 2, s.`position_z`, 3.927, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 0
FROM `creature` s WHERE s.`id` = 37067 AND s.`map` = 654 AND s.`PhaseId` = 186;

-- 2) 24472 (убить 4 огров-приспешников и забрать знамя Коротха в его логове): знамя - сундук 201594 (go_koroths_banner_201594,
-- в луте предмет 49742 только для квеста), а в gameobject для него не было ни одной точки: предмет получить было нельзя.
-- Логово Коротха: Koroth the Hillbreaker 36294 (guid 802077) стоит в (-2253.9, 1964.6, 100.9), фаза 186, область 4794.
-- Знамя ставим рядом с ним (5.5 ярда, на той же высоте); скрипт знамени ищет Коротха в 50 ярдах.
-- Откат: DELETE FROM gameobject WHERE guid = 900001 AND id = 201594.
DELETE FROM `gameobject` WHERE `guid` = 900001 AND `id` = 201594;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `ScriptName`, `VerifiedBuild`)
VALUES (900001, 201594, 654, 4714, 4794, 0, 0, 186, 0, -1, -2258.0, 1961.0, 100.9, 0, 0, 0, 0, 1, 30, 255, 1, 0, '', 0);
