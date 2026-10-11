-- ruRU locale for gameobject_template.Name on map 1107 (Dreadscar Rift - Warlock Mage Tower).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (245005,250912,250913,250914,251264,251265,251554,251993,252165,252778) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(245005, 'ruRU', 'Том порочных орудий'),
(250912, 'ruRU', 'Призывающий отряд'),
(250913, 'ruRU', 'Тренировочный отряд'),
(250914, 'ruRU', 'Призывающий отряд'),
(251264, 'ruRU', 'Призывающий отряд'),
(251265, 'ruRU', 'Призывающий отряд'),
(251554, 'ruRU', 'Тренировочный отряд'),
(251993, 'ruRU', 'Вооружение по заявке'),
(252165, 'ruRU', 'Печать судьбы по заявке'),
(252778, 'ruRU', 'Порабощающий инфернал');
