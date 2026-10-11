-- ruRU locale for gameobject_template.Name on map 1479 (Trial of Odyn scenario).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (244940,245726,248979,248980,248981,250878,250879,250880,252016,252887) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(244940, 'ruRU', 'Тюремный рунический камень'),
(245726, 'ruRU', 'Кузница Одина'),
(248979, 'ruRU', 'Сага о валарьярах'),
(248980, 'ruRU', 'Легенда об Одине'),
(248981, 'ruRU', 'Любимцы Одина'),
(250878, 'ruRU', 'Тренировочный отряд'),
(250879, 'ruRU', 'Тренировочный отряд'),
(250880, 'ruRU', 'Тренировочный отряд'),
(252016, 'ruRU', 'Вооружение по заявке'),
(252887, 'ruRU', 'Благословение Мьёльнира');
