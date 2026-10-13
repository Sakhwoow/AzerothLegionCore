USE legion_world;

-- Razorfen Kraul (map 47, Cataclysm-era revamp, current for Legion 7.3.5). Correct loot list
-- sourced from AtlasLoot_Classic/data.lua (data["RazorfenKraul"], EncounterJournalID 234).
-- Unlike Ragefire Chasm/Deadmines/Shadowfang Keep, most bosses here were already fine (their
-- creature_loot_template rows exist under their own Entry despite creature_template.lootid=0,
-- the engine resolves loot by the creature's own entry regardless of that field) - only 2 items
-- across 2 bosses were genuinely missing. First draft of this fix wrongly assumed lootid=0 meant
-- "no loot at all" without checking creature_loot_template directly first and had to be redone.

-- Warlord Ramtusk (74462) - 6686/6687 already present and working, only this one was missing
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(74462, 151445, 0, 20, 0, 1, 0, 1, 1, "Porcine-Warlord's Legplates");

-- Roogug (74948) - 6690/132565/6691 already present and working, only this one was missing
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(74948, 151443, 0, 20, 0, 1, 0, 1, 1, "Roogug's Swinsteel Girdle");

-- Kraulshaper Tukaar (74900, the real rank-1 elite - entry 74926 is a rank-0 non-combat variant,
-- left untouched) - had only generic trash filler, both signature items missing entirely
INSERT INTO `creature_loot_template` (`Entry`, `Item`, `Reference`, `Chance`, `QuestRequired`, `LootMode`, `GroupId`, `MinCount`, `MaxCount`, `Comment`) VALUES
(74900, 6688, 0, 25, 0, 1, 0, 1, 1, 'Whisperwind Headdress'),
(74900, 6689, 0, 25, 0, 1, 0, 1, 1, 'Wind Spirit Staff');

-- Hunter Bonetusk (75001), Groyat the Blind Hunter (75247), Charlga Razorflank (4421) already had
-- their full correct loot - no changes needed, left as-is after re-checking directly.
