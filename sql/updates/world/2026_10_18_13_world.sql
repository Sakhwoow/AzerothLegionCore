-- Кезан, квест 14122 "Ограбление банка" (The Great Bank Heist): выполнен, а сдать некому: сдаётся Сассе Гаечный Ключ 34668, у которой три спавна в фазах 169, 380 и 382.
-- Игрок на этом этапе видит мир в фазе 172 (аура 59087 с квеста 14116) и 383 (phase_area), а 380 и 382 нигде не выдаются (в phase_area их нет, спелла нет), поэтому
-- Сассу в фазе 169 (штаб ТКК, -8424, 1366) он не видит. Как в Гилнеасе (зона 4714): к фазе 172 добавляем нормальную фазу 169 спеллом 172329 "Set Self to Normal Phase",
-- с тем же окном, что у 59087 в зоне 4737 (квест 14116 в статусах 74, конец 11).
-- Откат: DELETE FROM spell_area WHERE spell = 172329 AND area = 4737 AND quest_start = 14116;
DELETE FROM `spell_area` WHERE `spell` = 172329 AND `area` = 4737 AND `quest_start` = 14116;
INSERT INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status`)
SELECT 172329, `area`, `quest_start`, `quest_end`, `aura_spell`, `teamId`, `racemask`, `gender`, `flags`, `quest_start_status`, `quest_end_status` FROM `spell_area` WHERE `spell` = 59087 AND `area` = 4737 AND `quest_start` = 14116;
