-- Гилнеас, "Битва за Гилнеас" (24904): данные для скрипта битвы (zone_gilneas_city2.cpp, около 3000 строк с волнами, группами и финальной сценой Сильваны),
-- который в базе не запускался, потому что его участники у заставы Ливери расставлены не так, как ждет скрипт.
-- Как битва стартует по скрипту: у заставы стоят вместе Креннан Аранас 38553 (разговор "Let us take back our city!"), сестра Альмира 38466 (ведущая AI
-- события), принц Лиам 38218 (средняя группа) и Мириам 38465 (левая группа); ополчение всех трех групп призывается скриптом в точки около (-1406, 1240)
-- (SpawnPosGroup1-3). Креннан проверяет, что Лиам и Альмира в 50 ярдах от него, Альмира находит Креннана в 25 ярдах, Лиам находит Альмиру в 50 ярдах.
-- Группы Генна, Дариуса, Лорны 38426 и Сильвана стоят в городе (позиции совпадают с SpawnPosGroup4/5) и присоединяются в более поздних волнах - в базе они
-- стоят правильно.
-- Что не совпадало:
-- 1) Креннан 38553 (guid 802514, (-1391.2, 1236.1, 35.6)) стоял только в фазе 186; игрок после "Полное уничтожение" (24676) в фазе 187 его не видит. Копия в 187.
-- 2) Принц Лиам 38218 (guid 802761) стоял у ворот города (-1770.8, 1381.1, 19.8), в 400 ярдах от Альмиры и Креннана: ни проверка Креннана, ни
--    регистрация Лиама у Альмиры не срабатывали. Перенесен к заставе, между Мириам и Альмирой.
-- 3) Для финала нет путей waypoint_data: 3847401 (принц Лиам 38474 бежит к Генну, на 2-й точке кричит и Сильвана целится, на 3-й она стреляет и он погибает,
--    после чего Сильвана через 7 секунд выдает кредит цели 38854) и 3846901 (уход Сильваны, на 2-й точке она исчезает). Пути построены от точек из скрипта:
--    Лиам 38474 призывается в (-1634.6, 1632.9, 21.2), Генн приходит к (-1680.9, 1619.7, 20.5), Сильвана стоит в (-1678, 1612, 21).
-- 4) Статический Лиам 38474 (guid 802851, (-1635, 1632, 21)) - запись снифа призванного существа: скрипт Сильваны призывает Лиама в ту же точку, и без
--    удаления двойник стоял бы на месте, пока настоящий бежит к Генну.
-- Откат: DELETE FROM creature WHERE guid = 900101 AND id = 38553; UPDATE creature (position_x, position_y, position_z, orientation, areaId) для guid 802761 по
-- бэкапу /root/legion_backup_20261017_batch2/creature_battle_krennan_liam_802514_802761_802851.sql (там же строка 802851); DELETE FROM waypoint_data WHERE id IN (3847401, 3846901).
DELETE FROM `creature` WHERE `guid` = 900101 AND `id` = 38553;
INSERT INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `movementmode`, `VerifiedBuild`)
SELECT 900101, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, 187, `PhaseGroup`, `terrainSwapMap`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, 60, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `unit_flags2`, `unit_flags3`, `dynamicflags`, `ScriptName`, `movementmode`, `VerifiedBuild`
FROM `creature` WHERE `guid` = 802514 AND `id` = 38553;
UPDATE `creature` SET `zoneId` = 4714, `areaId` = 4842, `position_x` = -1407, `position_y` = 1252, `position_z` = 36.6, `orientation` = 1.6 WHERE `guid` = 802761 AND `id` = 38218 AND `position_x` < -1700;
DELETE FROM `creature` WHERE `guid` = 802851 AND `id` = 38474;
DELETE FROM `waypoint_data` WHERE `id` IN (3847401, 3846901);
INSERT INTO `waypoint_data` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`, `delay`, `move_type`, `action`, `action_chance`, `wpguid`) VALUES
(3847401, 1, -1648, 1628.5, 20.9, 0, 0, 1, 0, 100, 0),
(3847401, 2, -1660, 1624, 20.6, 0, 0, 1, 0, 100, 0),
(3847401, 3, -1670.5, 1620.5, 20.5, 0, 0, 1, 0, 100, 0),
(3847401, 4, -1675, 1619, 20.5, 0, 0, 1, 0, 100, 0),
(3846901, 1, -1692, 1602, 21, 0, 0, 0, 0, 100, 0),
(3846901, 2, -1708, 1592, 21, 0, 0, 0, 0, 100, 0),
(3846901, 3, -1724, 1582, 21, 0, 0, 0, 0, 100, 0);
