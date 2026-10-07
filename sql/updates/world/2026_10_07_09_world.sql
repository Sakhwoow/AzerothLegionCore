-- Remove quest_poi/quest_poi_points rows for quest IDs that do not exist in quest_template.
-- Same root cause as 2026_10_07_08_world.sql: these came from the upstream LegionCore
-- 2024-10-23 dump (2026_10_07_01_world.sql) before the corresponding quest_template rows
-- were imported. Harmless (ObjectMgr::LoadQuestPOI skips them) but spammed the startup
-- log on every restart.
DELETE FROM `quest_poi_points` WHERE `QuestID` NOT IN (SELECT `ID` FROM `quest_template`);
DELETE FROM `quest_poi` WHERE `QuestID` NOT IN (SELECT `ID` FROM `quest_template`);
