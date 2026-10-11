-- ruRU locale for gameobject_template.Name on map 1753 (Void Elf scenario). 2 skipped:
-- Doodad_7FX_ArgusDungeon_AlleriaVoidWall001 (dev asset) and Collision Wall (dev marker).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (272918,272954,246779) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(272918, 'ruRU', 'Позолоченный сундук Триумвирата'),
(272954, 'ruRU', 'Печать арсенала'),
(246779, 'ruRU', 'Источник силы');
