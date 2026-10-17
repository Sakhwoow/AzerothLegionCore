-- Квест "Слушая наше дыхание" (14395): после спасения утопающего страж нельзя было взять следующего ещё 3 минуты.
--
-- Клик по стражу кастует спелл 68735 "Rescue Drowning Watchman" (аура SET_VEHICLE_ID на игроке, 3 минуты, вручную
-- не снимается: SPELL_ATTR0_CANT_CANCEL). По данным спелла (SpellAuraRestrictions) у него ExcludeCasterAuraSpell =
-- 68735: его нельзя применить, пока на кастере висит его же аура, и клиент показывает "Это пока невозможно".
-- Скрипт npc_drowning_watchman_36440 при засчитывании спасения (рядом с Принцем Лиамом) даёт кредит и кастует
-- игроком 68737 и 68741 на стража, но ауру 68735 с игрока не снимает: SpellScript снимает её только в ветке
-- "не в воде, страж уже на транспорте", до которой при автозасчитывании дело не доходит.
--
-- Связанный спелл (type 0 = при касте): когда игрок кастует 68737 (засчитывание спасения), с него снимается 68735.
-- 68741 в данных клиента без записи имени (SpellInfo отсутствует), поэтому цепляемся только за 68737.
-- Если страж так и не доставлен (потерялся, игрок вышел), аура сама истекает через 3 минуты - как раньше.
-- Откат: DELETE FROM spell_linked_spell WHERE spell_trigger=68737 AND spell_effect=-68735 AND type=0;
DELETE FROM `spell_linked_spell` WHERE `spell_trigger`=68737 AND `spell_effect`=-68735 AND `type`=0;
INSERT INTO `spell_linked_spell` (`spell_trigger`, `spell_effect`, `type`, `comment`) VALUES
(68737, -68735, 0, 'Gasping for Breath 14395: after a rescue is credited remove the Rescue Drowning Watchman aura (68735 excludes itself on the caster for 3 minutes)');
