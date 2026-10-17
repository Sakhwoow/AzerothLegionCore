-- Гилнеас, цепочка после "Приготовлений": квесты, у которых в базе нет точек появления нужных объектов или выключен ИИ сцены.
-- Найдено аудитом по всем 118 квестам карты 654 (цели-предметы/объекты/существа без единой точки у источника) и разбором
-- квеста "Отвоевать свое". Точки из ретейла неизвестны: берутся из quest_poi_points (центры целей квестов) и из соседних
-- спавнов (высота земли).
--
-- 1) "Отвоевать свое" / "Take Back What's Ours" (24646): предмет цели 50086 (Загадочный артефакт) падает только из сундука
-- "Worn Coffer" 201939 (лут 100%, только для квеста), а точек сундука не было вовсе (нет и в исходной TDB). Центр цели в
-- quest_poi_points - (-2119, 1630): охотничий домик на краю леса. Сундук ставим у двери домика, на проходимой земле в
-- 1.5-2 ярдах от места, где стоял игрок (-2122.9, 1626.8, -42.2), в фазе 186. guid 900050.
-- Откат: DELETE FROM gameobject WHERE guid = 900050 AND id = 201939.
DELETE FROM `gameobject` WHERE `guid` = 900050 AND `id` = 201939;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `ScriptName`, `VerifiedBuild`)
VALUES (900050, 201939, 654, 4714, 4730, 0, 0, 186, 0, -1, -2121.5, 1627.9, -42.2, 2.7, 0, 0, 0.9757, 0.219, 60, 255, 1, 0, '', 0);

-- 2) Рог Тал'дорена (заклинание 71061 -> событие 23338 в event_scripts) призывает Тобиаса Мистмантла (38029) и 7 следопытов
-- (38027), но у обоих шаблонов AIName пустой, поэтому весь SmartAI-сценарий (Тобиас кричит, следопыты нападают на темных
-- следопытов 38022 у домика, через 15 секунд отходят) не исполнялся: игрок трубил в рог, "ничего не происходило".
-- Включаем SmartAI только этим двум существам (строки smart_scripts уже есть). Статический спавн Тобиаса, guid 802301
-- (-2146, 1583, -49), - артефакт снифа (запись призванного существа): он стоял бы всегда, а в сценарии Тобиас призывается
-- событием в той же точке, поэтому статическая запись удалена (на нее ничего не ссылается).
-- Действия Speech в сценарии вызывали группы текстов 2 и 3, а это немецкие дубли группы 0 (в creature_text у 38029 группа 3 к тому
-- же ведет на ту же реплику "Haltet sie beschäftigt"): ставим группы 0 ("Займите их, братья мои!") и 1 ("Отступаем! Скрываемся в
-- лесу!"), русский текст берется из broadcast_text.
-- Откат: AIName = '' у 38027/38029; action_param1 = 2 (id 0) и 3 (id 4) у smart_scripts 3802900; строку creature guid 802301
-- можно вернуть из /root/legion_backup_20261017_batch2/creature_tobias_802301.sql.
UPDATE `creature_template` SET `AIName` = 'SmartAI' WHERE `entry` IN (38027, 38029) AND `AIName` = '';
DELETE FROM `creature` WHERE `guid` = 802301 AND `id` = 38029;
UPDATE `smart_scripts` SET `action_param1` = 0 WHERE `entryorguid` = 3802900 AND `source_type` = 9 AND `id` = 0 AND `action_type` = 1 AND `action_param1` = 2;
UPDATE `smart_scripts` SET `action_param1` = 1 WHERE `entryorguid` = 3802900 AND `source_type` = 9 AND `id` = 4 AND `action_type` = 1 AND `action_param1` = 3;

-- 3) "Ни человек, ни зверь" / "Neither Human Nor Beast" (24593, следующий за 24646): цель - выпить из трех колодцев ("Источник
-- ярости" 201950, "Источник покоя" 201951, "Источник равновесия" 201952, объекты-"gober" с Data1 = 24593), но ни одного колодца
-- не было. Центры целей в quest_poi_points ((-2061, 1270), (-2067, 1261), (-2076, 1265)) совпадают до ярда с тремя невидимыми
-- триггерами Generic Trigger LAB 35374 (guid 802260, 802273, 802245) рядом с Лордом Дарием Краули 37195: колодцы поставлены
-- в точки этих триггеров вместе с их высотой. Фаза 186, возрождение 5 секунд (после использования объект на пару секунд исчезает).
-- guid 900051-900053.
-- Откат: DELETE FROM gameobject WHERE guid BETWEEN 900051 AND 900053 AND id IN (201950, 201951, 201952).
DELETE FROM `gameobject` WHERE `guid` BETWEEN 900051 AND 900053 AND `id` IN (201950, 201951, 201952);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `ScriptName`, `VerifiedBuild`) VALUES
(900051, 201950, 654, 4714, 4730, 0, 0, 186, 0, -1, -2060.7, 1269.9, -85.66, 0, 0, 0, 0, 1, 5, 255, 1, 0, '', 0),
(900052, 201951, 654, 4714, 4730, 0, 0, 186, 0, -1, -2066.9, 1261.0, -85.46, 0, 0, 0, 0, 1, 5, 255, 1, 0, '', 0),
(900053, 201952, 654, 4714, 4730, 0, 0, 186, 0, -1, -2075.7, 1264.6, -85.14, 0, 0, 0, 0, 1, 5, 255, 1, 0, '', 0);

-- 4) "День освобождения" / "Liberation Day" (24575): цель - освободить 5 пленных селян (Enslaved Villager 37694, 18 штук на
-- карте 654, фаза 186), освобождение - это использование "Ball and Chain" 201775 (объект-gober, Data1 = 24575, скрипт
-- go_ball_and_chain_201775 ищет селянина в 5 ярдах), но кандалов в gameobject не было вовсе. Ставим по кандалам рядом с каждым
-- из 18 селян (в 0.8 ярда, высота селянина, та же фаза и область). Респаун селян 7200 -> 60 секунд: освобожденный селянин
-- исчезает и без этого был бы недоступен следующим игрокам два часа. guid кандалов = guid селянина + 98000 (900548-900627).
-- Откат: DELETE FROM gameobject WHERE id = 201775 AND guid BETWEEN 900500 AND 900699;
-- UPDATE creature SET spawntimesecs = 7200 WHERE id = 37694 AND map = 654 AND PhaseId = 186.
DELETE FROM `gameobject` WHERE `id` = 201775 AND `guid` BETWEEN 900500 AND 900699;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnDifficulties`, `phaseUseFlags`, `PhaseId`, `PhaseGroup`, `terrainSwapMap`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `isActive`, `ScriptName`, `VerifiedBuild`)
SELECT c.`guid` + 98000, 201775, c.`map`, c.`zoneId`, c.`areaId`, 0, 0, c.`PhaseId`, 0, -1, c.`position_x` + 0.8, c.`position_y` + 0.8, c.`position_z`, 0, 0, 0, 0, 1, 60, 255, 1, 0, '', 0
FROM `creature` c WHERE c.`id` = 37694 AND c.`map` = 654 AND c.`PhaseId` = 186;
UPDATE `creature` SET `spawntimesecs` = 60 WHERE `id` = 37694 AND `map` = 654 AND `PhaseId` = 186 AND `spawntimesecs` = 7200;

-- 5) "Упокоение" / "Laid to Rest" (24602): нужно 5 предметов "Unearthed Memento" (49921) с Disturbed Spirit 37884 (20 штук), а шанс
-- в creature_loot_template стоит 0.3059% (при QuestRequired = 1): среднее число убийств на предмет около 330, на пять предметов
-- около 1600. Цифра взята из агрегированных данных снифа (в таблице у этого существа 148 строк, у большинства шанс от 0.003 до
-- 5%: усреднен весь лут, который видели у существа), для квестового предмета она не имеет смысла. Ставим 60%.
-- (Такой же перекос у 43% всех квестовых предметов с существ базы - 12506 строк, 5355 из них с шансом < 5%: отдельная задача.)
-- Откат: Chance = 0.3059 у (37884, 49921).
UPDATE `creature_loot_template` SET `Chance` = 60 WHERE `Entry` = 37884 AND `Item` = 49921 AND `QuestRequired` = 1 AND `Chance` < 1;
