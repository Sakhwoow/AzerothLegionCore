-- ruRU locale for quest_template (Legion, Expansion=6), batch 23.

DELETE FROM `quest_template_locale` WHERE `ID` IN (42027,42028,42062,42063,42076,42077,42082,42087,42105,42146) AND `locale` = 'ruRU';
INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogTitle`, `LogDescription`, `QuestDescription`) VALUES
(42027, 'ruRU', 'Хаос в Фаронааре', '', ''),
(42028, 'ruRU', 'В Кошмар', '', ''),
(42062, 'ruRU', 'Ночь боёв: Шкуродёр мл. мл.', '', ''),
(42063, 'ruRU', 'Размер не важен', '', ''),
(42076, 'ruRU', 'Деревня Тенистой Топи', '', ''),
(42077, 'ruRU', 'Пробуждение кошмаров', '', ''),
(42082, 'ruRU', 'Разрушенный Локус', '', ''),
(42087, 'ruRU', 'Зелёный ужас', '', ''),
(42105, 'ruRU', 'Путаница с зельями', '', ''),
(42146, 'ruRU', 'Растерянный, сбитый с толку и прелестный', '', '');
