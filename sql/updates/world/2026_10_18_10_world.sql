-- Квест 26706 "Эндшпиль" (Endgame) - заглушка по решению владельца: оригинальная сцена с кораблём Орды невосстановима (нет путей waypoint_data, см. память legion-hippogryph-endgame-26706),
-- поэтому квест без целей: выполнен сразу при взятии (как 14465), сдаётся Лорне Кроули.
-- Откат: INSERT INTO quest_objectives (ID, QuestID, Type, `Order`, StorageIndex, ObjectID, Amount, Flags, Flags2, ProgressBarWeight, Description, VerifiedBuild) VALUES (<ID из /root/legion_backup_20261018_endgame/quest_objectives_26706.sql>);
DELETE FROM `quest_objectives` WHERE `QuestID` = 26706;
