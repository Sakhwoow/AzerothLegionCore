-- ruRU locale for broadcast_text referenced by npc_text (gossip greeting) and
-- gossip_menu_option.OptionBroadcastTextId for creatures on map 1571 (Court of Stars).

DELETE FROM `broadcast_text_locale` WHERE `ID` IN (108580,111837,111876,111878,111879,111880,108581,111838,111873) AND `locale` = 'ruRU';
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`) VALUES
(108580, 'ruRU', 'Похоже, этот фонарь был слегка изменён. Должно быть, именно его нужно использовать, чтобы подать сигнал.'),
(111837, 'ruRU', ''),
(111876, 'ruRU', 'Проходи, друг. У меня с тобой дел нет.'),
(111878, 'ruRU', 'Да будет Сурамар вечен, друг.'),
(111879, 'ruRU', 'Неплохая вечеринка, не правда ли?'),
(111880, 'ruRU', 'Музыканты весьма неплохи, не правда ли?'),
(108581, 'ruRU', 'Подать сигнал Ли''лет Лунастре.'),
(111838, 'ruRU', 'Продолжай. Я готов к маскировке.'),
(111873, 'ruRU', 'Не притворяйся. Я знаю, что ты здесь, чтобы шпионить для Великой Магистрикс.');
