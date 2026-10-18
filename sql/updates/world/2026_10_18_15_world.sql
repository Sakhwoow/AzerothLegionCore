-- Затерянные острова, квест 14021 "Глубинная суть проблемы" (Miner Troubles): испуганного шахтёра 35813, которого игрок ведёт через Каджа'митовую пещеру, обезьяны-рудокопы 35812 (13 штук в пещере) и 36342
-- убивали за секунды: у шаблона уровень 1 и множитель здоровья 1.25 (около 60 единиц здоровья), а возрождаются обезьяны через 120 секунд и быстро. Пройти квест было нельзя.
-- Чтобы шахтёр доходил до конца пути (в ретейле он тоже хрупкий, но нападающих сдерживает игрок): множитель здоровья 60 (около 3000 здоровья), броня x3. Нападающих обезьян немного облегчаем: урон 0.5.
-- Откат: UPDATE creature_template SET HealthModifier = 1.25, ArmorModifier = 1 WHERE entry = 35813; UPDATE creature_template SET DamageModifier = 1 WHERE entry IN (35812, 36342);
UPDATE `creature_template` SET `HealthModifier` = 60, `ArmorModifier` = 3 WHERE `entry` = 35813 AND `HealthModifier` = 1.25;
UPDATE `creature_template` SET `DamageModifier` = 0.5 WHERE `entry` IN (35812, 36342) AND `DamageModifier` = 1;
