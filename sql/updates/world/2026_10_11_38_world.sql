-- ruRU locale for gameobject_template.Name on map 1540 (Dreamgrove - Druid order hall).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (253932,253933,253934,253935) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(253932, 'ruRU', 'Камень исцеления'),
(253933, 'ruRU', 'Камень дикой природы'),
(253934, 'ruRU', 'Камень хранителя'),
(253935, 'ruRU', 'Камень равновесия');
