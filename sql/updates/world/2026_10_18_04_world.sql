-- Квест "И у нас есть союзники" (24681?): Метатель глеф 38150 (спеллклик 71238 -> призыв управляемого 37927) нельзя было нажать: в creature_template npcflag = 0,
-- а у обычного НПС без транспорта флаг UNIT_NPC_FLAG_SPELLCLICK (16777216) обязан стоять в шаблоне, иначе клиент не показывает курсор и не шлёт клик.
-- cast_flags 0 -> 1 (кликнувший игрок заклинатель, как у всех строк 37927 и у 3399 из ~4000 строк): иначе призванный метатель не получает игрока.
-- Откат: UPDATE creature_template SET npcflag = npcflag & ~16777216 WHERE entry = 38150; UPDATE npc_spellclick_spells SET cast_flags = 0 WHERE npc_entry = 38150 AND spell_id = 71238;
UPDATE `creature_template` SET `npcflag` = `npcflag` | 16777216 WHERE `entry` = 38150;
UPDATE `npc_spellclick_spells` SET `cast_flags` = 1 WHERE `npc_entry` = 38150 AND `spell_id` = 71238;
