-- Квест 24920 "Оттянуть неизбежное" (Slowing the Inevitable): у Пойманного нетопыря (38540, VehicleId 641) в creature_template нет ни одного спелла (spell1-8 = 0),
-- поэтому панель транспорта пустая и бомб нет: ни катапульты 38287 (6), ни захватчики 38363 (40) не получают урона.
-- spell1 = 72247 "Мощная бомба" (Iron Bomb, урон 3959 по области 12 ярдов в выбранной точке, скрипт spell_iron_bomb_72247 отсекает союзников),
-- spell2 = 72849 "Полёт обратно" (Fly Back, скрипт spell_fly_back_72849).
-- Откат: UPDATE creature_template SET spell1 = 0, spell2 = 0 WHERE entry = 38540;
UPDATE `creature_template` SET `spell1` = 72247, `spell2` = 72849 WHERE `entry` = 38540 AND `spell1` = 0 AND `spell2` = 0;
