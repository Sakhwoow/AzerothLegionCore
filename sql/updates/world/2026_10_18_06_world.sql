-- Квест "Эндшпиль" (26706): клик по Гиппогрифу 43747 (спелл 81877, посадка на 43751) не срабатывал. У строки спеллклика два условия (conditions, тип источника 18):
-- 9 (квест 26706 взят) и 65 с значением 131778. Типа условия 65 в этом ядре нет (последний тип 52), невалидное условие всегда не выполняется
-- (IsObjectMeetingSpellClickConditions), поэтому игрок не мог сесть, хотя Тобиас звал "Залезай на гиппогрифа!" и флаг спеллклика стоял.
-- Условие 9 оставляем (квест взят), лишнее невалидное убираем.
-- Откат: INSERT INTO conditions (SourceTypeOrReferenceId, SourceGroup, SourceEntry, SourceId, ElseGroup, ConditionTypeOrReference, ConditionTarget, ConditionValue1, ConditionValue2, ConditionValue3, NegativeCondition, ErrorType, ErrorTextId, ScriptName, Comment) -- см. бэкап /root/legion_backup_20261018_hippo/
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` = 18 AND `SourceGroup` = 43747 AND `SourceEntry` = 81877 AND `ConditionTypeOrReference` = 65;
