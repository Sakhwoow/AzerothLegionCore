-- ruRU locale for quest_template (Legion, Expansion=6), batch 19. Skipped: 41710-41717
-- "Legion 110 A/H" (x8) - naming pattern ("expansion/level/faction-letter", repeated identically
-- 8 times) matches internal/technical helper quests, not real player-facing content with
-- meaningful text to translate.

DELETE FROM `quest_template_locale` WHERE `ID` IN (41699,41700) AND `locale` = 'ruRU';
INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogTitle`, `LogDescription`, `QuestDescription`) VALUES
(41699, 'ruRU', 'Хрустящие крабсики', '', ''),
(41700, 'ruRU', 'ОПАСНО: Шалас''аман', '', '');
