-- ruRU locale for gameobject_template.Name on map 1612 (Fangs of Ashamane).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (249494,250386,250632,250638,250639,250640,250641,250643,250824,250876) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(249494, 'ruRU', 'Врата Легиона'),
(250386, 'ruRU', 'Клыки Ашаманы'),
(250632, 'ruRU', 'Дверь'),
(250638, 'ruRU', 'Разрушенный рычаг'),
(250639, 'ruRU', 'Светящаяся сфера'),
(250640, 'ruRU', 'Светящаяся сфера'),
(250641, 'ruRU', 'Разрушенный рычаг'),
(250643, 'ruRU', 'Туман'),
(250824, 'ruRU', 'Платформа'),
(250876, 'ruRU', 'Дверь');
