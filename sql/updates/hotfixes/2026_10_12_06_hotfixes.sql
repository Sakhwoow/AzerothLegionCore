USE legion_hotfixes;

DELETE FROM `broadcast_text_locale` WHERE `ID` IN (143591) AND `locale` = 'ruRU';
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`, `Text1_lang`, `VerifiedBuild`) VALUES
(143591, 'ruRU', '', 'Ах, юный герой $p предстаёт передо мной. Мне говорили, что ты подаёшь большие надежды. Будем надеяться, что эти слухи подтвердятся.', 24330);
