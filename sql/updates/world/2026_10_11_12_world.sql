-- ruRU locale for gameobject_template.Name on map 1501 (Black Rook Hold). Skipped: all
-- "Black Rook Hold Dungeon - Boss N - Door ..." entries (level-design door markers, same
-- convention as "Right Chamber - ..." on map 1220) and Doodad_7NE_Blackrook_*/Doodad_7KO_*.

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (246409,246410,246505,252266,252385,252878,253921) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(246409, 'ruRU', 'Древнее кресло'),
(246410, 'ruRU', 'Древнее кресло'),
(246505, 'ruRU', 'Маленькая красная кнопка'),
(252266, 'ruRU', 'Журнал Делейта: Драгоценности островов'),
(252385, 'ruRU', 'Оторванная страница'),
(252878, 'ruRU', 'Эпоха Галакронда'),
(253921, 'ruRU', 'Ржавые врата');
