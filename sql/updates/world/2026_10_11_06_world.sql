-- ruRU locale for gameobject_template.Name on map 1571 (Court of Stars) - all 23 GameObjects,
-- 2 skipped (Doodad_7NB_Nightborn_HarpNNN - dev-only asset names, same convention as map 1220).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (246805,249386,250613,250614,250615,250616,250617,250618,250619,250620,250621,250622,250623,251846,251847,251848,251849,252966,252967,253046,253922) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(246805, 'ruRU', 'Огонь Скверны'),
(249386, 'ruRU', 'Чародейский барьер'),
(250613, 'ruRU', 'Стул'),
(250614, 'ruRU', 'Стул'),
(250615, 'ruRU', 'Стул'),
(250616, 'ruRU', 'Стул'),
(250617, 'ruRU', 'Стул'),
(250618, 'ruRU', 'Стул'),
(250619, 'ruRU', 'Стул'),
(250620, 'ruRU', 'Стул'),
(250621, 'ruRU', 'Стул'),
(250622, 'ruRU', 'Стул'),
(250623, 'ruRU', 'Стул'),
(251846, 'ruRU', 'Дверь дома'),
(251847, 'ruRU', 'Дверь особняка'),
(251848, 'ruRU', 'Небесная терраса'),
(251849, 'ruRU', 'Путевая дверь'),
(252966, 'ruRU', 'Базар ночнорождённых'),
(252967, 'ruRU', 'Товары ночнорождённых'),
(253046, 'ruRU', 'Товары ночнорождённых'),
(253922, 'ruRU', 'Дверь ученика');
