-- ruRU locale for gameobject_template.Name on map 1536 (Claws of Ursoc). Skipped: "Aura Yellow
-- Huge (1.15)" and "Cylinder Collision" (dev markers).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (248823,248824,248825,248853) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(248823, 'ruRU', 'Древний барьер'),
(248824, 'ruRU', 'Камень'),
(248825, 'ruRU', 'Камень'),
(248853, 'ruRU', 'Когти Урсока');
