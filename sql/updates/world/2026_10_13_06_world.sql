USE legion_world;

-- Scarlet Monastery (map 189): the Dark Ranger Velonara / Joseph the Awakened-Crazed-Insane /
-- Dominic questline is Cataclysm-era content, officially removed by Blizzard in patch 5.0.4
-- (MoP launch, 2012) when the 4 classic wings were consolidated into the Scarlet Halls/Scarlet
-- Cathedral heroics - it should not be live on a Legion 7.3.5 snapshot. Disabled (not deleted)
-- via the existing `disables` convention already used for thousands of other deprecated quests
-- in this table, so it can be trivially re-enabled by removing these rows if needed.
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES
(1, 26950, 0, '', '', 'Deprecated quest: The Dark Side of the Light (Velonara)'),
(1, 26959, 0, '', '', 'Deprecated quest: Stripping Their Defenses (Velonara)'),
(1, 26962, 0, '', '', 'Deprecated quest: Stripping Their Offense (Velonara)'),
(1, 26967, 0, '', '', 'Deprecated quest: Battle for the Scarlet Monastery (Velonara)'),
(1, 26972, 0, '', '', 'Deprecated quest: The Dark Side of the Light (Joseph)'),
(1, 26973, 0, '', '', 'Deprecated quest: The Only True Path (Joseph)'),
(1, 26974, 0, '', '', 'Deprecated quest: The False Champion (Joseph)'),
(1, 26976, 0, '', '', 'Deprecated quest: Battle for the Scarlet Monastery (Joseph)'),
(1, 26993, 0, '', '', 'Deprecated quest: Compendium of the Fallen (Dominic)'),
(1, 26994, 0, '', '', 'Deprecated quest: Without Rhyme or Reason (Dominic)'),
(1, 26996, 0, '', '', 'Deprecated quest: Right Under Their Noses (Dominic)');
