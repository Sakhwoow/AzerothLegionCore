-- ruRU locale for gameobject_template.Name on map 1544 (Return to Violet Hold). 1 skipped:
-- Doodad_7DU_VioletHold_trapdoor001 (dev asset).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (246430,246992,246994,246995,246996,247002,249733,666778,666779) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(246430, 'ruRU', 'Брошенная шкатулка Миллифисент'),
(246992, 'ruRU', 'Камера'),
(246994, 'ruRU', 'Камера'),
(246995, 'ruRU', 'Камера'),
(246996, 'ruRU', 'Камера'),
(247002, 'ruRU', 'Печать тюрьмы'),
(249733, 'ruRU', 'Плазменный лазерный заряд'),
(666778, 'ruRU', 'Портал Сайлорна'),
(666779, 'ruRU', 'Портал в Даларан');
