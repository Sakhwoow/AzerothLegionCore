USE legion_hotfixes;

DELETE FROM `broadcast_text_locale` WHERE `ID` IN (122467,122469) AND `locale` = 'ruRU';
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`, `Text1_lang`, `VerifiedBuild`) VALUES
(122467, 'ruRU', 'Даларан в осаде, $n! Легион намерен сбить нас с небес!', '', 24330),
(122469, 'ruRU', 'Встретимся в Даларане над Мрачным Перевалом. У меня есть план. Ужасно опасный план... но всё же план!', '', 24330);
