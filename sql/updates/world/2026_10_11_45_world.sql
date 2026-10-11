-- Backfill creature_text for lines that were hardcoded as literal English strings directly in
-- C++ (bypassing the locale system entirely) across 4 live Legion scripts: class_hall_druid.cpp,
-- scenario_artifact_restoacqusition.cpp, zone_legion_azsuna.cpp, zone_legion_valsharah.cpp.
-- The C++ side of this fix replaced each Yell("literal")/Say("literal") call with Talk(groupId),
-- matching this codebase's own established convention (confirmed via CreatureAI::Talk ->
-- sCreatureTextMgr->SendChat, which is fully locale-aware). Two of the sixteen "new" groups below
-- (Coth GroupID 0, Ancestral Champion GroupID 0) and two already-existing groups (Drowned
-- Magister/Unbreathing Soul in Azsuna) turned out to already have a matching English/Russian base
-- row sitting unused in the table - those only needed the C++ call fixed plus (for the Azsuna
-- pair) a formal ruRU locale row for consistency; no new creature_text insert was needed for them.

-- New creature_text rows (base English text + Type matching the original Say/Yell call).
DELETE FROM `creature_text` WHERE (`CreatureID`,`GroupID`,`ID`) IN (
  (101195,3,0),(103832,1,0),(101195,4,0),(101195,5,0),(101195,6,0),(103832,2,0),
  (104385,5,0),
  (113525,0,0),(113525,1,0),(113525,2,0),
  (104349,2,0),(104349,3,0),(104349,4,0),
  (104398,2,0),
  (104659,2,0),
  (104619,0,0)
);
INSERT INTO `creature_text` (`CreatureID`,`GroupID`,`ID`,`Text`,`Type`,`Language`,`Probability`,`Emote`,`Duration`,`Sound`,`BroadcastTextId`,`TextRange`,`comment`) VALUES
(101195,3,0,'Ishnu-alah, son of Cenarius. I''m well aware of what brings you. I''ve heard the screams of the land as it is defiled by the Legion.',12,0,100,0,0,0,0,0,'Rensar Greathoof'),
(103832,1,0,'We must act swiftly and prepare the weapons of old for war once again.',12,0,100,0,0,0,0,0,'Keeper Remulos'),
(101195,4,0,'The weapons of the first druids can surely turn the tide in our favor, but is there anyone with the strength to wield them?',12,0,100,0,0,0,0,0,'Rensar Greathoof'),
(101195,5,0,'Very well, your task will not be easy but I shall do all that I can to aid you.',12,0,100,0,0,0,0,0,'Rensar Greathoof'),
(101195,6,0,'g''hanir will not last much longer. It must be cleansed.',12,0,100,0,0,0,0,0,'Rensar Greathoof'),
(103832,2,0,'We must aid Bashana in clearing out the remaining nightmare here. G''Hanir''s fate rests with Lyessa and $n.',12,0,100,0,0,0,0,0,'Keeper Remulos'),
(104385,5,0,'Is there anyone who would fight at your side, druid?',12,0,100,0,0,0,0,0,'Ursol'),
(113525,0,0,'Oh, frends. I don''t know what to do!',12,0,100,0,0,0,0,0,'Mylune'),
(113525,1,0,'Don''t worry - $n is going to fix this, just you wait!',12,0,100,0,0,0,0,0,'Mylune'),
(113525,2,0,'Be careful - it isn''t safe in the Dream right now',12,0,100,0,0,0,0,0,'Mylune'),
(104349,2,0,'You still have the moonwater, yes? Good, good, then you are ready.',12,0,100,0,0,0,0,0,'Naralex'),
(104349,3,0,'G''Hanir grows more corrupt with each passing moment - may your feet carry you swiftly.',12,0,100,0,0,0,0,0,'Naralex'),
(104349,4,0,'By the Ancients. you have it! You have G''Hanir!',12,0,100,0,0,0,0,0,'Naralex'),
(104398,2,0,'Anyone...someone! I can''t escape these roots!',14,0,100,0,0,0,0,0,'Bashana Runetotem'),
(104659,2,0,'For G''Hanir!',12,0,100,0,0,0,0,0,'Archdruid Hamuul Runetotem'),
(104619,0,0,'In Mannoroth''s name!',12,0,100,0,0,0,0,0,'Destromath');

-- ruRU translations for all sixteen new groups plus the four pre-existing-but-untranslated rows
-- (Coth/Ancestral Champion English base rows that already existed; Azsuna's Drowned Magister/
-- Unbreathing Soul whose base Text was already Russian but had no formal locale row).
DELETE FROM `creature_text_locale` WHERE (`CreatureID`,`GroupID`,`ID`) IN (
  (101195,3,0),(103832,1,0),(101195,4,0),(101195,5,0),(101195,6,0),(103832,2,0),
  (104385,5,0),
  (113525,0,0),(113525,1,0),(113525,2,0),
  (104349,2,0),(104349,3,0),(104349,4,0),
  (104398,2,0),
  (104659,2,0),
  (104619,0,0),
  (104657,0,0),
  (104714,0,0),
  (87368,1,0),(87369,1,0)
) AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(101195,3,0,'ruRU','Ишну-ала, сын Кенария. Я хорошо знаю, что привело тебя. Я слышал крики земли, оскверняемой Легионом.'),
(103832,1,0,'ruRU','Мы должны действовать быстро и снова подготовить древнее оружие к войне.'),
(101195,4,0,'ruRU','Оружие первых друидов наверняка способно переломить ход событий в нашу пользу, но найдётся ли кто-то, у кого хватит сил, чтобы владеть им?'),
(101195,5,0,'ruRU','Что ж, твоя задача не будет лёгкой, но я сделаю всё, что в моих силах, чтобы помочь тебе.'),
(101195,6,0,'ruRU','Г''Ханир не протянет долго. Его нужно очистить.'),
(103832,2,0,'ruRU','Мы должны помочь Башане очистить оставшийся здесь Кошмар. Судьба Г''Ханира в руках Лиессы и $n.'),
(104385,5,0,'ruRU','Найдётся ли кто-то, кто будет сражаться на твоей стороне, друид?'),
(113525,0,0,'ruRU','Ох, друзья. Я не знаю, что делать!'),
(113525,1,0,'ruRU','Не волнуйтесь — $n всё исправит, вот увидите!'),
(113525,2,0,'ruRU','Будьте осторожны — в Сне сейчас небезопасно'),
(104349,2,0,'ruRU','У тебя ещё осталась лунная вода, да? Хорошо, хорошо, значит, ты готов.'),
(104349,3,0,'ruRU','Г''Ханир оскверняется всё сильнее с каждым мгновением — пусть твои ноги несут тебя быстро.'),
(104349,4,0,'ruRU','Клянусь Древними. Ты сделал это! У тебя Г''Ханир!'),
(104398,2,0,'ruRU','Кто-нибудь... помогите! Я не могу вырваться из этих корней!'),
(104659,2,0,'ruRU','За Г''Ханира!'),
(104619,0,0,'ruRU','Во имя Маннорота!'),
(104657,0,0,'ruRU','Я тебя сейчас подпалю!'),
(104714,0,0,'ruRU','Это существо недостойно тебя, великий Урсол! Я сокрушу его во имя твоё!'),
(87368,1,0,'ruRU','Фарондис! Предатель! Ты обрек нас на это!'),
(87369,1,0,'ruRU','УМРИ... ФАРОНДИС...');
