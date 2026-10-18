-- Квест 14234 "Враг моего врага": на карте нет метки сдачи Аггре (532, 2685, у вершины острова). В quest_poi у квеста метка сдачи с Flags = 1, тогда как у квестов с работающими метками
-- на этой карте (14021, 14126) Flags = 7 (метка видна и на карте, и на миникарте). Выравниваем флаги метки сдачи.
-- Откат: UPDATE quest_poi SET Flags = 1 WHERE QuestID = 14234 AND BlobIndex = 0 AND ObjectiveIndex = -1;
UPDATE `quest_poi` SET `Flags` = 7 WHERE `QuestID` = 14234 AND `BlobIndex` = 0 AND `ObjectiveIndex` = -1 AND `Flags` = 1;
