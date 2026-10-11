-- ruRU locale for creature_text, scoped to map 1753 (Void Elf allied-race unlock scenario:
-- Alleria Windrunner, Viceroy Nezhar, Zuraal the Ascended, Saprish, Locus-Walker).

DELETE FROM `creature_text_locale` WHERE (`CreatureID`,`GroupID`,`ID`) IN (
  (122056,0,0),(122056,1,0),
  (122313,0,0),(122313,1,0),(122313,2,0),(122313,3,0),(122313,4,0),(122313,5,0),(122313,6,0),
  (122316,0,0),(122316,1,0),(122316,2,0),(122316,3,0),
  (123187,0,0),
  (123743,0,0),(123743,1,0),
  (124276,0,0),(124276,1,0),
  (125099,0,0)
) AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(122056,0,0,'ruRU','Я принесу тебе твои сумерки!'),
(122056,1,0,'ruRU','Нет! Тьма... должна была принадлежать мне...'),
(122313,0,0,'ruRU','Я покончу с тобой!'),
(122313,1,0,'ruRU','Отправляйся в Пустоту!'),
(122313,2,0,'ruRU','|TINTERFACE\\ICONS\\ability_fixated_state_red.blp:20|t Зураал Вознёсшийся сосредоточился на вас!'),
(122313,3,0,'ruRU','Жалкое зрелище!'),
(122313,4,0,'ruRU','Тьма, дай мне сил!'),
(122313,5,0,'ruRU','Я отправлю тебя во тьму!'),
(122313,6,0,'ruRU','Ясность... приходит ко мне. Пустота... была слаба.'),
(122316,0,0,'ruRU','Наши старания не будут прерваны!'),
(122316,1,0,'ruRU','Я всегда буду на шаг впереди!'),
(122316,2,0,'ruRU','Бей сильно и быстро!'),
(122316,3,0,'ruRU','Я не... предвидел этого.'),
(123187,0,0,'ruRU','Осторожно!'),
(123743,0,0,'ruRU','Защитники! Сюда!'),
(123743,1,0,'ruRU','За мной!'),
(124276,0,0,'ruRU','|TInterface\\ICONS\\SPELL_WARLOCK_DEMONICPORTAL_PURPLE:20|tРазрыв Пустоты появился у Нижних Врат Пустоты!'),
(124276,1,0,'ruRU','|TInterface\\ICONS\\SPELL_WARLOCK_DEMONICPORTAL_PURPLE:20|tРазрыв Пустоты появился у Основания Храма!'),
(125099,0,0,'ruRU','Высасывай энергию портала! Слабость наару станет твоей силой!');

-- Second pass: rows whose base `Text` already holds Russian content with no formal locale row -
-- same convention as before, insert matching locale rows so they stop resurfacing.
DELETE FROM `creature_text_locale` WHERE (`CreatureID`,`GroupID`,`ID`) IN (
  (122056,0,1),(122056,1,1),(122056,2,0),(122056,2,1),(122056,3,0),(122056,3,1),
  (122316,1,1),(122316,3,1),(122316,4,0),
  (123187,3,0),
  (123743,2,0),
  (124276,2,0),
  (125099,3,0)
) AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(122056,0,1,'ruRU','Бездна зовет меня!'),
(122056,1,1,'ruRU','Моя смерть... ничего не значит. Бездна... поглотит все.'),
(122056,2,0,'ruRU','Прощайтесь с жизнью!'),
(122056,2,1,'ruRU','Вглядитесь в бездну и падите духом!'),
(122056,3,0,'ruRU','Тьма забрала тебя.'),
(122056,3,1,'ruRU','Твой свет померк.'),
(122316,1,1,'ruRU','Банальная... тактическая ошибка...'),
(122316,3,1,'ruRU','Я всегда на шаг впереди!'),
(122316,4,0,'ruRU','|TInterfaceIconsABILITY_ROGUE_SHADOWSTEP:20|tСарпиш собирается поразить вас |cFFFF0000|Hspell:247246|h[Призрачным ударом]|h|r!'),
(123187,3,0,'ruRU','Осторожно!'),
(123743,2,0,'ruRU','Выясните, что они задумали... И остановите их.'),
(124276,2,0,'ruRU','|TInterface\\ICONS\\SPELL_WARLOCK_DEMONICPORTAL_PURPLE:20|tНа осыпающихся руинах появляется прорыв Бездны!'),
(125099,3,0,'ruRU','Забери ее тень, Аллерия! Вспомни, чему я тебя учил!');
