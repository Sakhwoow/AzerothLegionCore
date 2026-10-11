-- ruRU locale for gameobject_template.Name on map 1458 (Neltharion's Lair). 3 skipped:
-- Crystal Wall Minion Collision, Boss 03 Door Floor, Naraxas Collision (dev markers).

DELETE FROM `gameobject_template_locale` WHERE `entry` IN (241700,247500,248763,248764,248765,248871,249024,251734,251735,252671,252672,252673,254854,266885) AND `locale` = 'ruRU';
INSERT INTO `gameobject_template_locale` (`entry`, `locale`, `Name`) VALUES
(241700, 'ruRU', 'Куча костей'),
(247500, 'ruRU', 'Древний артефакт Крутогорья'),
(248763, 'ruRU', 'Мистический барьер'),
(248764, 'ruRU', 'Мистический барьер'),
(248765, 'ruRU', 'Мистический барьер'),
(248871, 'ruRU', 'Мистический барьер'),
(249024, 'ruRU', 'Осаждающий порошок'),
(251734, 'ruRU', 'Печать Нелтариона'),
(251735, 'ruRU', 'Печать Нелтариона'),
(252671, 'ruRU', 'Тайник претендента'),
(252672, 'ruRU', 'Превосходный тайник претендента'),
(252673, 'ruRU', 'Непревзойдённый тайник претендента'),
(254854, 'ruRU', 'Обвал'),
(266885, 'ruRU', 'Призрачные врата');
