-- ruRU locale for creature_text, scoped to map 1612 (Fangs of Ashamane - Val'sharah Nightmare area).

DELETE FROM `creature_text_locale` WHERE (`CreatureID`,`GroupID`,`ID`) IN (
  (108003,0,0),(108003,1,0),(108003,2,0),
  (108197,3,0)
) AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(108003,0,0,'ruRU','Не хочешь уходить? Отлично, я сам закончу эту погоню!'),
(108003,1,0,'ruRU','Клыки мои! МОИ!!'),
(108003,2,0,'ruRU','Нет! Я никогда не сдамся!'),
(108197,3,0,'ruRU','Иссохший охотник на лей-линии замечает ваше присутствие!');
