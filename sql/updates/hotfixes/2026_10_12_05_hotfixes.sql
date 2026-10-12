USE legion_hotfixes;

DELETE FROM `broadcast_text_locale` WHERE `ID` IN (141912) AND `locale` = 'ruRU';
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`, `Text1_lang`, `VerifiedBuild`) VALUES
(141912, 'ruRU', 'Тысячи лет озарённые сражались с демонами в Круговерти Пустоты. "Зенедар" был единственным домом, который мы знали.', '', 24330);
