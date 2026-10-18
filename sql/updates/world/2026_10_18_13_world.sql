-- Кезан, квест 14122 "Ограбление банка" (The Great Bank Heist): выполнен, а сдать некому. Сдаётся Сассе Гаечный Ключ 34668 (точка сдачи на карте квеста: -8417, 1325, это спавн Сассы в фазе 382,
-- -8425, 1322, 103; Сасса в фазе 380 и 169 стоит в штабе в -8424, 1366). Фаз 380-382 в phase_area не было вообще (там вечеринка у штаба ТКК), поэтому игрок видел мир в 169/172/383 без Сассы.
-- Добавляем фазу 382 в зону 4737 с условием "квест 14122 принят, выполнен или сдан" (статусы 2+8+64 = 74), как у соседних фаз 169/383/384 (условия SourceType 26).
-- Откат: DELETE FROM phase_area WHERE AreaId = 4737 AND PhaseId = 382; DELETE FROM conditions WHERE SourceTypeOrReferenceId = 26 AND SourceGroup = 382 AND SourceEntry = 4737;
DELETE FROM `phase_area` WHERE `AreaId` = 4737 AND `PhaseId` = 382;
INSERT INTO `phase_area` (`AreaId`, `PhaseId`, `Comment`) VALUES (4737, 382, 'Кезан: Сасса и вечеринка у штаба, видна при квесте 14122 (Ограбление банка)');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceGroup` = 382 AND `SourceEntry` = 4737;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT `SourceTypeOrReferenceId`, 382, `SourceEntry`, `SourceId`, 0, `ConditionTypeOrReference`, `ConditionTarget`, 14122, 74, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, 'Кезан фаза 382: квест 14122 принят, выполнен или сдан'
FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceGroup` = 169 AND `SourceEntry` = 4737 AND `ConditionTypeOrReference` = 47 LIMIT 1;

-- Метка сдачи 14122 стояла у банка (-8348, 1724): в quest_poi у квеста две метки "сдать" (ObjectiveIndex -1): первая у банка (BlobIndex 0) и вторая у штаба ТКК, где стоит Сасса (-8417, 1325, BlobIndex 3).
-- Клиент показывал первую, игрок шёл к банку и никого не находил. Убираем метку сдачи у банка; цели у банка (ObjectiveIndex 0 и 1) остаются.
-- Откат: INSERT INTO quest_poi SELECT ... из /root/legion_backup_20261018_poi/quest_poi_14122.sql (бэкап сделан перед правкой).
DELETE FROM `quest_poi` WHERE `QuestID` = 14122 AND `BlobIndex` = 0 AND `Idx1` = 0 AND `ObjectiveIndex` = -1;

-- Кезан, квест 14125 "Страховочный план": объекты цели (Неисправный генератор 201735, Прохудившаяся печка 201733, Легковоспламеняющаяся кровать 201734, штаб ТКК, -8421, 1373, 105)
-- стоят только в фазе 169, а после сдачи 14116 фаза 169 игроку не выдаётся (условие SourceType 26 для 169 требует 14116 в статусах 11), поэтому объекты были невидимы и недоступны.
-- Добавляем второе условие (ElseGroup 1) для фазы 169: квест 14125 принят и не выполнен (статус 8).
-- Откат: DELETE FROM conditions WHERE SourceTypeOrReferenceId = 26 AND SourceGroup = 169 AND SourceEntry = 4737 AND ElseGroup = 1;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceGroup` = 169 AND `SourceEntry` = 4737 AND `ElseGroup` = 1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`)
SELECT `SourceTypeOrReferenceId`, 169, `SourceEntry`, `SourceId`, 1, `ConditionTypeOrReference`, `ConditionTarget`, 14125, 8, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, 'Кезан фаза 169: квест 14125 принят и не выполнен'
FROM `conditions` WHERE `SourceTypeOrReferenceId` = 26 AND `SourceGroup` = 169 AND `SourceEntry` = 4737 AND `ConditionTypeOrReference` = 47 AND `ElseGroup` = 0 LIMIT 1;

-- Квест 14125, четвёртая цель "Штаб-квартира ТКК подожжена с помощью газобота": газобот (37598, скрипт npc_kezan_gasbot) призывается спеллом 70253 (скрипт spell_summon_gasbot), но никто его не кастует:
-- в ретейле это делала цепочка SmartAI (невидимые триггеры), в базе её нет (AIName пустой), поэтому после трёх объектов ничего не происходило.
-- Упрощение: когда игрок использует Легковоспламеняющуюся кровать (её спелл 70245, Data10 объекта 201734), игроком же кастуется 70253: газобот призывается, едет в штаб, поджигает его и засчитывает кредит.
-- (Первая попытка с триггером 70247 не сработала: аура с таким номером на игроке не появляется.)
-- Откат: DELETE FROM spell_linked_spell WHERE spell_trigger = 70245 AND spell_effect = 70253;
DELETE FROM `spell_linked_spell` WHERE `spell_effect` = 70253;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES (70245, 70253, 0, 'Кезан 14125: использование кровати вызывает газобота');

-- Газобот 37598 призывался, но стоял на месте: его C++ скрипт (npc_kezan_gasbot) гонит его к точке штаба напрямую через MovePoint и в здании (нет навигационной сетки) не двигается,
-- а клик по нему невозможен (нет флага спеллклика, и в ретейле он едет сам). В базе есть готовый ретейл-сценарий: SmartAI, путь 37598 в таблице waypoints из трёх точек в штабе,
-- по приходу список 3759800 (кредит владельцу, реплика Оценщика, исчезновение). Включаем его: ScriptName пустой (скрипт имеет приоритет над SmartAI), AIName SmartAI.
-- Откат: UPDATE creature_template SET ScriptName = 'npc_kezan_gasbot', AIName = '' WHERE entry = 37598;
UPDATE `creature_template` SET `ScriptName` = '', `AIName` = 'SmartAI' WHERE `entry` = 37598 AND `ScriptName` = 'npc_kezan_gasbot';
