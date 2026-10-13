USE legion_world;

-- The Deadmines (map 36, Cataclysm-era revamp, current for Legion 7.3.5) - same bug class as
-- Ragefire Chasm (2026_10_13_01_world.sql): the 4 modern bosses' thematic loot was present but
-- stuck at Chance=0 (never drops), and 2 of them were missing their 3 newer bonus-item rows.
-- Correct loot list sourced from AtlasLoot_Classic/data.lua (data["Deadmines"], EncounterJournalID 63).

-- Glubtok (47162)
UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 47162 AND `Item` IN (5444, 5195, 2169);

-- Helix Gearbreaker (47296)
UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 47296 AND `Item` IN (5199, 5443, 5191, 5200);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(47296, 151062, 0, 20, 0, 1, 0, 1, 1, 'Armbands of Exiled Architects'),
(47296, 132556, 0, 20, 0, 1, 0, 1, 1, "Smelter's Britches"),
(47296, 151063, 0, 20, 0, 1, 0, 1, 1, 'Gear-Marked Gauntlets');

-- Foe Reaper 5000 (43778)
UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 43778 AND `Item` IN (1937, 5187, 5201);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(43778, 151064, 0, 20, 0, 1, 0, 1, 1, 'Vest of the Curious Visitor'),
(43778, 151065, 0, 20, 0, 1, 0, 1, 1, "Old Friend's Gloves"),
(43778, 151066, 0, 20, 0, 1, 0, 1, 1, "Missing Diplomat's Pauldrons");

-- Admiral Ripsnarl (47626) - item 21524 already has a working chance, only the other 3 were broken
UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 47626 AND `Item` IN (872, 1156, 5196);

-- "Captain" Cookie (47739)
UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 47739 AND `Item` IN (5192, 5193, 5197, 5198, 5202);
