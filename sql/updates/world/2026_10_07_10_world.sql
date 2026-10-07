-- Fix 12 trap GameObjects (GoType 8) whose data2 field was set to 1 (pointing at the
-- unrelated non-trap GO entry 1, "Quilboar Watering Hole") instead of 0 (no linked
-- trap). Pre-existing bad data from the base 735.02 import, unrelated to the upstream
-- LegionCore 2024-10-23 dump work. ObjectMgr::CheckGOLinkedTrapId only validates when
-- data2 resolves to a GO entry, so 0 silently skips the check as intended.
UPDATE `gameobject_template` SET `data2`=0 WHERE `type`=8 AND `data2`=1 AND `entry` IN (241696,241691,241510,241515,241694,241454,241514,241420,241437,241438,241695,241516);
