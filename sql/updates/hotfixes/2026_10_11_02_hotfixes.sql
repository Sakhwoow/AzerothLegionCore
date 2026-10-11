-- ruRU locale for broadcast_text referenced by npc_text (gossip greeting) on map 1477 (Halls of Valor).

DELETE FROM `broadcast_text_locale` WHERE `ID` = 99982 AND `locale` = 'ruRU';
INSERT INTO `broadcast_text_locale` (`ID`, `locale`, `Text_lang`) VALUES
(99982, 'ruRU', 'Вы готовы?');
