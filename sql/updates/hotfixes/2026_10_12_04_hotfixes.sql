USE legion_hotfixes;

DELETE FROM `broadcast_text_locale` WHERE `ID` IN (143203,145895) AND `locale` = 'ruRU';
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`, `Text1_lang`, `VerifiedBuild`) VALUES
(143203, 'ruRU', '', 'Некоторые скажут тебе, что Свет — единственный путь. Единственное оружие, способное остановить врагов Азерота.', 26972),
(145895, 'ruRU', '', 'Голоса никогда не умолкают. Они давят, запугивают, молят. Они не отступят ни на мгновение.\n\nНо ты сильнее голосов. Ты можешь выведать их тайны и черпать из них силу.', 26972);
USE legion_hotfixes;

DELETE FROM `broadcast_text_locale` WHERE `ID` IN (143204,143206) AND `locale` = 'ruRU';
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`, `Text1_lang`, `VerifiedBuild`) VALUES
(143204, 'ruRU', '', 'Но мы видим альтернативы. Много дорог — много возможностей — открыто перед нами.', 26972),
(143206, 'ruRU', '', 'Используй уроки, которым я тебя научила, чтобы сохранять контроль. Стань оружием Альянса... даже балансируя на грани тьмы.', 26972);
