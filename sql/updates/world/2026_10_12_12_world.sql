USE legion_world;

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (300058,301111) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `name`, `VerifiedBuild`) VALUES
(300058, 'ruRU', 'Большой лунный свет', 1),
(301111, 'ruRU', 'Плетёный человек Альянса', 1);

DELETE FROM `creature_template_locale` WHERE `entry` IN (1000000,1000002) AND `locale` = 'ruRU';
INSERT INTO `creature_template_locale` (`entry`, `locale`, `Name`, `Title`, `VerifiedBuild`) VALUES
(1000000, 'ruRU', 'Клаус', 'Выбор скорости опыта', 0),
(1000002, 'ruRU', 'Клара Марч', 'Продавец маунтов', 0);
