-- Квест 24679 "Благословение патриарха" (Patriarch's Blessing): предмет "Благословенные подношения" (51956) применяет спелл 72853 "Поместить благословенные подношения",
-- которому нужен рядом объект-фокус заклинаний 1643 ("Могила Адерика", gameobject_template 201964, тип 8, дистанция 10 ярдов). Объекта нет ни в одной строке gameobject
-- (невидимые объекты-фокусы сниффер не получает), поэтому игрок у самой могилы получал "Требуется: находиться рядом с могилой Адерика".
-- Ставим 201964 на место могилы (рядом стоит Generic Trigger LAB - Multiphase 35374, guid 803976, в -1644.36, 1903.43, 30.07), фаза 188.
-- Откат: DELETE FROM gameobject WHERE guid = 900054;
DELETE FROM `gameobject` WHERE `guid` = 900054;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `ScriptName`, `VerifiedBuild`)
SELECT 900054, 201964, c.`map`, c.`zoneId`, c.`areaId`, 0, 0, c.`PhaseId`, 0, -1, c.`position_x`, c.`position_y`, c.`position_z`, 0, 0, 0, 0, 1, 300, 255, 1, 0, '', 0
FROM `creature` c WHERE c.`guid` = 803976 AND c.`id` = 35374;
