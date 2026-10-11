-- ruRU locale for broadcast_text referenced by npc_text (gossip greeting) on map 1479 (Trial of Odyn).

DELETE FROM `broadcast_text_locale` WHERE `ID` IN (98622,122308) AND `locale` = 'ruRU';
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`) VALUES
(98622, 'ruRU', ''),
(122308, 'ruRU', 'Приветствую, $n. У меня есть кое-что, что может оказаться тебе полезным.');
