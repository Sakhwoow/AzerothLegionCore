-- Fix spell_proc rows whose SpellPhaseMask is unset even though the inherited (DBC) or
-- explicit ProcFlags requires one -- these procs currently never trigger at all
-- (SpellMgr::LoadSpellProcs logs "Proc will not be triggered" for each). Best-effort
-- default: PROC_SPELL_PHASE_HIT (2), the overwhelmingly common choice for "proc on
-- spell hit/damage dealt" effects in this core's convention -- not individually
-- verified against retail per-spell behavior, so review if a specific spell misbehaves.
UPDATE `spell_proc` SET `SpellPhaseMask`=2 WHERE `SpellId` IN (7434,37603,38394,39958,40438,40478,45054,55380,60170,60487,64752,64824,64914,70664,70727,70854,71606,71637,209566,215569);

-- spell_proc entry for 209566 also had HitMask=65536 (bit 16), outside the valid
-- PROC_HIT_MASK_ALL range (bits 0-13 / 0x3FFF) -- clearly bad data with no way to
-- recover the intended bit, so cleared to 0 (no hit-type restriction) rather than guess.
UPDATE `spell_proc` SET `HitMask`=0 WHERE `SpellId`=209566;
