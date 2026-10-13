USE legion_world;

-- The Stockade (map 34): boss Hogger (entry 46254) had a wrong/garbled ruRU name "Дробитель"
-- instead of the correct, well-known official localization "Хоггер" (plain transliteration).
UPDATE `creature_template_locale` SET `name` = 'Хоггер' WHERE `entry` = 46254 AND `locale` = 'ruRU';
