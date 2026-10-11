-- ruRU locale for gameobject_template.Name on map 1463 (Trial of Valor raid).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (240586,240603,240649,241216,241267,241272,241778,244559,244565) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(240586, 'ruRU', 'Проклятые кости'),
(240603, 'ruRU', 'Проклятые водоросли'),
(240649, 'ruRU', 'Маленький сундук с сокровищами'),
(241216, 'ruRU', 'Сундук с сокровищами'),
(241267, 'ruRU', 'Маленький сундук с сокровищами'),
(241272, 'ruRU', 'Сундук с сокровищами'),
(241778, 'ruRU', 'Клетка Колборна'),
(244559, 'ruRU', 'Алтарь Хелии'),
(244565, 'ruRU', 'Трофеи квалдиров');
