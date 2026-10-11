-- ruRU locale for gameobject_template.Name on map 1477 (Halls of Valor). 11 skipped:
-- Doodad_7du_valhalla_* entries (dev-only assets).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (244664,246272) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(244664, 'ruRU', 'Врата Великолепия'),
(246272, 'ruRU', 'Следы Фенрира');
