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
