-- Remove quest_offer_reward rows for quest IDs that do not exist in quest_template.
-- These came from 2026_10_07_00_world.sql (upstream LegionCore 2024-10-23 dump), which
-- was imported before the corresponding quest_template rows; the source dump itself has
-- zero such orphans (its quest_template is more complete than ours). Harmless (never
-- looked up, since nothing references these quest IDs) but spammed
-- ObjectMgr::LoadQuests' startup warning on every restart. A full quest_template sync
-- (~1300 missing rows, 100+ columns with many renames/type changes vs our schema) is a
-- separate, higher-risk task for later if full completeness is wanted.
DELETE FROM `quest_offer_reward` WHERE `ID` IN (30233,30234,30235,30236,30238,30239,30244,30248,30249,30296,30297,30298,30299,30300,30301,30302,30305,30481,31136,31240,31244,31245,31246,31247,31249,31250,31295,31296,35172,38688,38992,39687,40992,41018,41102,41891,42003,44091,45079,45639,45642,45643,45729,45730,45731,45733,45734,45735,45753,45758,45759,45762,46062,46064,46125,46148,46149,46150,46151,46152,46153,46154,46155,46156,46157,46158,46904,46998,46999,47007,47009,47016,47040,47045,47054,48965,50056,50057,316930);
