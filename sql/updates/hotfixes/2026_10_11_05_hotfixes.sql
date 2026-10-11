-- ruRU для broadcast_text 122469 (Верховный маг Кадгар, "Meet me in Dalaran over Deadwind Pass...")
-- у Blizzard для этой строки есть только frFR, ruRU не было в принципе.

DELETE FROM `broadcast_text_locale` WHERE `ID` = 122469 AND `locale` = 'ruRU';
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`, `Text1_lang`, `VerifiedBuild`) VALUES
(122469, 'ruRU', 'Встретимся в Даларане над Мёртвым перевалом. У меня есть план. Ужасно опасный план... но всё-таки план!', '', 24330);
