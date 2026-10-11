-- ruRU locale for creature_text, scoped to map 1750 (Assault on the Broken Shore intro scenario).

DELETE FROM `creature_text_locale` WHERE (`CreatureID`,`GroupID`,`ID`) IN ((122065,0,0),(122066,0,0)) AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(122065,0,0,'ruRU','Легион слишком долго бесчинствовал в Азероте. Пора покончить с этим.'),
(122066,0,0,'ruRU','Вижу, Альянс тоже ответил на зов Велена.');
