-- ruRU locale for quest_template (Legion, Expansion=6), batch 22.

DELETE FROM `quest_template_locale` WHERE `ID` IN (41931,41935,41938,41955,41956,41990,42014,42015,42018,42024) AND `locale` = 'ruRU';
INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogTitle`, `LogDescription`, `QuestDescription`) VALUES
(41931, 'ruRU', 'Истощение маны', '', ''),
(41935, 'ruRU', 'Тягловые звери', '', ''),
(41938, 'ruRU', 'Братья Сковальда', '', ''),
(41955, 'ruRU', 'Каменная родословная', '', ''),
(41956, 'ruRU', 'Окаменевшие послушники', '', ''),
(41990, 'ruRU', 'Порублено', '', ''),
(42014, 'ruRU', 'Осквернённое вино', '', ''),
(42015, 'ruRU', 'Нити судьбы', '', ''),
(42018, 'ruRU', 'Те, кто вне искупления', '', ''),
(42024, 'ruRU', 'Друг моего врага', '', '');
