USE legion_world;

-- Shadowfang Keep (map 33, modern Godfrey/Ashbury/Walden/Silverlaine/Springvale revamp, current
-- for Legion 7.3.5) - same bug class as Ragefire Chasm/The Deadmines: thematic boss loot present
-- but stuck at Chance=0, and several bosses missing their bonus-item rows entirely. Two bosses
-- (Silverlaine, Godfrey) already had their "signature" 100%-guaranteed item pair intact; the rest
-- did not. Correct loot list sourced from AtlasLoot_Classic/data.lua (data["ShadowfangKeep"],
-- EncounterJournalID 64).

-- Baron Ashbury (46962) - entire loot table was Chance=0
UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 46962 AND `Item` IN (6314, 6324, 6323);

-- Baron Silverlaine (3887) - signature items (60885/60878) already fine, rest missing/broken
UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 3887 AND `Item` = 6321;
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(3887, 5254, 0, 20, 0, 1, 0, 1, 1, 'Rugged Spaulders'),
(3887, 6319, 0, 20, 0, 1, 0, 1, 1, 'Girdle of the Blindwatcher'),
(3887, 132568, 0, 20, 0, 1, 0, 1, 1, 'Shadowfang Pauldrons'),
(3887, 132567, 0, 20, 0, 1, 0, 1, 1, "Blindwatcher's Chain"),
(3887, 5943, 0, 20, 0, 1, 0, 1, 1, 'Rift Bracers');

-- Commander Springvale (4278) - even the signature guaranteed pair was missing entirely
UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 4278 AND `Item` IN (6320, 3191);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(4278, 60879, 0, 100, 0, 1, 0, 1, 1, "Commander's Holy Symbol"),
(4278, 60880, 0, 100, 0, 1, 0, 1, 1, "Springvale's Sharpening Stone"),
(4278, 151067, 0, 20, 0, 1, 0, 1, 1, 'Boots of Lingering Sorrow'),
(4278, 151068, 0, 20, 0, 1, 0, 1, 1, 'Boots of the Predator'),
(4278, 151069, 0, 20, 0, 1, 0, 1, 1, 'Breastplate of the Stilled Heart'),
(4278, 151070, 0, 20, 0, 1, 0, 1, 1, 'Gloves of the Greymane Wall');

-- Lord Walden (46963) - signature pair (60876/60881) already present and working
UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 46963 AND `Item` IN (3230, 6642, 6341, 1292);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(46963, 132566, 0, 20, 0, 1, 0, 1, 1, 'Dark Lupine Wraps');

-- Lord Godfrey (46964) - signature items (60877/60882) already fine, rest missing/broken
UPDATE `creature_loot_template` SET `Chance` = 20 WHERE `Entry` = 46964 AND `Item` IN (3748, 6220, 6318, 6641);
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(46964, 151071, 0, 20, 0, 1, 0, 1, 1, 'Gloves of the Uplifted Cup'),
(46964, 151072, 0, 20, 0, 1, 0, 1, 1, "Worgen Hunter's Helm"),
(46964, 151073, 0, 20, 0, 1, 0, 1, 1, 'Greaves of the Misguided');
