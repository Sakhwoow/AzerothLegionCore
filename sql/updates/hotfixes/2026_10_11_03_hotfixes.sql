-- ruRU locale for broadcast_text referenced by npc_text (gossip greeting) on map 1530 (The Nighthold).

DELETE FROM `broadcast_text_locale` WHERE `ID` IN (118749,122444,122449) AND `locale` = 'ruRU';
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`) VALUES
(118749, 'ruRU', 'Защитники, вы сделали это! Я чувствую, как ритуал Гул''дана набирает силу, нужно спешить. Я могу телепортировать вас обратно в Цитадель Ночи. Вы готовы?'),
(122444, 'ruRU', 'Мы должны остановить Гул''дана, прежде чем он завершит ритуал.'),
(122449, 'ruRU', '');
