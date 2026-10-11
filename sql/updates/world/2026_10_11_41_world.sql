-- ruRU locale for creature_text, scoped to map 1478 (Ysera/Tyrande Nightmare scenario).

DELETE FROM `creature_text_locale` WHERE (`CreatureID`,`GroupID`,`ID`) IN ((93065,2,0),(93065,4,0)) AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(93065,2,0,'ruRU','Я не знала... что это не сон...'),
(93065,4,0,'ruRU','|cFFFF0000%s|r начинает читать заклинание |cFFFF0000|Hspell:192754|h["Дыхание Кошмара"]|h|r!');
