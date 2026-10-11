-- ruRU locale for creature_text, scoped to map 1501 (Black Rook Hold).
-- Several base `Text` values for Illysanna Ravencrest/Smashspite the Hateful/Latosius were
-- found mangled by a UTF-8-decoded-as-CP1251 mojibake bug (e.g. "Р’Р°Рј РЅРµ СѓР№С‚Рё." instead of
-- "Вам не уйти.") - decoded back correctly here via a locale row, which takes priority over the
-- corrupted base column for ruRU clients and fixes the live display bug without touching the
-- base table. NOT translated/fixed: (98696,3,0)/(98696,6,0)/(98949,2,0) hold literal placeholder
-- strings ("WARN_DARK_RUSH"/"WARN_EYE_BEAMS"/"WARN_HATEFUL_GAZE") with no real dialogue text
-- anywhere to translate from - flagging rather than inventing content.

DELETE FROM `creature_text_locale` WHERE (`CreatureID`,`GroupID`,`ID`) IN (
  (98542,0,0),(98542,1,0),(98542,2,0),(98542,3,0),(98542,200,0),(98542,201,0),(98542,202,0),
  (98696,0,0),(98696,1,0),(98696,2,0),(98696,4,0),(98696,5,0),(98696,7,0),(98696,200,0),(98696,201,0),(98696,202,0),
  (98706,0,0),
  (98792,0,0),(98792,1,0),(98792,2,0),(98792,3,0),
  (98810,0,0),
  (98900,0,0),
  (98949,0,0),(98949,1,0),(98949,3,0),(98949,4,0),(98949,5,0),(98949,6,0),
  (98965,0,0),(98965,1,0),(98965,200,0),
  (98970,0,0),(98970,1,0),(98970,2,0),(98970,3,0),(98970,4,0)
) AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(98542,0,0,'ruRU','Оставь этот скудный сосуд и присоединяйся к нам...'),
(98542,1,0,'ruRU','Урожай собран!'),
(98542,2,0,'ruRU','Оставь этот скудный сосуд и присоединяйся к нам...'),
(98542,3,0,'ruRU','Я питаюсь твоей сущностью...'),
(98542,200,0,'ruRU','Поглощай! Пожирай!'),
(98542,201,0,'ruRU','Урожай собран!'),
(98542,202,0,'ruRU','Я питаюсь твоей сущностью...'),
(98696,0,0,'ruRU','Охота вечна...'),
(98696,1,0,'ruRU','Вам не уйти.'),
(98696,2,0,'ruRU','Охота продолжается...'),
(98696,4,0,'ruRU','Стража! Придержите их!'),
(98696,5,0,'ruRU','Я сожгу вас заживо!'),
(98696,7,0,'ruRU','О, нет! Меня... предали...'),
(98696,200,0,'ruRU','Мы похороним вас здесь, глупцы.'),
(98696,201,0,'ruRU','Вам не уйти.'),
(98696,202,0,'ruRU','Нет! Теперь я вижу... предательство...'),
(98706,0,0,'ruRU','Братья и сёстры, захватчики пришли за нами. Отразите их! В атаку!'),
(98792,0,0,'ruRU','Ха! Мы их этими большими камнями прикончим!'),
(98792,1,0,'ruRU','А-а! Они идут! БЕГИ!'),
(98792,2,0,'ruRU','Гра-а... Ох... оооААААА!!!!'),
(98792,3,0,'ruRU','А-А-А! МЫ ИЗВИНЯЕМСЯ! МЫ ОБЕЩАЕМ!'),
(98810,0,0,'ruRU','%s приходит в ярость!'),
(98900,0,0,'ruRU','Ладно! На этот раз мы точно их поймали!'),
(98949,0,0,'ruRU','Я раскрашу крепость вашей кровью!'),
(98949,1,0,'ruRU','Не убежишь, букашка...'),
(98949,3,0,'ruRU','Ха! Поймал!'),
(98949,4,0,'ruRU','Трепещите.'),
(98949,5,0,'ruRU','Получи!'),
(98949,6,0,'ruRU','Как... же... так...'),
(98965,0,0,'ruRU','Я разрублю тебя пополам!'),
(98965,1,0,'ruRU','Я разрежу тебя на двое!'),
(98965,200,0,'ruRU','Демоны, вам никогда не получить наш мир!'),
(98970,0,0,'ruRU','Сгори!'),
(98970,1,0,'ruRU','|TInterface\\Icons\\spell_shadow_zdemonformgreen:20|t%s применяет заклинание |cFFFF0000|Hspell:199193|h["Хитроумие повелителя ужаса"]|h|r!'),
(98970,2,0,'ruRU','Вы не понимаете, с чем связались, смертные...'),
(98970,3,0,'ruRU','Спите...'),
(98970,4,0,'ruRU','Я... вернусь!');

-- Cleanup: missed the GroupID 200+ announce-text duplicates for 98949 on the first pass,
-- plus one already-Russian base-text row for 98521 (locale row added for consistency only).
DELETE FROM `creature_text_locale` WHERE (`CreatureID`,`GroupID`,`ID`) IN (
  (98521,4,0),
  (98949,200,0),(98949,201,0),(98949,202,0)
) AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(98521,4,0,'ruRU','|TInterface\\Icons\\spell_warlock_demonsoul:20|tНа вас действует |cFFFF0000|Hspell:194960|h["Эхо души"]|h|r!'),
(98949,200,0,'ruRU','Я раскрашу крепость вашей кровью!'),
(98949,201,0,'ruRU','Трепещите передо мной.'),
(98949,202,0,'ruRU','Но... я не могу... проиграть...');
