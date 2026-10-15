-- "Пушка повстанцев" (Rebel Cannon, entry 35317, квест "Кровь и пепел"/"By Blood and Ash", 14218)
-- не давала сесть игроку. Причина: лишняя, неправильная строка spell_id=43671 в
-- npc_spellclick_spells - это generic "Ride Vehicle" спелл, используемый на совсем других
-- транспортах (пушки корабля, Fizzcrank Bomber и т.д.), не подходящий под раскладку мест
-- конкретно этого Vehicle (470). Единственный верный спелл по всем независимым оригинальным
-- Cataclysm-дампам TrinityCore - 46598. Та же самая проблема и тот же фикс уже были найдены
-- командой SkyFire (MoP-эра эмулятор) для этого же entry/spell.
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=35317 AND `spell_id`=43671;
