-- ruRU locale for gameobject_template.Name on map 1466 (Darkheart Thicket). All other 20 entries
-- are dev-only door/collision markers (NightmareBoss1/2DungeonDoor*, Doodad_*) - skipped.

DELETE FROM `gameobject_template_locale` WHERE `entry` = 253982 AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(253982, 'ruRU', 'Трофеи Кошмара');
