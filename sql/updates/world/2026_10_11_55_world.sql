-- ruRU locale for quest_template (Legion, Expansion=6), batch 10.

DELETE FROM `quest_template_locale` WHERE `ID` IN (41260,41268,41273,41275,41278,41286,41291,41295,41296,41298) AND `locale` = 'ruRU';
INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogTitle`, `LogDescription`, `QuestDescription`) VALUES
(41260, 'ruRU', 'Кусок бекона', '', ''),
(41268, 'ruRU', 'Королева царь-рыб', '', ''),
(41273, 'ruRU', 'Рыбалка на буй', '', ''),
(41275, 'ruRU', 'Огромные штормовые скаты', '', ''),
(41278, 'ruRU', 'Скользкие штормовые скаты', '', ''),
(41286, 'ruRU', 'Скопление эфрила', '', ''),
(41291, 'ruRU', 'Скопление сонного листа', '', ''),
(41295, 'ruRU', 'Древний, покрытый сонным листом', '', ''),
(41296, 'ruRU', 'Скопление фьярнскагла', '', ''),
(41298, 'ruRU', 'Нужны припасы: фьярнскагл', '', '');
