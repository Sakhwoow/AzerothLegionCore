-- ruRU locale for gameobject_template.Name on map 1676 (Tomb of Sargeras). Skipped: Doodad_*
-- entries, "7.2 Tomb Raid - Avatar Floor (test) - MRN" (dev test marker), and deliberate French
-- flavor names "Barrière"/"Barrière fantomatique" (same convention as elsewhere).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (268364,268365,268366,268514,268579,268580,268748,268749,268750,268751,268752,268819,270940,268969,269120,269192,269256,269257,269258,269259,269260,269840,269841,269976,271099) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(268364, 'ruRU', 'Дверь'),
(268365, 'ruRU', 'Дверь'),
(268366, 'ruRU', 'Дверь'),
(268514, 'ruRU', 'Дверь'),
(268579, 'ruRU', 'Дверь'),
(268580, 'ruRU', 'Дверь'),
(268748, 'ruRU', 'Дверь'),
(268749, 'ruRU', 'Дверь'),
(268750, 'ruRU', 'Дверь'),
(268751, 'ruRU', 'Дверь'),
(268752, 'ruRU', 'Дверь'),
(268819, 'ruRU', 'Дверь'),
(270940, 'ruRU', 'Дверь'),
(268969, 'ruRU', 'Древняя дверь'),
(269120, 'ruRU', 'Дверь госпожи'),
(269192, 'ruRU', 'Входная дверь'),
(269256, 'ruRU', 'Орочья руна'),
(269257, 'ruRU', 'Орочья руна'),
(269258, 'ruRU', 'Орочья руна'),
(269259, 'ruRU', 'Орочья руна'),
(269260, 'ruRU', 'Орочья руна'),
(269840, 'ruRU', 'Древний рычаг'),
(269841, 'ruRU', 'Древний рычаг'),
(269976, 'ruRU', 'Водная дверь'),
(271099, 'ruRU', 'Трофеи падения Легиона');
