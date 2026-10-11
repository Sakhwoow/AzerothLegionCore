-- ruRU locale for quest_template (Legion, Expansion=6), batch 21. 41880's QuestDescription is
-- a literal writer's placeholder note ("Placeholder: ... (whichever fits)") - left untranslated,
-- its LogTitle/LogDescription are real finished text and are translated normally.

DELETE FROM `quest_template_locale` WHERE `ID` IN (41836,41857,41860,41861,41864,41865,41880,41881,41886,41914) AND `locale` = 'ruRU';
INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogTitle`, `LogDescription`, `QuestDescription`) VALUES
(41836, 'ruRU', 'РАЗЫСКИВАЕТСЯ: Бодаш Накопитель', '', ''),
(41857, 'ruRU', 'Нелтарионское Логово: рабы Тёмнокаменных', '', ''),
(41860, 'ruRU', 'Расправа с сатирами', '', ''),
(41861, 'ruRU', 'Познакомьтесь с Пастью', '', ''),
(41864, 'ruRU', 'Нелтарионское Логово: кристальный дробитель', '', ''),
(41865, 'ruRU', 'Нелтарионское Логово: мать камня', '', ''),
(41880, 'ruRU', 'Логово теней', 'Свяжитесь с Арлуином Клинком Тени.', ''),
(41881, 'ruRU', 'Ночь боёв: Гелиосус', '', ''),
(41886, 'ruRU', 'Ночь боёв: Крысы!', '', ''),
(41914, 'ruRU', 'Очистите катакомбы', '', '');
