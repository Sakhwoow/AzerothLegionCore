USE legion_world;

-- Ragefire Chasm (map 389, Cataclysm-era revamp, current for Legion 7.3.5) - boss loot was present
-- but stuck at Chance=0 (never drops) for every real item, and 4 items were missing entirely.
-- Correct loot list sourced from AtlasLoot_Classic/data.lua (RAGEFIRE_CHASM_LOOT, EncounterJournalID 226).

-- Adarogg (61408)
UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 61408 AND `Item` IN (82772, 82879, 82880);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(61408, 151421, 0, 20, 0, 1, 0, 1, 1, 'Scorched Blazehound Boots'),
(61408, 151422, 0, 20, 0, 1, 0, 1, 1, 'Bonecoal Waistguard');

-- Dark Shaman Koranthal (61412)
UPDATE `creature_loot_template` SET `Chance` = 25 WHERE `Entry` = 61412 AND `Item` IN (82877, 82881, 82882);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(61412, 132551, 0, 25, 0, 1, 0, 1, 1, "Dark Shaman's Jerkin");

-- Slagmaw (61463)
UPDATE `creature_loot_template` SET `Chance` = 25 WHERE `Entry` = 61463 AND `Item` IN (82878, 82884, 82885);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(61463, 132552, 0, 25, 0, 1, 0, 1, 1, 'Chitonous Bindings');

-- Lava Guard Gordoth (61528) - all 3 correct items already present, only the chance was broken
UPDATE `creature_loot_template` SET `Chance` = 25 WHERE `Entry` = 61528 AND `Item` IN (82883, 82886, 82888);
