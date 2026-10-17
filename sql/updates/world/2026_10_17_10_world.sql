-- Гилнеас, "Знакомство обязательно" (24472): убить 4 огров-приспешников и забрать знамя Коротха в его логове.
-- Знамя - сундук 201594 (go_koroths_banner_201594, в луте предмет 49742 только для квеста), а в gameobject для него не
-- было ни одной точки: предмет получить было нельзя.
-- Логово Коротха: Koroth the Hillbreaker 36294 (guid 802077) стоит в (-2253.9, 1964.6, 100.9), фаза 186, область 4794.
-- Знамя ставим рядом с ним (5.5 ярда, на той же высоте); скрипт знамени ищет Коротха в 50 ярдах. Настоящие координаты
-- знамени из ретейла неизвестны, это приблизительная позиция.
-- Откат: DELETE FROM gameobject WHERE guid = 900001 AND id = 201594.
DELETE FROM `gameobject` WHERE `guid` = 900001 AND `id` = 201594;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `ScriptName`, `VerifiedBuild`)
VALUES (900001, 201594, 654, 4714, 4794, 0, 0, 186, 0, -1, -2258.0, 1961.0, 100.9, 0, 0, 0, 0, 1, 30, 255, 1, 0, '', 0);
