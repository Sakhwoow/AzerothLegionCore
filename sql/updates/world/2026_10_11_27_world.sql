-- ruRU locale for gameobject_template.Name on map 1456 (Hatecoil naga area, Stormheim).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (240788,248930,253992) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(240788, 'ruRU', 'Пузырь'),
(248930, 'ruRU', 'Ящик с пробками'),
(253992, 'ruRU', 'Шкатулка с безделушками');
