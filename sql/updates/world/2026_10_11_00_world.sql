-- Captain Fareeya's Broken Shore intro speech (Vindicaar, creature 130993) had no ruRU
-- translation, so it fell back to English for Russian-locale clients while the rest of the
-- scripted sequence around her is localized.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 130993 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(130993, 0, 0, 'ruRU', 'Тысячи лет Озарённые Светом сражались с демонами в Круговерти Пустоты. "Ксенедар" был единственным домом, который мы знали.'),
(130993, 1, 1, 'ruRU', 'Теперь, впервые за долгие века, мы можем идти под небом, не осквернённым безумием Легиона... и снова чувствовать землю под копытами.'),
(130993, 2, 2, 'ruRU', 'Но нельзя терять бдительность. Одна война заканчивается — начинается следующая. Такова жизнь солдата.'),
(130993, 3, 3, 'ruRU', 'Твой долг начинается в Штормграде. Исследуй этот мир — Азерот. Узнай людей и места, которые мы поклялись защищать.'),
(130993, 4, 4, 'ruRU', 'И всегда иди путём Света, $p.');

-- Vigilant Quoram (creature 130986, same starting ship - guards the Vindicaar's combat trial
-- simulation) had the same gap - 6 short lines, also no ruRU row.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 130986 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(130986, 0, 0, 'ruRU', 'Боюсь, я не могу этого позволить.'),
(130986, 1, 0, 'ruRU', 'Хорошо.'),
(130986, 2, 0, 'ruRU', 'Пока что.'),
(130986, 3, 0, 'ruRU', 'Поздравляю.'),
(130986, 4, 0, 'ruRU', 'Зачем ты вернулся?'),
(130986, 5, 0, 'ruRU', 'Это создано, чтобы убить тебя.');

-- First Arcanist Thalyssra (97140, Suramar memory-vision sequence) - groups 0-19 had no ruRU
-- anywhere (neither locale row nor base Text). Groups 20-27 of the same sequence already carry
-- Russian text directly in the base `Text` column (not via locale - architecturally unusual,
-- but it already displays correctly for ruRU clients via fallback) - left untouched.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 97140 AND `Locale` = 'ruRU' AND `GroupID` BETWEEN 0 AND 19;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(97140, 0, 0, 'ruRU', 'Я думала, тебя интересует только собственная выгода.'),
(97140, 1, 0, 'ruRU', 'А... туман немного рассеялся...'),
(97140, 2, 0, 'ruRU', 'Но, безусловно, самое важное. Если мы потерпим неудачу, Сурамар обречён.'),
(97140, 3, 0, 'ruRU', 'Валтруа, можешь ли ты придумать способ получить больше энергии? Хотя бы ненадолго?'),
(97140, 4, 0, 'ruRU', 'Что может вызвать всплеск силовой линии?'),
(97140, 5, 0, 'ruRU', 'Избавь нас от подробностей, просто сделай это. Я рассчитываю на тебя.'),
(97140, 6, 0, 'ruRU', 'Развей эти воспоминания, чтобы мы могли продолжить.'),
(97140, 7, 0, 'ruRU', 'Этот голод... этот страх...'),
(97140, 8, 0, 'ruRU', 'Я тоже это чувствовала...'),
(97140, 9, 0, 'ruRU', 'Идём дальше.'),
(97140, 10, 0, 'ruRU', 'Thala nar''valas.'),
(97140, 11, 0, 'ruRU', 'Такое смятение... такая ярость...'),
(97140, 12, 0, 'ruRU', 'Я теряю контроль...'),
(97140, 13, 0, 'ruRU', 'А-а!! Заставь их остановиться! Пожалуйста, заставь их остановиться!'),
(97140, 14, 0, 'ruRU', 'А-А-А-А!!'),
(97140, 15, 0, 'ruRU', 'Нннгх- ХВАТИТ!!'),
(97140, 16, 0, 'ruRU', 'Вот... ты ведь что-то нашёл, да?'),
(97140, 17, 0, 'ruRU', 'Что-то, что принесло тебе покой...'),
(97140, 18, 0, 'ruRU', 'Покой, в котором мы сами так отчаянно нуждаемся.'),
(97140, 19, 0, 'ruRU', 'Я... я в порядке.');

-- Archmage Khadgar (90417) - groups 0,1,2,7,8,12,13 were still pure English. Groups 3-6/9-11
-- already carry Russian directly in the base Text column (same pattern as Thalyssra above) -
-- left untouched, they already display correctly.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 90417 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2,7,8,12,13);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(90417, 0, 0, 'ruRU', 'Никто не трогайте! Не раньше, чем явится наш гость.'),
(90417, 1, 0, 'ruRU', 'Любое воздействие должно запустить процесс. Просто... ну, ткни её или что-то в этом роде.'),
(90417, 2, 0, 'ruRU', 'Будь осторожен, защитник. Земли Сурамара десять тысяч лет пребывали в диком состоянии.'),
(90417, 7, 0, 'ruRU', 'Ай!! Что это, во имя Света, было?!'),
(90417, 8, 0, 'ruRU', 'Что-то... укусило меня за голову, кажется.'),
(90417, 12, 0, 'ruRU', 'Ты про Тройной огненный диск? Да, он отдал его мне, но это было очень давно. Ещё когда я учился в Каражане.'),
(90417, 13, 0, 'ruRU', 'Тогда я работал над ним вместе с архимагом Альтурусом. Возможно, он до сих пор знает, где диск находится. Ты найдёшь его неподалёку от Каражана.');

-- Meryl Felstorm (102700) - groups 0-11 already Russian in base Text, only 12/13 were English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 102700 AND `Locale` = 'ruRU' AND `GroupID` IN (12,13);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(102700, 12, 0, 'ruRU', 'Значит, на Аррексиса напал этот эредар, Балаадур? Тогда, вероятно, посох теперь у него...'),
(102700, 13, 0, 'ruRU', 'Давай повторим ритуал Аррексиса! Если начать ритуал в точке вторжения, это привлечёт внимание Балаадура. Он наверняка устроит нам засаду, но мы будем готовы.');

-- Professor Pallin (92195) - fully English, no partial translation this time.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92195 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92195, 0, 0, 'ruRU', 'Не здесь внизу? Хорошо, тогда поднимись по лестнице и проверь верхнюю библиотеку.'),
(92195, 2, 2, 'ruRU', 'Не теряй надежды, %s. Продолжай помол и проверяй чернила на необычные свойства. Вместе мы, возможно, сумеем восполнить пробелы в этой книге.'),
(92195, 3, 3, 'ruRU', 'Не утруждайся её читать.'),
(92195, 4, 4, 'ruRU', 'Просто подпиши.'),
(92195, 5, 5, 'ruRU', 'Вот здесь, на строке.'),
(92195, 6, 6, 'ruRU', 'Я тоже хотел бы поэкспериментировать с этим пигментом. Так, посмотрим...'),
(92195, 7, 7, 'ruRU', 'Получилось даже лучше, чем я ожидал. Да, этот пигмент отлично подойдёт.'),
(92195, 8, 8, 'ruRU', 'ОНИ ВЫБРОСИЛИ ЦЕЛ... э-э... то есть, посмотрим, что я смогу с этим сделать.'),
(92195, 9, 9, 'ruRU', 'Этот рыбный пигмент и правда кое-что. Пожалуй, стоит начать его продавать...'),
(92195, 10, 10, 'ruRU', 'И для последнего штриха — капелька магии, и...'),
(92195, 11, 11, 'ruRU', 'Вуаля! Готово.'),
(92195, 12, 12, 'ruRU', 'Пожалуй, я и правда задолжал услугу этому хвастуну. Тебе повезло — перевод это как раз моя специализация!'),
(92195, 13, 13, 'ruRU', 'Это древние письмена врайкулов, принадлежавшие некой "Свене". Поистине редкая и занятная находка. Передай Деукусу, что теперь уже ОН мой должник!');

-- Havi (92539) - groups 0-3 English, 4-10 already Russian in base Text.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92539 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92539, 0, 0, 'ruRU', 'В Хауствальде Костоглашатаи хранят мёртвых. Они тебе не помогут.'),
(92539, 1, 0, 'ruRU', 'Их пути извращены. Они забыли древние клятвы.'),
(92539, 2, 0, 'ruRU', 'Но есть одна, кто помнит. Та, что крепко держится старых обычаев.'),
(92539, 3, 0, 'ruRU', 'Найди Вюдхар! Заслужи её суд и пройди Испытание доблести.');

-- Deucus Valdera (92458) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92458 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92458, 0, 0, 'ruRU', 'Патриция! Не будешь ли ты так любезна показать нашему другу новейшие рецепты, которые мы открыли?'),
(92458, 1, 1, 'ruRU', 'Давай попробуем рецепт этого "Зелья дикой магии", хорошо?'),
(92458, 2, 2, 'ruRU', 'Пожалуй, стоит убрать этот беспорядок и освободить место для новых инструментов.'),
(92458, 3, 3, 'ruRU', 'Поговори с Патрицией. Думаю, она может предложить тебе новый рецепт.'),
(92458, 4, 4, 'ruRU', 'Отлично сделано! У Патриции есть для тебя новый рецепт, $n.'),
(92458, 5, 5, 'ruRU', 'Превосходная работа. Поговори с Патрицией насчёт нового рецепта.'),
(92458, 6, 6, 'ruRU', 'Подойди сюда, $n. Думаю, у нас есть часть реагентов вот на этой полке.'),
(92458, 7, 7, 'ruRU', 'С нами всё будет в порядке, архимаг, но... посмотри, что это мерзкое существо сделало с моим алхимическим столом!'),
(92458, 8, 8, 'ruRU', 'Только проследи, чтобы $G он:она; не устроил$G :а; беспорядок на моём алхимическом столе!'),
(92458, 9, 9, 'ruRU', 'Ах да, вот он, у меня. Будь с ним ОЧЕНЬ осторожен. Если прольёшь хоть каплю, последствия могут быть, скажем так, неприятными.');

-- Tiffany Cartier (93526) - groups 0(ID1),5,6,8,9,10,11 were English; 0(ID0)/3/4 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 93526 AND `Locale` = 'ruRU' AND ((`GroupID`=0 AND `ID`=1) OR `GroupID` IN (5,6,8,9,10,11));
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(93526, 0, 1, 'ruRU', 'Рада встрече!'),
(93526, 5, 5, 'ruRU', 'Пожалуй, один экземпляр я могу уступить. Но передай Диди, что я выставлю ей счёт за него. Мы тут не благотворительностью занимаемся.'),
(93526, 6, 0, 'ruRU', 'Думаю, начать стоит с Катрионы Макрей. Она была моей последней клиенткой.'),
(93526, 8, 0, 'ruRU', 'Сейчас у меня ничего такого нет, нет. Но говорят, в Нижних кварталах можно найти самые разные товары.'),
(93526, 9, 0, 'ruRU', 'Сама бы я туда ни за что не сунулась, но, полагаю, тебе это не составит труда, учитывая твоё основное занятие |3-1($c)'),
(93526, 10, 0, 'ruRU', '$n, кажется, я просила тебя передать своему другу, чтобы он ПЕРЕСТАЛ слать эти свои письма?!'),
(93526, 11, 0, 'ruRU', 'ЧТО ЭТО ЗА ЧЕРТОВЩИНА?!');

-- Sashj'tar Reef Runner (99070) - fully English, naga hissing speech pattern.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99070 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99070, 0, 0, 'ruRU', 'Яндвик теперь нашшш.'),
(99070, 1, 0, 'ruRU', 'За Повелительницу приливов...'),
(99070, 2, 0, 'ruRU', 'Чёрная бездна...'),
(99070, 3, 0, 'ruRU', 'Сашджтар выйдут победителями, да-ссс.'),
(99070, 4, 0, 'ruRU', 'Море зовёт меня домой-ссс...'),
(99070, 5, 0, 'ruRU', 'Повелительница приливов обагрит Яндвик кровью врайкулов.'),
(99070, 6, 0, 'ruRU', 'Вам нас не остановить-ссс!'),
(99070, 7, 0, 'ruRU', 'Я выпотрошу тебя, как рыбу.'),
(99070, 8, 0, 'ruRU', 'Смерть нашим врагам-ссс!'),
(99070, 9, 0, 'ruRU', 'Сашджтар не берут пленных-ссс.');

-- Runas the Shamed (90372) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 90372 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(90372, 0, 0, 'ruRU', 'Какого чёрта ты творишь?'),
(90372, 1, 0, 'ruRU', 'Ты хоть знаешь, кто я такой?'),
(90372, 2, 0, 'ruRU', 'Погоди... а что это у тебя в руках?'),
(90372, 3, 0, 'ruRU', 'Весьма впечатляющее оружие, друг мой!'),
(90372, 4, 0, 'ruRU', 'Должно быть, очень больно получить им удар.'),
(90372, 5, 0, 'ruRU', 'Ты... ты начинаешь меня ЗЛИТЬ!!'),
(90372, 6, 0, 'ruRU', 'Я ТЕБЯ УБЬЮ! Я ВЫРВУ ТЕБЕ СЕРДЦЕ!'),
(90372, 7, 0, 'ruRU', 'Я ВЫПЬЮ МАНУ ИЗ ТВОИХ СЛОМАННЫХ КОСТЕЙ!!'),
(90372, 8, 0, 'ruRU', 'Я... я...');

-- Gravax the Desecrator (92802) - groups 0,2,5,6,7,9,20,27 English; group 4 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92802 AND `Locale` = 'ruRU' AND `GroupID` IN (0,2,5,6,7,9,20,27);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92802, 0, 0, 'ruRU', 'Наконец-то... разрушение пришло в этот жалкий мир!'),
(92802, 2, 0, 'ruRU', 'Наслаждайтесь этим мигом, смертные... он станет для вас последним!'),
(92802, 5, 0, 'ruRU', 'Трепещите перед мощью Пылающего Легиона!'),
(92802, 6, 0, 'ruRU', 'Молитесь своей жалкой богине... пусть она услышит ваши предсмертные вопли!'),
(92802, 7, 0, 'ruRU', 'Срывайте плоть с их костей... и высасывайте жизнь из их смертных тел!'),
(92802, 9, 0, 'ruRU', 'Да... сопротивляйтесь... ваши жалкие попытки выжить забавляют меня!'),
(92802, 20, 0, 'ruRU', 'Узрите, глупые эльфы. Я сокрушу вашего защитника.'),
(92802, 27, 0, 'ruRU', 'Никто не очнётся от Кошмара!');

-- Darkfiend Zealot (95726) - group 1 (IDs 0,2,3,4,6,7) English; group 0 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 95726 AND `Locale` = 'ruRU' AND `GroupID`=1 AND `ID` IN (0,2,3,4,6,7);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(95726, 1, 0, 'ruRU', 'Кошмар... приветствует меня...'),
(95726, 1, 2, 'ruRU', 'Добро пожаловать в свой кошмар!'),
(95726, 1, 3, 'ruRU', 'Ты пока не видишь, но увидишь.'),
(95726, 1, 4, 'ruRU', 'Жаль. Ты мог бы присоединиться к нам...'),
(95726, 1, 6, 'ruRU', 'Ищешь драку? Позволь мне...'),
(95726, 1, 7, 'ruRU', 'Твоё сопротивление бесполезно!');

-- Didi the Wrench (93520) - groups 0 and 8 were English, rest already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 93520 AND `Locale` = 'ruRU' AND `GroupID` IN (0,8);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(93520, 0, 0, 'ruRU', 'Начну чинить это подручными средствами.'),
(93520, 8, 0, 'ruRU', 'Конечно. Вот они, лежат на столе. Пока никаких жалоб на них не было!');

-- Darkfiend Corruptor (95727) - group 0 (all 5 IDs) and group 1 IDs 0,1 English; group 1 IDs 2,3
-- already Russian. Group 0 reuses the same flavor lines as the related Darkfiend Zealot (95726).
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 95727 AND `Locale` = 'ruRU' AND (`GroupID`=0 OR (`GroupID`=1 AND `ID` IN (0,1)));
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(95727, 0, 0, 'ruRU', 'Ищешь драку? Позволь мне...'),
(95727, 0, 2, 'ruRU', 'Добро пожаловать в свой кошмар!'),
(95727, 0, 3, 'ruRU', 'Кошмар... приветствует меня...'),
(95727, 0, 4, 'ruRU', 'Жаль. Ты мог бы присоединиться к нам...'),
(95727, 0, 5, 'ruRU', 'Эта земля обречена!'),
(95727, 1, 0, 'ruRU', 'Хочешь заполучить Идола леса? Я тебе ничего не скажу!'),
(95727, 1, 1, 'ruRU', 'Я ничего не знаю про Идола! Знаю только, что оторву тебе голову!');

-- Archmage Kalec (110773) - already fully Russian in base Text, nothing to do.

-- Fist of the Duskwatch (100439) - already fully Russian, nothing to do.

-- Nightborne Warpcaster (101821) - fully English. Fictional Shal'dorei phrases transliterated
-- into Cyrillic to match the existing precedent at Fist of the Duskwatch (100439), which uses
-- the identical two phrases already Cyrillic-transliterated there.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101821 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101821, 0, 0, 'ruRU', 'Моя магия... побеждена?'),
(101821, 1, 0, 'ruRU', 'Ваша эпоха закончилась!'),
(101821, 2, 0, 'ruRU', 'Араш-фолас...'),
(101821, 3, 0, 'ruRU', 'Тор''терас фалар!'),
(101821, 4, 0, 'ruRU', 'Никто не смеет бросить нам вызов!'),
(101821, 5, 0, 'ruRU', 'Нет! Ещё не время...'),
(101821, 6, 0, 'ruRU', 'Анат''ашар!'),
(101821, 7, 0, 'ruRU', 'Твоя смерть предопределена!');

-- Screeching Harridan (110949) - only group 13 was English, rest already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 110949 AND `Locale` = 'ruRU' AND `GroupID`=13;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(110949, 13, 0, 'ruRU', 'Я обращу тебя в камень и прах!');

-- Hellish Imp (115620) - already fully Russian, nothing to do.

-- Lord Jorach Ravenholdt (101513) - groups 1-5 English; group 0 is a deliberate French flourish
-- (character flavor, kept untranslated same as other real-world-language accents in WoW
-- localization); groups 6/7 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101513 AND `Locale` = 'ruRU' AND `GroupID` IN (1,2,3,4,5);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101513, 1, 0, 'ruRU', 'Сегодня $p заполучил$G :а; легендарные Клинки ужаса, и тем самым дал$G :а; нам возможность нанести удар по Легиону напрямую.'),
(101513, 2, 0, 'ruRU', 'Давайте поднимем бокалы не только за нашу новую Тень, но и за рассвет новой эпохи для Некоронованных.'),
(101513, 3, 0, 'ruRU', 'Ван Клиф, Некоронованным ты всё ещё можешь пригодиться. У тебя есть выбор — жить и работать одним из агентов $p... или умереть прямо здесь.'),
(101513, 4, 0, 'ruRU', 'Значит, решено. Поздравляю, $p. Ван Клиф один из лучших — ты уже успел$G :а; в этом убедиться.'),
(101513, 5, 0, 'ruRU', 'Твой отец был бы разочарован в тебе, Ванесса.');

-- Tyrande Whisperwind (104728) - groups 1-7 English; group 0 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 104728 AND `Locale` = 'ruRU' AND `GroupID` IN (1,2,3,4,5,6,7);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(104728, 1, 0, 'ruRU', 'Поговори со мной, когда будешь готов$G :а; отправляться.'),
(104728, 2, 0, 'ruRU', 'Нет времени на скорбь. Элотир сейчас вне моей досягаемости. Идём, не медли.'),
(104728, 3, 0, 'ruRU', 'Шалан''ир уже совсем близко. Будь готов$G :а; к любой мерзости, что нас поджидает.'),
(104728, 4, 0, 'ruRU', 'Эти следы копыт ведут налево. За ними, быстро!'),
(104728, 5, 0, 'ruRU', 'Малфурион?! Отзовись!'),
(104728, 6, 0, 'ruRU', 'Только вместе с тобой!'),
(104728, 7, 0, 'ruRU', 'Клянусь Элуной, твоя мерзость будет изгнана из этого места!');

-- Tyrande Whisperwind (104799) - separate dialogue sequence (Nightmare vision, Malfurion), fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 104799 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(104799, 0, 0, 'ruRU', 'Изера... нет!'),
(104799, 1, 0, 'ruRU', 'Идём со мной. Изера не остановится, пока весь этот мир не погрузится в Кошмар.'),
(104799, 2, 0, 'ruRU', 'Ксавий использует Малфуриона как приманку, чтобы отвлечь меня от того, что должно быть сделано. Только мы можем остановить Изеру.'),
(104799, 3, 0, 'ruRU', 'Ах, Малфурион, любовь моя! Сотни и сотни лет он проспал под Лунной поляной.'),
(104799, 4, 0, 'ruRU', 'Всякий раз, когда меня одолевали сомнения, я спускалась в его курган. Я наблюдала за ним, пока он спал.'),
(104799, 5, 0, 'ruRU', 'Даже во сне его присутствие успокаивало меня. Я оставляла свои страхи под землёй и выходила на поверхность, готовая вести свой народ.'),
(104799, 6, 0, 'ruRU', 'Когда Малфурион вернулся ко мне, мы снова действовали как единое целое. Будто он никуда и не пропадал. Доводилось ли тебе любить так, как люблю я?'),
(104799, 7, 0, 'ruRU', 'Теперь Ксавий держит меня за горло. Я должна оставить своего возлюбленного и сразиться с самым прекрасным существом, какое я когда-либо знала.');

-- Bitterbrine Venomer (89283) - only ID 5 (GroupID is always 0 for this NPC - caught and
-- corrected a GroupID/ID transcription swap here) was English, rest already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 89283 AND `Locale` = 'ruRU' AND `GroupID`=0 AND `ID`=5;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(89283, 0, 5, 'ruRU', 'Я скормлю тебя рыбам!');

-- Lothrius Mooncaller (101768) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101768 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101768, 0, 0, 'ruRU', 'Иногда я забываю, насколько талантлива Серена. Добро пожаловать, можно сказать. Давно пора разобраться с этими незваными гостями.'),
(101768, 1, 0, 'ruRU', 'Манафаг!'),
(101768, 2, 0, 'ruRU', 'Будь осторожен, друг мой — похоже, мои руны совершенно не действуют на их механизмы.'),
(101768, 3, 0, 'ruRU', 'Ты нашёл их! Я немедленно позабочусь о том, чтобы их должным образом сохранили и отправили в безопасное место.'),
(101768, 4, 0, 'ruRU', 'Я проложил для тебя безопасный путь. Прикосновение к кристаллам призовёт моих стражей тебе на помощь. Используй это с умом и поспеши!'),
(101768, 5, 0, 'ruRU', 'Мы также решили, что настало время покинуть это место.'),
(101768, 6, 0, 'ruRU', 'Идём. Я вижу проход в скале.');

-- Masqued Reveler (105351) - groups 0-4 English; groups 6/7 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 105351 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2,3,4);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(105351, 0, 0, 'ruRU', 'Хм. Да. Любопытно.'),
(105351, 1, 0, 'ruRU', 'Любопытно...'),
(105351, 2, 0, 'ruRU', 'Знаешь, у магистрикс повсюду есть шпионы.'),
(105351, 3, 0, 'ruRU', 'Кто тебя сюда впустил?'),
(105351, 4, 0, 'ruRU', 'Тсс. Столик за домом. Леди Ли''лет ждёт тебя.');

-- Vineyard Enforcer (108875) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 108875 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(108875, 0, 0, 'ruRU', 'Виноградники открыты только для особых гостей. Тебе нужно немедленно уйти.'),
(108875, 1, 0, 'ruRU', 'У тебя нет разрешения на вход на виноградник.'),
(108875, 2, 0, 'ruRU', 'Отойди!'),
(108875, 3, 0, 'ruRU', 'Очень хорошо.'),
(108875, 4, 0, 'ruRU', 'Эй, ты! Марш работать!'),
(108875, 5, 0, 'ruRU', 'Не желаю слышать никаких оправданий. Марш работать!'),
(108875, 6, 0, 'ruRU', 'Надзиратель об этом узнает. Запомни мои слова, Марго.');

-- Possessed Vrykul (103529) - groups 0(ID0,3)/1/2/3 English; group0(ID4,5) already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 103529 AND `Locale` = 'ruRU' AND ((`GroupID`=0 AND `ID` IN (0,3)) OR `GroupID` IN (1,2,3));
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(103529, 0, 0, 'ruRU', 'Где... что...'),
(103529, 0, 3, 'ruRU', 'Я свободен!'),
(103529, 1, 0, 'ruRU', 'Не могу дышать...'),
(103529, 2, 0, 'ruRU', 'Тупой кальмар!'),
(103529, 3, 0, 'ruRU', 'Будь прокляты эти наги!');

-- Valewalker Farodin (107126) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 107126 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(107126, 0, 0, 'ruRU', 'Узри. Дар древних магов.'),
(107126, 1, 0, 'ruRU', 'Арканодрево не просто поддержит тебя. Плод с его ветвей исцелит тебя без остатка.'),
(107126, 2, 0, 'ruRU', 'Чистая сущность жизни... Остаётся лишь надеяться, что этого будет достаточно.'),
(107126, 3, 0, 'ruRU', '[Вздох облегчения] ...Равновесие восстановлено. Арканодрево не подведёт.'),
(107126, 4, 0, 'ruRU', 'Арканодрево находится в критическом состоянии.'),
(107126, 5, 0, 'ruRU', 'Без достаточной силы для окончательного созревания оно погибнет.'),
(107126, 6, 0, 'ruRU', 'Этого недостаточно...');

-- Acolyte of Elothir (91149) - GroupID is always 0 for this NPC, IDs 1-5 were English; ID 0
-- already Russian (caught and corrected a GroupID/ID transcription swap here).
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91149 AND `Locale` = 'ruRU' AND `GroupID`=0 AND `ID` IN (1,2,3,4,5);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91149, 0, 1, 'ruRU', 'Я чувствовал$g:а; , как жизнь покидает меня...'),
(91149, 0, 2, 'ruRU', 'А-ах, снова дышать!'),
(91149, 0, 3, 'ruRU', 'Благословляю тебя, незнакомец!'),
(91149, 0, 4, 'ruRU', 'Я жив$g:а;!'),
(91149, 0, 5, 'ruRU', 'Ты... ты спас$g:ла; меня!');

-- Stoneblood Temptress (91598) - group0 IDs0,1,3,4 and group2 ID2 English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91598 AND `Locale` = 'ruRU' AND ((`GroupID`=0 AND `ID` IN (0,1,3,4)) OR (`GroupID`=2 AND `ID`=2));
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91598, 0, 0, 'ruRU', 'А-а... будь ты проклят$g:а;!'),
(91598, 0, 1, 'ruRU', 'Сдери плоть и развей кости!'),
(91598, 0, 3, 'ruRU', 'Глупец! Умри!'),
(91598, 0, 4, 'ruRU', 'Кррггхааав!'),
(91598, 2, 2, 'ruRU', 'Нас не остановить!');

-- Absolon (101848) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101848 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101848, 0, 0, 'ruRU', 'Тьма рассеивается... спасибо тебе.'),
(101848, 1, 0, 'ruRU', 'Я покинул город, чтобы найти свою дочь. Она была одной из тех, кто осмелился выступить против Элисанды...'),
(101848, 2, 0, 'ruRU', 'Её больше нет. Я думал, что присоединюсь к ней в руинах безмозглой оболочкой, но ты...'),
(101848, 3, 0, 'ruRU', 'Ты спас$g:ла; меня.'),
(101848, 4, 0, 'ruRU', 'Теперь я поищу укрытие. Надеюсь, мы ещё встретимся, друг.');

-- Tyrande Whisperwind (103022, a third separate entry alongside 104728/104799) - groups
-- 0,1,3,4,5 English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 103022 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,3,4,5);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(103022, 0, 0, 'ruRU', 'Идём. Не задерживай нас.'),
(103022, 1, 0, 'ruRU', 'Тропа разделяется. Погоди, что это?'),
(103022, 3, 0, 'ruRU', 'Перья и кровь... Ещё не высохла! Возможно, ещё есть время!'),
(103022, 4, 0, 'ruRU', 'Порча здесь очень сильна. Что это там, за мостом? Держись рядом.'),
(103022, 5, 0, 'ruRU', 'Элотир? Клянусь Элуной... только не ты тоже! Ты не видел$g:а; моего мужа?');

-- Arluin (107253) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 107253 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(107253, 0, 0, 'ruRU', 'Лорина найдёшь на площади. Силесса часто бывает у каналов. А Сирилла просто поищи на базаре — его сложно не заметить.'),
(107253, 1, 0, 'ruRU', 'Так вот чем она занята? Храбрая девчонка. Я бы с радостью помог, но...'),
(107253, 2, 0, 'ruRU', 'Всегда пожалуйста. Сделай по-моему, и она станет советницей ещё до ужина.'),
(107253, 3, 0, 'ruRU', 'Арлуин манит тебя подойти.'),
(107253, 4, 0, 'ruRU', 'Я... пойду домой. Мне нечего делать среди столь уважаемых особ.'),
(107253, 5, 0, 'ruRU', 'Кстати, я принимаю твою благодарность!');

-- Blood-Thane Lucard (107588) - groups 0,1,2,6 plain text English; group 3 has embedded game
-- markup (icon/spell-link tags) - translated only the surrounding text, kept markup intact.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 107588 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2,3,6);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(107588, 0, 0, 'ruRU', 'Глупец! Ты правда думал, что кусочек дерева меня остановит?!'),
(107588, 1, 0, 'ruRU', 'Ты истечёшь кровью!'),
(107588, 2, 0, 'ruRU', 'Кровь поддерживает меня!'),
(107588, 3, 0, 'ruRU', '|TInterface\\Icons\\ability_ironmaidens_bloodritual:20|t Лукард начинает |cFFFF0404|Hspell:215000|h[Поглощение живых]|h|r! Скорее убейте корсара!'),
(107588, 6, 0, 'ruRU', 'Я... не... повержен...');

-- Queen's Reprisal Sailor (89289) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 89289 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(89289, 0, 0, 'ruRU', 'Королева макрура... демон...'),
(89289, 1, 0, 'ruRU', 'Мы... направлялись в Штормхейм... после Расколотого берега.'),
(89289, 2, 0, 'ruRU', 'Демон... здесь...'),
(89289, 4, 0, 'ruRU', 'Мы держали путь в... Штормхейм.');

-- Runeseer Faljar (93093) - fully English, group1 has embedded game markup kept intact.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 93093 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(93093, 0, 0, 'ruRU', 'Думаешь, сможешь меня остановить? Я повелитель мстительных мертвецов!'),
(93093, 1, 0, 'ruRU', '|TInterface\\Icons\\INV_Misc_Rune_10:20|t Разбейте рунический камень, чтобы прервать |cFFFF0404|Hspell:208544|h[Рунический бастион]|h|r Толкователя рун Фальяра!'),
(93093, 2, 0, 'ruRU', 'Глупо было вмешиваться. Мои армии вечны!'),
(93093, 4, 0, 'ruRU', 'Довольно этого!');

-- Valeera Sanguinar (98102) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 98102 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(98102, 0, 0, 'ruRU', 'Валира соглашается.'),
(98102, 2, 0, 'ruRU', 'Акаари... твой час настал.'),
(98102, 3, 0, 'ruRU', 'Акаари отступила наверх, когда мы прибыли. Она вся твоя.'),
(98102, 4, 0, 'ruRU', 'Вал''зуун, я стану твоей смертью!');

-- Noressa (111318) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 111318 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(111318, 0, 0, 'ruRU', 'Я была так уверена, что он мёртв...'),
(111318, 1, 0, 'ruRU', 'Норесса быстро пробегает глазами письмо.'),
(111318, 2, 0, 'ruRU', 'О, Абсолон...'),
(111318, 3, 0, 'ruRU', 'Спасибо тебе. Я сохраню его слова в своём сердце.');

-- Darkfiend Defiler (93111) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 93111 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(93111, 0, 0, 'ruRU', 'Дай мне взглянуть на твои внутренности!'),
(93111, 0, 1, 'ruRU', 'Хозяин...'),
(93111, 0, 2, 'ruRU', 'Ты опоздал$g:а;... эта земля наша!'),
(93111, 0, 3, 'ruRU', 'Твоя лунная богиня здесь бессильна!');

-- Lalla Brightweave (93524) - groups 1-4 English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 93524 AND `Locale` = 'ruRU' AND `GroupID` IN (1,2,3,4);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(93524, 1, 0, 'ruRU', 'Я только что получила свежую партию рунических кетгутовых нитей, $n. Если у тебя заканчиваются, можешь купить у меня.'),
(93524, 2, 0, 'ruRU', 'О, $n. У меня есть на продажу шипы фей, если нужны для рецепта сумки.'),
(93524, 3, 0, 'ruRU', 'Призыв? Конечно! Где, говоришь, он находится?'),
(93524, 4, 0, 'ruRU', 'Секундочку... вот! Поймала его!');

-- Prince Farondis (106843) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 106843 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(106843, 0, 0, 'ruRU', 'Прошли века с тех пор, как я видел Камень приливов целым, но вот он стоит передо мной.'),
(106843, 1, 0, 'ruRU', 'Я и мой народ в неоплатном долгу перед тобой.'),
(106843, 2, 0, 'ruRU', 'Прошу, возвращайся в Азсуну как можно скорее. Многое ещё предстоит сделать, $n.'),
(106843, 3, 0, 'ruRU', 'Я, как и весь мой народ, обязан$g:а; тебе.');

-- Ruven (110365) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 110365 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(110365, 0, 0, 'ruRU', 'Претендент? Не смеши меня!'),
(110365, 1, 0, 'ruRU', 'Легион дарует нам бесконечную силу!'),
(110365, 2, 0, 'ruRU', 'Таким, как ты, меня не одолеть!'),
(110365, 3, 0, 'ruRU', 'Они... обещали...');

-- Darkfiend Dreadbringer (92789) - groups 1-4 English, same flavor template as Darkfiend Zealot.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92789 AND `Locale` = 'ruRU' AND `GroupID` IN (1,2,3,4);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92789, 1, 0, 'ruRU', 'Добро пожаловать в свой кошмар!'),
(92789, 2, 0, 'ruRU', 'Глупец... эта земля уже обречена...'),
(92789, 3, 0, 'ruRU', 'Жаль. Ты мог бы присоединиться к нам...'),
(92789, 4, 0, 'ruRU', 'Тебе не... сбежать... от своих снов....');

-- Mightstone Rockcaller (100433) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 100433 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(100433, 0, 0, 'ruRU', 'Камень! Повинуйся мне!'),
(100433, 0, 1, 'ruRU', 'Пусть тьма поглотит тебя!'),
(100433, 0, 2, 'ruRU', 'Умри, шан ронир!'),
(100433, 0, 3, 'ruRU', 'Глупый каркун! Посмотрим, как быстро ты умрёшь!');

-- Jandvik Splintershield (100888) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 100888 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(100888, 0, 0, 'ruRU', 'Клянусь клинком!'),
(100888, 1, 0, 'ruRU', 'От твоей руки я встречаю свой конец...'),
(100888, 2, 0, 'ruRU', '$R здесь не рады!'),
(100888, 3, 0, 'ruRU', 'Валькиры, заберите меня!');

-- Syrana Starweaver (101765) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101765 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101765, 0, 0, 'ruRU', 'Вот!'),
(101765, 1, 0, 'ruRU', 'Магия Лотриуса позвала меня. Должно быть, он всё ещё жив! Скорее — помоги нам воссоединиться с остальными.'),
(101765, 2, 0, 'ruRU', 'Мы двинемся, когда путь будет свободен. Твоя храбрость стоит больше, чем ты думаешь, друг.'),
(101765, 3, 0, 'ruRU', 'Это магия помраченных эльфов... но она позвала нас.');

-- Queen's Reprisal Sailor (89290, separate from 89289) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 89290 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(89290, 0, 0, 'ruRU', 'Шторм... сели на мель.'),
(89290, 1, 0, 'ruRU', 'Капитан... захвачен...'),
(89290, 3, 0, 'ruRU', 'Корабль разбился... гиблины атаковали нас.');

-- Azurefall Guardian (99859) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99859 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99859, 0, 0, 'ruRU', 'Я больше не могу это контролировать. Ты должен$g:на; утонуть!'),
(99859, 1, 0, 'ruRU', 'Наконец-то свободен! Покончим с этим злом!'),
(99859, 2, 0, 'ruRU', 'Спасибо тебе, незнакомец. Ярость... порча исчезла. Теперь я должен позаботиться о водах, которые так долго забрасывал.');

-- Duskwatch Defender (102670) - group1 is an empty string in the source (nothing to translate,
-- left alone); groups 3,4 were English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 102670 AND `Locale` = 'ruRU' AND `GroupID` IN (3,4);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(102670, 3, 0, 'ruRU', 'Вам нас не ранить!'),
(102670, 4, 0, 'ruRU', 'За шал''дорай!');

-- High Mage of the Duskwatch (105759) - fully English (groups 1/2 are a literal duplicate line
-- in the source).
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 105759 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(105759, 0, 0, 'ruRU', 'Кто идёт?!'),
(105759, 1, 0, 'ruRU', 'Иллюзия! Что ты скрываешь?'),
(105759, 2, 0, 'ruRU', 'Иллюзия! Что ты скрываешь?'),
(105759, 3, 0, 'ruRU', 'Никто не смеет бросить нам вызов!'),
(105759, 4, 0, 'ruRU', 'Я научу тебя повиноваться господам.');

-- Lady Sylvanas Windrunner (97695) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 97695 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(97695, 0, 0, 'ruRU', 'А, мой верный герой.'),
(97695, 1, 0, 'ruRU', 'Тебе нельзя здесь томиться. Эгида не должна попасть в руки врага!'),
(97695, 2, 0, 'ruRU', 'Будущее Орды зависит от нас с тобой. Найди путь обратно в Штормхейм — я буду ждать.');

-- Legion Endbringer (99762) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99762 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99762, 0, 0, 'ruRU', 'За Легион!'),
(99762, 1, 0, 'ruRU', 'С тобой легко разобраться.'),
(99762, 2, 0, 'ruRU', 'Ты смеешь нападать на нас здесь?!');

-- Lasune Starblade (100884) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 100884 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(100884, 0, 0, 'ruRU', 'О, ты ищешь Джабрула.'),
(100884, 1, 0, 'ruRU', 'Он проходил здесь несколько дней назад. Направился к Жалкой лощине изучать гарпий.'),
(100884, 2, 0, 'ruRU', 'С тех пор я его не видел$g:а;. Надеюсь, он не поддался той же напасти, что и гарпии.');

-- Delandros Shimmermoon (107392) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 107392 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(107392, 0, 0, 'ruRU', 'Версток был у святилища! Узнай, что там происходит. Я присоединюсь к тебе, как только смогу, $n.'),
(107392, 1, 0, 'ruRU', 'Отлично сработано! Атака Легиона отбита!'),
(107392, 2, 0, 'ruRU', 'Что за... Клыки исчезли! Что случилось, $n?');

-- Chronarch Defender (109670) - fully English, same robotic template as Arcane Chronomaton/Sentinel.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 109670 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(109670, 0, 0, 'ruRU', 'Предъявите удостоверение личности. ПОДЧИНИТЕСЬ.'),
(109670, 1, 0, 'ruRU', 'Сканирование тайной сущности...'),
(109670, 2, 0, 'ruRU', 'Ожидайте проверки.');

-- Princess Tess Greymane (94138) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 94138 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(94138, 0, 0, 'ruRU', 'Ванесса…?'),
(94138, 1, 0, 'ruRU', 'Ох, моя голова... Валира, ты в порядке?');

-- Fleet Admiral Tethys (94159) - group0 is a deliberate French flourish (kept untranslated);
-- only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 94159 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(94159, 1, 0, 'ruRU', 'Что-то не то с этим пивом...');

-- Trenchwalker Scavenger (99304) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99304 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99304, 0, 0, 'ruRU', 'Я чту Повелительницу приливов.'),
(99304, 1, 0, 'ruRU', 'Я возвращаюсь в море...');

-- Katarine (99562) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99562 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99562, 0, 0, 'ruRU', 'Вижу, ты не союзник этих наг, $r! Выпусти меня из этой клетки!'),
(99562, 1, 0, 'ruRU', 'Я должна найти ярла Трондира!');

-- Fjolrik (99563) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99563 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99563, 0, 0, 'ruRU', 'Зачем ты меня пнул$g:а;, ты, помесь Фенрира?'),
(99563, 1, 0, 'ruRU', 'Ты не нага! Где Брандольф?');

-- Stokalfr (99564) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99564 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99564, 0, 0, 'ruRU', 'Подойди ближе, если хочешь умереть, нага!'),
(99564, 1, 0, 'ruRU', 'Брандольф жив! Я должен к нему пойти!');

-- Jandvik Runecaller (100889) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 100889 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(100889, 0, 0, 'ruRU', 'Я повергну тебя!'),
(100889, 1, 0, 'ruRU', 'Тебя ждёт суд...');

-- Injured Vrykul (103211) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 103211 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(103211, 0, 0, 'ruRU', 'Вот наш шанс!'),
(103211, 1, 0, 'ruRU', 'Благодарность, незнакомец.');

-- Beastmaster Tagh (103458) - group0 is a deliberate French flourish (kept untranslated); only
-- group3 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 103458 AND `Locale` = 'ruRU' AND `GroupID`=3;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(103458, 3, 0, 'ruRU', 'Нужно поймать их взгляд. В этом секрет хорошей дрессировки!');

-- Mayruna Moonwing (103568) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 103568 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(103568, 0, 0, 'ruRU', 'Готово!'),
(103568, 1, 0, 'ruRU', 'Я сбежала из Валь''шары, когда Изера напала на храм. Мне очень повезло, что по пути мы встретили Митандроса.');

-- Tidemistress Sashj'tar (104359) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 104359 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(104359, 0, 0, 'ruRU', 'Яндвик падёт!'),
(104359, 2, 0, 'ruRU', 'Яндвик падёт!');

-- Deline (107225) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 107225 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(107225, 0, 0, 'ruRU', 'Понятно! Ты и есть тот, кого я ждала. Мне нужна лишь полная лодка, и я отправлюсь в путь.'),
(107225, 1, 0, 'ruRU', 'А! В этой бочке много чародейского вина. Давай, положи её в гондолу.');

-- Afflicted Citizen (107604) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 107604 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(107604, 0, 0, 'ruRU', 'С-скоро, малыш. Скоро, обещаю.'),
(107604, 1, 0, 'ruRU', 'Партия прибыла? Пожалуйста, скажи, что там ещё есть... пожалуйста...');

-- Korine (108063) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 108063 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(108063, 0, 0, 'ruRU', 'Мама!'),
(108063, 1, 0, 'ruRU', 'Они кричали и посадили меня в клетку! Я скучала по тебе...');

-- Gedrah (110799) - group0 is a deliberate French flourish (kept untranslated); only group3
-- was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 110799 AND `Locale` = 'ruRU' AND `GroupID`=3;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(110799, 3, 0, 'ruRU', 'В Запределье было своё очарование. Но когда я услышал об этом поселении, я должен был увидеть его своими глазами.');

-- Duskwatch Executor (111621) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 111621 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(111621, 0, 0, 'ruRU', 'Наша магия сломит тебя!'),
(111621, 1, 0, 'ruRU', 'Нет! Ещё не время...');

-- Archmage Ansirem Runeweaver (90431) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 90431 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(90431, 0, 0, 'ruRU', 'Откуда нам знать, что он снова не предаст Кирин-Тор?'),
(90431, 1, 0, 'ruRU', 'Что ж, я доверяю мудрости совета Карлейна. Я голосую за.');

-- Glaciela Rimebang (92438) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92438 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92438, 0, 0, 'ruRU', 'Тебе нужна моя помощь в кузнице? Хорошо, но у каждой чародейки есть своя цена... и моя цена — конфеты.'),
(92438, 1, 0, 'ruRU', 'Считай, что я уже согласна. Увидимся там!');

-- Mei Francis (92489) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92489 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92489, 0, 0, 'ruRU', 'Нужно подковать твоего скакуна? Посмотрим, подойдут ли эти подковы...'),
(92489, 1, 0, 'ruRU', 'Готово! Береги теперь этого скакуна. Он просто красавец.');

-- Cliffclutch Screecher (98306) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 98306 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(98306, 0, 0, 'ruRU', 'Будь ты проклят$g:а;!'),
(98306, 1, 0, 'ruRU', 'Я разорву тебя в клочья!');

-- Wrathguard Fury (99581) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99581 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99581, 0, 0, 'ruRU', 'Мы — Легион.'),
(99581, 1, 0, 'ruRU', 'Почувствуй мой гнев!');

-- Vineyard Laborer (108931) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 108931 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(108931, 0, 0, 'ruRU', 'Я просто отдыхал. Я-'),
(108931, 1, 0, 'ruRU', 'А-а!');

-- Nightborne Wretch (109409) - fully English, duplicate line at IDs 0,1 of the same group.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 109409 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(109409, 0, 0, 'ruRU', 'Как щедро! Спасибо, я обязан$g:а; тебе жизнью!'),
(109409, 0, 1, 'ruRU', 'Как щедро! Спасибо, я обязан$g:а; тебе жизнью!');

-- Imperial Arcanist (111530) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 111530 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(111530, 0, 0, 'ruRU', 'Ха! Где теперь твои манафаги?!'),
(111530, 1, 0, 'ruRU', 'Что?!');

-- Ley Line Researcher (111871) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 111871 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(111871, 0, 0, 'ruRU', 'Немыслимо...'),
(111871, 1, 0, 'ruRU', 'Тор''терас фалар!');

-- Duskwatch Moonmage (113738) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 113738 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(113738, 0, 0, 'ruRU', 'Иллюзия! Что ты скрываешь?'),
(113738, 1, 0, 'ruRU', 'Умри, чужеземец!');

-- Boss Whalebelly (89050) - only groups 3,4 were English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 89050 AND `Locale` = 'ruRU' AND `GroupID` IN (3,4);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(89050, 3, 0, 'ruRU', 'ЧТО?! Нет...'),
(89050, 4, 0, 'ruRU', 'Я же говорил, что порублю тебя на мелкие кусочки, $p.');

-- Archmage Modera (90418) - group0(ID0) and group1(ID1) were English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 90418 AND `Locale` = 'ruRU' AND ((`GroupID`=0 AND `ID`=0) OR (`GroupID`=1 AND `ID`=1));
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(90418, 0, 0, 'ruRU', 'Кадгар, что случилось? Что произошло?'),
(90418, 1, 1, 'ruRU', 'Что-то укусило тебя за голову? И всё? Хочешь, я поцелую, чтобы зажило?');

-- Archmage Karlain (90463) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 90463 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(90463, 0, 0, 'ruRU', 'Если бы он хотел использовать клинок в своих целях, он бы просто отдал его одному из своих Служителей Солнца.'),
(90463, 1, 0, 'ruRU', 'Действия Этаса выглядят искренними. Я предлагаю удовлетворить его просьбу.');

-- Duskwatch Spellshield (111484, separate from 111485) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 111484 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(111484, 0, 0, 'ruRU', 'Теперь настала эпоха шал''дорай!'),
(111484, 1, 0, 'ruRU', 'Я раздавлю тебя, червь!');

-- Rosaine (111900) - fully English, group3 has a garbled $g token in the source (kept the intent).
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 111900 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(111900, 0, 0, 'ruRU', 'Я последую за тобой. Спасибо, что позволил$g:а; мне сопровождать тебя.'),
(111900, 3, 0, 'ruRU', 'Я последую за тобой. Спасибо, что согласил$g:ась; взять меня с собой.');

-- Duskwatch Adjudicator (113597) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 113597 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(113597, 0, 0, 'ruRU', 'Шал''дорай... избранные...'),
(113597, 1, 0, 'ruRU', 'Почувствуй мощь шал''дорай!');

-- Wrathguard Soulsplitter (113679) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 113679 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(113679, 0, 0, 'ruRU', 'Мы очистим вселенную огнём.'),
(113679, 1, 0, 'ruRU', 'Здесь ты и умрёшь.');

-- Duskwatch Highblade (114474) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 114474 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(114474, 0, 0, 'ruRU', 'Тор''терас фалар!'),
(114474, 1, 0, 'ruRU', 'Не... невозможно.');

-- Withering Suramar Citizen (114549) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 114549 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(114549, 0, 0, 'ruRU', 'Вантир... Вантир!'),
(114549, 1, 0, 'ruRU', 'Разум... ускользает...');

-- Felblade Guardian (117430) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 117430 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(117430, 0, 0, 'ruRU', 'Ты это слышал? Это было где-то здесь!'),
(117430, 1, 0, 'ruRU', 'Ничто не ускользнёт от Легиона.');

-- Gro Rumblehoof (90734) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 90734 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(90734, 0, 0, 'ruRU', 'Ты смеешь бросать мне вызов? Я раздавлю тебя как букашку!'),
(90734, 0, 1, 'ruRU', 'Я убью... тебя... ах!');

-- Slash Gutspill (90747) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 90747 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(90747, 0, 0, 'ruRU', 'Эгида Аграмара принадлежит мне!'),
(90747, 1, 0, 'ruRU', 'Это... это невозможно...');

-- Magula (91130) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91130 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91130, 0, 0, 'ruRU', 'Глупцы! Этот лес скоро погибнет... а вместе с ним и вы!'),
(91130, 1, 0, 'ruRU', 'Негодяи! Скоро... <кашель>... вы последуете за мной в смерть!');

-- Rythas the Oracle (92918) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92918 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92918, 0, 0, 'ruRU', 'Что это? Чужак ищет моего суда?'),
(92918, 1, 0, 'ruRU', 'Дерзкий червь! Ты опозоришь Чертоги Доблести своим присутствием!');

-- Torok Bloodtotem (93836) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 93836 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(93836, 0, 0, 'ruRU', 'Он был мягок с тобой, чужак. Подойди, говори.'),
(93836, 1, 0, 'ruRU', 'У вас там, откуда ты родом, такая слабость сходит за силу, $n?');

-- Mayla Highmountain (93846) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 93846 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(93846, 0, 0, 'ruRU', 'Когда столкнёшься с червями, позови нас, и мы будем рядом.'),
(93846, 1, 0, 'ruRU', 'Подземный король не уйдёт. Не в этот раз.');

-- Risen Assassin (94046) - groups 3/11 are canonical Thalassian rogue battle cries, already
-- confirmed kept untranslated earlier - no new action.

-- Rivermane Shaman (96038) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96038 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96038, 0, 0, 'ruRU', 'Идём, $n. От этой сырости у меня ломит суставы; давай побыстрее.'),
(96038, 1, 0, 'ruRU', 'Встретимся у Речного Поворота, как сможешь, $n. Я буду там ждать — мои старые кости уже не те, что раньше.');

-- Felskorn Torturer (96121) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96121 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96121, 0, 0, 'ruRU', 'Тебе не победить, смертный.'),
(96121, 1, 0, 'ruRU', 'Эта земля будет нашей!');

-- Catriona Macrae (96198) - groups 0,5 English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96198 AND `Locale` = 'ruRU' AND `GroupID` IN (0,5);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96198, 0, 0, 'ruRU', 'Конечно, прошу прощения, но на самом деле это мой камень. Может, не станешь его трогать?'),
(96198, 5, 0, 'ruRU', 'Мой камень? Да, без проблем. Он на столике сбоку.');

-- Archmage Khadgar (91172, separate from 90417) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91172 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91172, 0, 0, 'ruRU', 'Нам везёт, воитель. Защитник, которого ты ищешь, должен появиться здесь с минуты на минуту.'),
(91172, 1, 0, 'ruRU', '$p, у воителя благие намерения — я так думаю. Скорее, за ним — его народ твой лучший шанс на союзника на той горе.');

-- Patricia Egan (92457) - group0(ID0) and group1(ID1) were English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92457 AND `Locale` = 'ruRU' AND ((`GroupID`=0 AND `ID`=0) OR (`GroupID`=1 AND `ID`=1));
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92457, 0, 0, 'ruRU', 'С радостью! Взгляни на мои товары, $n.'),
(92457, 1, 1, 'ruRU', 'Да, да... Мы все знаем, как ты привязан$g:а; к своему алхимическому столу!');

-- Heimir of the Black Fist (92889) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92889 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92889, 0, 0, 'ruRU', 'Пройти по высоким чертогам — величайшая честь для доблестных.'),
(92889, 1, 0, 'ruRU', 'Жаль, что тебе никогда не ступить за эти врата!');

-- High Overlord Saurfang (93773) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 93773 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(93773, 0, 0, 'ruRU', 'Тебя послал Эйтригг? Мне стоит поблагодарить его за заботу, но в ней нет нужды.'),
(93773, 1, 0, 'ruRU', 'Там, скорее всего, ждёт смерть, ты это знаешь. По твоим глазам вижу, что отговорить тебя не удастся — возможно, там и тебе есть что возвращать, свою честь.');

-- Jale Rivermane (94255) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 94255 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(94255, 0, 0, 'ruRU', 'Этот мерзкий Подземный король и его прихвостни заплатят за то, что сделали с МОИМ домом! С МОИМ народом!'),
(94255, 1, 0, 'ruRU', 'Моя... моя деревня. Её больше нет.');

-- Drogbar Wormhook (95013) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 95013 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(95013, 0, 0, 'ruRU', 'С удовольствием тебя выпотрошу!'),
(95013, 1, 0, 'ruRU', 'Дай послушать, как хрустят твои кости!');

-- Stonedark Drogbar (95767) - groups 1,3 English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 95767 AND `Locale` = 'ruRU' AND `GroupID` IN (1,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(95767, 1, 0, 'ruRU', 'С удовольствием тебя выпотрошу!'),
(95767, 3, 0, 'ruRU', 'Мелкий каркун! Тебе здесь не место!');

-- Titan Console (96122, separate from 96139) - fully English, same robotic template.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96122 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96122, 0, 0, 'ruRU', 'Включение устройства архива...'),
(96122, 1, 0, 'ruRU', 'Устройство архива активировано. Запись теперь доступна.');

-- Felskorn Raider (96129) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96129 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96129, 0, 0, 'ruRU', 'Чужак не должен узнать об испытаниях!'),
(96129, 1, 0, 'ruRU', 'Ты недостоин$g:йна; этого места!');

-- Vethir (96465) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96465 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96465, 0, 0, 'ruRU', 'Дрекирьяры нарушили наш древний договор.'),
(96465, 1, 0, 'ruRU', 'Пришло время им ответить за последствия.');

-- Aemara (96778) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96778 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96778, 0, 0, 'ruRU', 'Скажи мне, если понадобится моя помощь, |3-6($c).'),
(96778, 3, 0, 'ruRU', 'Рада встрече!');

-- Debbi Moore (97005) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 97005 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(97005, 0, 0, 'ruRU', 'Рада встрече.'),
(97005, 1, 0, 'ruRU', 'Да, конечно. Вот они, на столе. А что, с ними что-то не так?');

-- Salan Sunthread (97342) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 97342 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(97342, 0, 0, 'ruRU', 'Рад встрече!'),
(97342, 3, 0, 'ruRU', 'Скажи мне, если понадобится моя помощь, |3-6($c).');

-- Warbrave Oro (97553) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 97553 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(97553, 0, 0, 'ruRU', 'Вовремя, защитник. Мы расчистили путь к Даргрулу. Сюда...'),
(97553, 1, 0, 'ruRU', 'А-а-а-а!');

-- Vethir (98190, separate from 96465) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 98190 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(98190, 0, 0, 'ruRU', 'Демонические союзники Короля-бога больше не будут угрожать Штормхейму.'),
(98190, 1, 0, 'ruRU', 'Пришло время преследовать Сковальда в высоких чертогах.');

-- Flotsam (99929) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99929 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99929, 0, 0, 'ruRU', 'Почему я ем так много мурлоков?'),
(99929, 0, 1, 'ruRU', 'Животик слишком урчит...');

-- Feltotem Warmonger (101794) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101794 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101794, 0, 0, 'ruRU', 'Я чую кровь в лесу.'),
(101794, 0, 1, 'ruRU', 'Ты пришёл не туда.');

-- Temple Priestess (105760) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 105760 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(105760, 0, 0, 'ruRU', 'Да, конечно, есть. Немного найдётся вон в том сундуке. Но у нас не так много запасов, так что, пожалуйста, не бери слишком много.'),
(105760, 1, 0, 'ruRU', 'Плетельщица силовых линий из Сурамара проходила здесь не так давно. Думаю, она направилась на восток, к Лесным водопадам.');

-- Emissary Auldbridge (111109) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 111109 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(111109, 0, 0, 'ruRU', 'Добро пожаловать в Даларан! Буду рад помочь тебе во всём, что понадобится.'),
(111109, 2, 0, 'ruRU', 'Мне нужно сообщить Совету о твоих новостях. Удачи, $n!');

-- Gor'lok Fleshgrinder (116721) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 116721 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(116721, 0, 0, 'ruRU', 'Я уничтожу тебя!'),
(116721, 0, 1, 'ruRU', 'Я тебе не по зубам!');

-- Lucian Trias (96782) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96782 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96782, 0, 0, 'ruRU', 'Боюсь, мне нечем поделиться. Вино развязывает языки, но иногда людям просто нечего сказать полезного.'),
(96782, 1, 0, 'ruRU', 'Слушай, не хочешь попробовать влажную азсунийскую фету, раз уж ты здесь? У неё чудесный пикантный вкус!');

-- Skylord Omnuron (98002) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 98002 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(98002, 0, 0, 'ruRU', '$ct расчистил$g:а; нам путь! Теперь — наносим удар! За Азерот!'),
(98002, 1, 0, 'ruRU', '$ct, наши друзья из Кирин-Тора создали один из своих тайных порталов для удобного доступа в Даларан. Если понадобится, найдёшь его на тропе к югу отсюда.');

-- Runeaxe Initiate (98412) - same flavor lines as Bonespeaker Runeaxe.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 98412 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(98412, 1, 0, 'ruRU', 'Я сокрушу твои кости!'),
(98412, 2, 0, 'ruRU', 'Я... не повержен...');

-- Dark Tormentor (120896) - only group0 ID4 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 120896 AND `Locale` = 'ruRU' AND `GroupID`=0 AND `ID`=4;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(120896, 0, 4, 'ruRU', 'Я вижу тебя.');

-- Mythandros Irongrove (103569) - groups 0-4 English; group 5 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 103569 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2,3,4);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(103569, 0, 0, 'ruRU', 'Свежая зелёная пища растёт, и врагов твоих становится меньше. Взамен мы просим лишь твоего благословения.'),
(103569, 1, 0, 'ruRU', 'Что это...?'),
(103569, 2, 0, 'ruRU', 'Надо же, поистине редкий цветок.'),
(103569, 3, 0, 'ruRU', 'Благодарим тебя, благородный Рыжекопыт. Мы принимаем твоё благословение и выражаем нашу признательность.'),
(103569, 4, 0, 'ruRU', 'Этот лунный колодец будет питать и защищать всё вокруг. Теперь мы наконец можем назвать это место своим домом.');

-- Glutonia (107622) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 107622 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(107622, 0, 0, 'ruRU', 'Не забудь продвигать премиум-аккаунт!'),
(107622, 1, 0, 'ruRU', 'Только погляди на это добро... надеюсь, ничего не пропадёт...'),
(107622, 2, 0, 'ruRU', 'Ха! Ты на него не похож$G :а;! Ладно, ну-ка поглядим...'),
(107622, 3, 0, 'ruRU', 'Что ж, у тебя есть его печать. Как она к тебе попала? Ну, похоже, выбора у меня нет.'),
(107622, 4, 0, 'ruRU', 'Передай этому увальню, если он хочет продолжить с того, на чём мы остановились — я тут каждый день, в любой час!'),
(107622, 5, 0, 'ruRU', 'Я тебе скажу, что было нужно Легиону — весь мой жир! Защитные амулеты от Легиона очень дорого стоят!');

-- Lyana Stardust (108492) - groups 2,3,5 English; groups 0,1,4 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 108492 AND `Locale` = 'ruRU' AND `GroupID` IN (2,3,5);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(108492, 2, 0, 'ruRU', 'Я сделаю всё, что в моих силах. Твоя задача — не подпускать демонов ко мне и моему столу.'),
(108492, 3, 0, 'ruRU', 'Я почти закончила. Ещё минута тихой работы — и всё будет готово...'),
(108492, 5, 0, 'ruRU', 'Я творю своё лучшее заклинание.');

-- Okuna Longtusk (89051) - already fully Russian, nothing to do.
-- Thalrenus Rivertree (101083) - already fully Russian, nothing to do.

-- Thalrenus Rivertree (101766, a separate creature entry with its own dialogue set) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101766 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101766, 0, 0, 'ruRU', 'Спасибо за это своевременное отвлечение внимания.'),
(101766, 1, 0, 'ruRU', 'Воспользуюсь случаем, чтобы расставить ловушки для незваных гостей. Уверен, мы ещё встретимся!'),
(101766, 2, 0, 'ruRU', 'Снова встретились! Лотриус и Сирана только что рассказали мне о твоих деяниях.'),
(101766, 3, 0, 'ruRU', 'Они скоро будут здесь. Я могу телепортировать нас в безопасное место.'),
(101766, 4, 0, 'ruRU', 'Ну, поехали!'),
(101766, 5, 0, 'ruRU', 'Я уловил странный сигнал, исходящий из этого места.');

-- Accused Suramar Citizen (108068) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 108068 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(108068, 0, 0, 'ruRU', 'Я не знал$g:а;, что выберусь отсюда живым. Спасибо тебе.'),
(108068, 0, 1, 'ruRU', 'Я не знал$g:а;, что выберусь отсюда живым. Спасибо тебе.'),
(108068, 0, 2, 'ruRU', 'Мне нужно проверить, как там мой муж. Спасибо!'),
(108068, 0, 3, 'ruRU', 'Меня обвинили несправедливо, но меня не стали слушать...'),
(108068, 0, 4, 'ruRU', 'Я $gсвободен:свободна;! Я действительно $gсвободен:свободна;!'),
(108068, 0, 5, 'ruRU', 'Это последний раз, когда я жалуюсь на демонов!');

-- Nightborne Siegecaster (101783) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101783 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101783, 0, 0, 'ruRU', 'Араш-фолас...'),
(101783, 1, 0, 'ruRU', 'Шал''дорай будут править этим миром!'),
(101783, 2, 0, 'ruRU', 'Нам суждено править!'),
(101783, 3, 0, 'ruRU', 'Наша магия сломит тебя!'),
(101783, 4, 0, 'ruRU', 'Да как ты СМЕЕШЬ!!'),
(101783, 5, 0, 'ruRU', 'Мои глаза!');

-- Nightborne Infiltrator (101784) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101784 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101784, 0, 0, 'ruRU', 'Отребье из простонародья!'),
(101784, 1, 0, 'ruRU', 'Никакой пощады чужакам!'),
(101784, 2, 0, 'ruRU', 'Я не могу проиграть простолюдину!'),
(101784, 3, 0, 'ruRU', 'А-а!'),
(101784, 4, 0, 'ruRU', 'Что это за мерзость?!'),
(101784, 5, 0, 'ruRU', 'Что это значит?!');

-- Nomi (101846) - only group 4 was English, rest already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101846 AND `Locale` = 'ruRU' AND `GroupID`=4;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101846, 4, 0, 'ruRU', 'Принеси мне ещё ингредиентов, хозяин $p. Мясо, рыбу, кровь... всё, что сможешь найти там, снаружи, в этом страшном внешнем мире. Я помогу превратить их в изысканные блюда!');

-- Felbringer Xar'thok (117093) - already fully Russian, nothing to do.
-- Bitterbrine Saltcaster (89284) - already fully Russian, nothing to do.
-- Eredar Riftweaver (92450) - already fully Russian, nothing to do.
-- Blacksmith Kyriel (108401) - already fully Russian, nothing to do.

-- Rivermane Tauren (100520) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 100520 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(100520, 0, 0, 'ruRU', 'Дрогбары идут?'),
(100520, 0, 1, 'ruRU', 'Эвакуироваться? Но мы возделывали эту землю поколениями.'),
(100520, 0, 2, 'ruRU', 'Но... это наша земля.'),
(100520, 0, 3, 'ruRU', 'Дрогбары не выходят на поверхность. Они просто так не поступают.'),
(100520, 0, 4, 'ruRU', 'Ха! Дрогбарам не победить. Они просто кучка дикарей.'),
(100520, 0, 5, 'ruRU', 'Что? Подземный король идёт сюда? О нет!');

-- Runas the Shamed (91131, a separate creature entry from 90372) - only group 2 English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91131 AND `Locale` = 'ruRU' AND `GroupID`=2;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91131, 2, 0, 'ruRU', 'Я... я не вижу тебя.');

-- Risen Assassin (94046) - groups 0,2,4,5 English; group 3/11 are canonical WoW Thalassian
-- rogue battle cries, kept untranslated same as in Blizzard's own localization.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 94046 AND `Locale` = 'ruRU' AND `GroupID` IN (0,2,4,5);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(94046, 0, 0, 'ruRU', 'Во имя хозяина!'),
(94046, 2, 0, 'ruRU', 'Тебе не дожить до следующей луны.'),
(94046, 4, 0, 'ruRU', 'Отведай стали.'),
(94046, 5, 0, 'ruRU', 'Никакая преграда не остановит нас.');

-- Reef Lord Raj'his (103575) - groups 0-3 English; group 4 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 103575 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(103575, 0, 0, 'ruRU', 'Сашджтар, в атаку!'),
(103575, 1, 0, 'ruRU', 'Зовущая волны, укрой меня щитом!'),
(103575, 2, 0, 'ruRU', 'Чешуйчатый страж, заморозь их до костей!'),
(103575, 3, 0, 'ruRU', 'Трудитесь усердно, мои наги! Мы уничтожим Яндвик!');

-- Hellish Imp (121031, a separate creature entry from 115620) - group0(ID0) and group1(ID0)
-- English; group0 IDs 1-4 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 121031 AND `Locale` = 'ruRU' AND ((`GroupID`=0 AND `ID`=0) OR `GroupID`=1);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(121031, 0, 0, 'ruRU', 'Вкусное мясо для меня, чтоб кушать.'),
(121031, 1, 0, 'ruRU', 'Я сожгу тебе коленки!');

-- Senegos (89975) - already fully Russian, nothing to do.
-- Taurson (97653) - already fully Russian, nothing to do.

-- Acolyte of Elothir (91153, a separate creature entry from 91149) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91153 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91153, 0, 0, 'ruRU', 'Я снова дышу!'),
(91153, 0, 1, 'ruRU', 'А-ах, снова дышать!'),
(91153, 0, 2, 'ruRU', 'Благословляю тебя, незнакомец!'),
(91153, 0, 3, 'ruRU', 'Я жив$g:а;!'),
(91153, 0, 4, 'ruRU', 'Ты... ты спас$g:ла; меня!');

-- Disturbed Apparition (97729) - groups 0-3 English (fictional elvish phrases in groups 1/2
-- kept untranslated, same convention as elsewhere); group 4 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 97729 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(97729, 0, 0, 'ruRU', 'Теперь я обрету покой.'),
(97729, 1, 0, 'ruRU', 'Наш народ... shu dalees-na.'),
(97729, 2, 0, 'ruRU', 'Thandae-alah...'),
(97729, 3, 0, 'ruRU', 'Осквернитель...');

-- Huln Highmountain (96318) - already fully Russian, nothing to do.

-- Bragund Brightlink (96979) - only group0(ID0) English, rest already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96979 AND `Locale` = 'ruRU' AND `GroupID`=0 AND `ID`=0;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96979, 0, 0, 'ruRU', 'Рад встрече!');

-- Arcanist Valtrois (103155) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 103155 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(103155, 0, 0, 'ruRU', 'Я не растрачу этот дар впустую.'),
(103155, 1, 0, 'ruRU', 'Хм... Главный проводник под городом Сурамар вытягивает в десять раз больше энергии, чем есть у нас здесь.'),
(103155, 2, 0, 'ruRU', 'Если эта силовая линия вспыхнет, теоретически всплеск энергии может дойти до самого Шал''Арана.'),
(103155, 3, 0, 'ruRU', 'Манашторм? Ты в своём уме?'),
(103155, 4, 0, 'ruRU', 'Сейчас же.');

-- First Arcanist Thalyssra (131326, a separate creature from 97140 - Horde epilogue speech) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 131326 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(131326, 0, 0, 'ruRU', 'Когда над нашим городом нависла величайшая тьма, герои Азерота сражались вместе с нами, чтобы изгнать Легион. Некоторые — неохотно.'),
(131326, 1, 1, 'ruRU', 'Но синдорай — эльфы крови — отнеслись к нам с уважением и пониманием. Их родство доказало, что в Азероте есть и другие, кто разделяет наши ценности.'),
(131326, 2, 2, 'ruRU', 'Теперь наш черёд показать силу и честь, которые мы принесём Орде.'),
(131326, 3, 3, 'ruRU', 'Отправляйся в Оргриммар. Присоединись к нашим союзникам и вместе выкуй новое будущее.'),
(131326, 4, 4, 'ruRU', 'Странствуя по дорогам Азерота, рассказывай встречным о гордой истории помраченных эльфов... и покажи им, что мы больше не живём в затворничестве.');

-- Soulkeeper Uriah (97095) - already fully Russian, nothing to do.

-- Granny Marl (92618) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92618 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92618, 0, 0, 'ruRU', 'Используй сигнальный пистолет, чтобы пометить птиц. Это их оглушит, и я успею их прикончить!'),
(92618, 1, 0, 'ruRU', 'Кто-то заказывал яблочко мишени?'),
(92618, 2, 0, 'ruRU', 'Бам! Прямо в клюв!'),
(92618, 3, 0, 'ruRU', 'Этого уложила, как по писаному.'),
(92618, 5, 0, 'ruRU', 'Держу их на мушке!');

-- Sashj'tar Deep Witch (99770) - groups 0-3 English (naga hiss speech); group 4 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99770 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99770, 0, 0, 'ruRU', 'Убитьсс чужака!'),
(99770, 1, 0, 'ruRU', 'Я нарежу тебя на корм угрям!'),
(99770, 2, 0, 'ruRU', 'Вам не остановить Повелительницу приливов-ссс...'),
(99770, 3, 0, 'ruRU', 'Я убью тебя во имя Повелительницы приливов-ссс!');

-- Felsoul Trickster (106375) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 106375 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(106375, 0, 0, 'ruRU', 'Быстро, хватайте их!'),
(106375, 1, 0, 'ruRU', 'На помощь! Тут плохиши!'),
(106375, 2, 0, 'ruRU', 'Хм... средней прожарки или полностью?'),
(106375, 3, 0, 'ruRU', 'Вкусное мясо для меня, чтоб кушать.'),
(106375, 4, 0, 'ruRU', 'Эй! Тебе тут не место.');

-- Overseer Durant (107333) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 107333 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(107333, 0, 0, 'ruRU', 'Незваный гость! Познай мой клинок!'),
(107333, 1, 0, 'ruRU', 'Она сама решила свою судьбу, как и ты решил$g:а; свою!'),
(107333, 2, 0, 'ruRU', 'Тебе меня не одолеть!'),
(107333, 3, 0, 'ruRU', 'Элисанда снимет за это ваши головы!'),
(107333, 4, 0, 'ruRU', 'П-предатели...');

-- Verene (107712) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 107712 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(107712, 0, 0, 'ruRU', 'Ох, куда же она могла подеваться...'),
(107712, 1, 0, 'ruRU', 'Как думаешь, может Корина сейчас с другими детьми?'),
(107712, 2, 0, 'ruRU', 'О, моя милая девочка! Ты не ранена? Они тебя не обижали?'),
(107712, 3, 0, 'ruRU', 'Теперь ты дома. Слава богам.'),
(107712, 4, 0, 'ruRU', 'Спасибо -тебе-. Не могу выразить, как я благодарна.');

-- Alard Schmied (92183) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92183 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92183, 0, 0, 'ruRU', 'Так, посмотрим, что можно сделать с этой рудой. Для начала — нагреем руду.'),
(92183, 1, 0, 'ruRU', 'Теперь посмотрим, что из неё можно сделать.'),
(92183, 2, 0, 'ruRU', 'А теперь простой шаг — нанесение флюса. Подойди ближе и смотри внимательно за моей техникой.'),
(92183, 3, 0, 'ruRU', 'Ты знаешь, что делать, кузнец: закаляй, нагревай, куй и свари. Можешь пользоваться любым инструментом в мастерской.'),
(92183, 4, 0, 'ruRU', 'Поищи мага льда, который сможет нам помочь, $n. Если мы достаточно охладим закалочный жёлоб, то сможем применить эту технику силовой ковки.');

-- Nicholo Swiftfuse (97748) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 97748 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(97748, 0, 0, 'ruRU', 'Просто будь готов$g:а; на случай, если что-то пойдёт не так, $n.'),
(97748, 1, 0, 'ruRU', 'Фух, это намного сложнее, чем кажется.'),
(97748, 2, 0, 'ruRU', 'Пока что всё выглядит неплохо. Не останавливайся, $n.'),
(97748, 3, 0, 'ruRU', 'Я почти закончил, честное слово.'),
(97748, 4, 0, 'ruRU', 'Успех! У нас получилось, $n!');

-- Emmarel Shadewarden (102578) - group 0 is a deliberate French flourish (kept untranslated,
-- same convention as Lord Jorach Ravenholdt); rest already Russian - nothing to do.

-- Mardranel Forestheart (103570) - groups 0-3 English; group 4 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 103570 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(103570, 0, 0, 'ruRU', 'Благодарю тебя.'),
(103570, 1, 0, 'ruRU', 'Встретимся на той стороне.'),
(103570, 2, 0, 'ruRU', 'Твои котята в безопасности, Йаулон. Даруешь ли ты нам своё благословение, чтобы мы могли делить эту землю с тобой?'),
(103570, 3, 0, 'ruRU', 'Благодарю, ваше высочество.');

-- Swamprock Tadpole (98046) - already fully Russian (frog gibberish), nothing to do.

-- Captured Vrykul (99825) - group0(ID0,2)/group1/group2 English; group0(ID1) already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99825 AND `Locale` = 'ruRU' AND ((`GroupID`=0 AND `ID` IN (0,2)) OR `GroupID` IN (1,2));
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99825, 0, 0, 'ruRU', 'Они собирались меня съесть!'),
(99825, 0, 2, 'ruRU', 'Они хотели меня съесть!'),
(99825, 1, 0, 'ruRU', 'Ненавижу море!'),
(99825, 2, 0, 'ruRU', 'Благодарность, незнакомец.');

-- Empyrean Conjuror (106356) - "Abra Cadabra!" (group1 ID0) is a real-world magic-word flourish,
-- kept untranslated same as other non-fictional-language flavor lines; rest already Russian.

-- Empyrean Disciple (106514) - already fully Russian, nothing to do.
-- Drugon the Frostblood (110378) - already fully Russian, nothing to do.

-- Solendra Featherdown (103571) - groups 0-3 English; group 4 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 103571 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(103571, 0, 0, 'ruRU', 'Наши усилия не были напрасны. Матриарх Лунного Шёпота наблюдает издалека.'),
(103571, 1, 0, 'ruRU', 'Я доставлю благословение Митандросу лично. Увидимся там!'),
(103571, 2, 0, 'ruRU', 'Пусть твоя охота всегда будет удачной, сестра.'),
(103571, 3, 0, 'ruRU', 'Спасибо!');

-- Several already-fully-Russian entries, nothing to do: Yart'alas Nightwatcher (88782), Yotnar
-- (96175), Shandy Glossgleam (96967), Emmarel Shadewarden (102574, separate from 102578),
-- Amateur Hunter (96591).

-- Felsoul Captive (102442) - only group0(ID1) was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 102442 AND `Locale` = 'ruRU' AND `GroupID`=0 AND `ID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(102442, 0, 1, 'ruRU', 'Я свободен! Я свободен!');

-- Orik Trueheart (105689) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 105689 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(105689, 0, 0, 'ruRU', 'С тех пор как пал Король-лич, я провёл немало времени в окрестностях Ульдуара, изучая Тира. Он был единственным хранителем-титаном, который сражался с Локеном во время его предательства.'),
(105689, 1, 0, 'ruRU', 'Я нашёл сагу врайкулов, описывающую могучий щит, который Тир выковал для своего защитника-врайкула, чтобы тот носил его в бой.'),
(105689, 2, 0, 'ruRU', 'Ага, на это я и надеюсь. С твоей помощью у нас есть шанс отыскать этот артефакт.'),
(105689, 3, 0, 'ruRU', 'В башне посреди Даларана есть портал в Храм Крыла Смерти. Он довезёт тебя почти до самого места. Ещё раз спасибо, что помогаешь нам, паладинам.');

-- Drowned Priest (105750) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 105750 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(105750, 1, 0, 'ruRU', 'Твой труп — ещё один дар для Хелии!');

-- Already fully Russian, nothing to do: Nyandra Springbloom (91651), Amisi Azuregaze (96806).

-- Spiritwalker Ebonhorn (96164) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96164 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96164, 0, 0, 'ruRU', 'Тропа Хална повторяет путь последней и величайшей охоты Хална.'),
(96164, 1, 0, 'ruRU', 'Предупреждаю, путь впереди довольно опасен. Я могу дать тебе лишь наставление и исцеление. Не более.'),
(96164, 2, 0, 'ruRU', 'Для Хална Война древних не закончилась у Колодца Вечности. После разгрома Легиона он сосредоточился на чудовище, которому удалось сбежать.'),
(96164, 3, 0, 'ruRU', 'Добро пожаловать, друзья мои, в Хранилище Нелтариона. Или, как его узнал весь мир — Смертокрыла.');

-- Yotnar (96257, separate creature entry from 96175) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96257 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96257, 0, 0, 'ruRU', 'Сегодня ты проявил$g:а; истинную доблесть, и за это я одарю тебя благом.'),
(96257, 1, 0, 'ruRU', 'Подними своё оружие, чужеземец, и прими дар титанов!'),
(96257, 2, 0, 'ruRU', 'Свершилось. Пусть наша сила поможет тебе в час наибольшей нужды.'),
(96257, 3, 0, 'ruRU', 'Ступай вперёд, защитник хранилища!');

-- 7th Legion Dragoon (90948) - already fully Russian, nothing to do.

-- Imindril Spearsong (92184) - only group1(ID3) was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92184 AND `Locale` = 'ruRU' AND `GroupID`=1 AND `ID`=3;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92184, 1, 3, 'ruRU', 'Я хочу отдать своё платье Шанди. Оно всё перепачкано сажей.');

-- Oakin Ironbull (95256) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 95256 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(95256, 0, 0, 'ruRU', 'Идём, $n.'),
(95256, 1, 0, 'ruRU', 'Где Торок?'),
(95256, 2, 0, 'ruRU', 'Встретимся в пещере внизу, $n. Они захотят увидеть труп гарпии, которую ты убил$g:а;.'),
(95256, 3, 0, 'ruRU', '$n здесь, чтобы встретиться с Тороком. $GОн:Она; убил$G:а; Ведьму леса.');

-- Titan Console (96139) - groups 0,1,2,4 English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96139 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2,4);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96139, 0, 0, 'ruRU', 'Заряд устройства архива — 50 процентов...'),
(96139, 1, 0, 'ruRU', 'Включение устройства архива...'),
(96139, 2, 0, 'ruRU', 'Заряд устройства архива — 75 процентов...'),
(96139, 4, 0, 'ruRU', 'Устройство архива активировано. Запись теперь доступна.');

-- Commander Kel'tariss (102844) - groups 0,1 English (naga hiss); groups 2,3 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 102844 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(102844, 0, 0, 'ruRU', 'Что это-сс?'),
(102844, 1, 0, 'ruRU', 'Моя смерть ничего не остановит-сс...');

-- Druid of the Claw (91043) - group0 IDs1,3 English; IDs0,2 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91043 AND `Locale` = 'ruRU' AND `GroupID`=0 AND `ID` IN (1,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91043, 0, 1, 'ruRU', 'Я почувствовал присутствие некой тёмной силы в Изумрудном Сне.'),
(91043, 0, 3, 'ruRU', 'Я не сплю, я не сплю...');

-- Morphael (91045) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91045 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91045, 0, 0, 'ruRU', 'Мы больше не пленники друидов. Скоро ваш мир станет нашим!'),
(91045, 1, 0, 'ruRU', 'Ты опоздал$g:а;! План хозяина уже приведён в действие.'),
(91045, 2, 0, 'ruRU', 'Да, да! Я буду питаться твоим страхом и обращу его в живой кошмар!'),
(91045, 3, 0, 'ruRU', 'Это лишь... начало.');

-- Sella Waterwise (96084) - only group3 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96084 AND `Locale` = 'ruRU' AND `GroupID`=3;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96084, 3, 0, 'ruRU', 'Мама!');

-- Empyrean Astrologer (106516) - only group2 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 106516 AND `Locale` = 'ruRU' AND `GroupID`=2;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(106516, 2, 0, 'ruRU', 'Ты совершенствуешься. Продолжай тренироваться.');

-- Already fully Russian, nothing to do: Marius Felbane (91095), Malfurion Stormrage (91109),
-- Cukkaw (107498).

-- Stoneblood Ravager (91121) - groups 2,3 English; groups 0,1 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91121 AND `Locale` = 'ruRU' AND `GroupID` IN (2,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91121, 2, 0, 'ruRU', 'Эта земля... теперь... наша...'),
(91121, 3, 0, 'ruRU', 'Плоть и кость — в землю и камень!');

-- Acolyte of Elothir (91150, a third separate entry alongside 91149/91153) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91150 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91150, 0, 0, 'ruRU', 'Я чувствовал$g:а;, как жизнь покидает меня...'),
(91150, 0, 1, 'ruRU', 'А-ах, снова дышать!'),
(91150, 0, 2, 'ruRU', 'Благословляю тебя, незнакомец!'),
(91150, 0, 3, 'ruRU', 'Я жив$g:а;!');

-- Sashj'tar Stormcaller (99075) - fully English, naga hiss speech.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99075 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99075, 0, 0, 'ruRU', 'Сашджтар захлестнут Яндвик, точно прилив — берег-сс.'),
(99075, 1, 0, 'ruRU', 'Я убью тебя-сс.'),
(99075, 2, 0, 'ruRU', 'Яндвик падёт перед Сашджтар.'),
(99075, 3, 0, 'ruRU', 'Сашджтар не берут пленных.');

-- Nightborne Child (106617) - groups 0,1,2 English; group 3 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 106617 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(106617, 0, 0, 'ruRU', 'Снаружи ждёт погибель.'),
(106617, 1, 0, 'ruRU', 'Хоровод вокруг города...'),
(106617, 2, 0, 'ruRU', 'Нечестно, мне никогда не достаётся роль верховной магистры!');

-- Shal'dorei Civilian (107603) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 107603 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(107603, 0, 0, 'ruRU', 'Я умираю с голоду!'),
(107603, 1, 0, 'ruRU', 'Я шал''дорай! Мне нельзя отказать!'),
(107603, 2, 0, 'ruRU', 'Моя дочь умирает! Прошу, помоги мне её спасти!'),
(107603, 3, 0, 'ruRU', 'Пожалуйста, помоги мне... пожалуйста...');

-- Chief Telemancer Oculeth (98548) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 98548 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(98548, 0, 0, 'ruRU', 'Я телепортирую тебя за основные защитные рубежи. Когда будешь готов$g:а; уйти, активируй этот маяк, чтобы я мог тебя найти и вернуть обратно.'),
(98548, 1, 0, 'ruRU', 'А теперь важный момент — как только манашторм начнётся, помех будет слишком много, чтобы я смог кого-либо телепортировать. Тебе нужно выбраться до начала шторма!'),
(98548, 2, 0, 'ruRU', 'Так, все соберитесь поближе. Не стесняйтесь. Общие объятия.'),
(98548, 3, 0, 'ruRU', 'А-ах, спасибо тебе.');

-- Cliffclutch Matriarch (99593) - groups 0,1 English; groups 2,4 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99593 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99593, 0, 0, 'ruRU', 'Ты заплатишь за нападение на моих дочерей!'),
(99593, 1, 0, 'ruRU', 'Сперва пещерные жители, теперь это...');

-- Coryn (110354) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 110354 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(110354, 0, 0, 'ruRU', 'Я вырву свой титул из бездыханных рук твоего защитника, Ли''лет!'),
(110354, 1, 0, 'ruRU', 'Тебе со мной не сравниться! Я лучше тебя!'),
(110354, 2, 0, 'ruRU', 'Я получу то, что мне причитается!'),
(110354, 3, 0, 'ruRU', 'Меня... подставили...');

-- Duskwatch Spellshield (111485) - groups 0,2,3 English; group 1 ("Anath'ashar!") is the same
-- fictional Shal'dorei phrase kept untranslated elsewhere.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 111485 AND `Locale` = 'ruRU' AND `GroupID` IN (0,2,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(111485, 0, 0, 'ruRU', 'Отребье из простонародья!'),
(111485, 2, 0, 'ruRU', 'Умри, чужеземец!'),
(111485, 3, 0, 'ruRU', 'Почувствуй мощь шал''дорай!');

-- Drekirjar Galeborn (91205) - group0 IDs2,3 English; IDs0,1 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91205 AND `Locale` = 'ruRU' AND `GroupID`=0 AND `ID` IN (2,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91205, 0, 2, 'ruRU', 'Ты уже проиграл$g:а;. Торигниры сломлены!'),
(91205, 0, 3, 'ruRU', 'Ты не достоин$g:йна; силы торигниров!');

-- Thistleleaf Ruffian (91474) - groups 3,4 English; groups 1,2 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91474 AND `Locale` = 'ruRU' AND `GroupID` IN (3,4);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91474, 3, 0, 'ruRU', 'Я... приземляюсь...'),
(91474, 4, 0, 'ruRU', 'Я просто хотел... развлечься...');

-- Sashj'tar Overseer (102685) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 102685 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(102685, 0, 0, 'ruRU', 'Я тебя раздавлю!'),
(102685, 1, 0, 'ruRU', 'Мелкий вредитель.'),
(102685, 2, 0, 'ruRU', 'Мелкий слабак...'),
(102685, 3, 0, 'ruRU', 'Сашджтар выживут...');

-- Duskwatch Warpcaster (109652) - already fully Russian, nothing to do.

-- Cliffclutch Thornwitch (113573) - only group0 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 113573 AND `Locale` = 'ruRU' AND `GroupID`=0;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(113573, 0, 0, 'ruRU', 'Граук... Мать до тебя доберётся...');

-- Nightborne Child (106616, separate from 106617) - groups 0,1,2 English; group 3 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 106616 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(106616, 0, 0, 'ruRU', 'Сердца полны жалости...'),
(106616, 1, 0, 'ruRU', 'Бах! Трах!'),
(106616, 2, 0, 'ruRU', 'Бах! Трах!');

-- Stellagosa (107995) - groups 1,2,3 English; group 0 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 107995 AND `Locale` = 'ruRU' AND `GroupID` IN (1,2,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(107995, 1, 0, 'ruRU', 'Ещё не поздно. Мы просто перескочим через горы, чтобы отрезать им путь, и...'),
(107995, 2, 0, 'ruRU', 'Нет, нет... они повсюду!'),
(107995, 3, 0, 'ruRU', 'Держись, $n. Идём на бреющем.');

-- Vineyard Warden (108871) - groups 0,1,2 English; group 3 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 108871 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,2);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(108871, 0, 0, 'ruRU', 'Я разделаюсь с тобой, простолюдин$g:ка;!'),
(108871, 1, 0, 'ruRU', 'Шал''дорай... избранные...'),
(108871, 2, 0, 'ruRU', 'Шал''дорай будут править!');

-- Already fully Russian, nothing to do: Elya Azuremoon (88859), Prince Oceanus (89101),
-- Shipwrecked Captive (89104).

-- Greywatch Saboteur (94614) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 94614 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(94614, 1, 0, 'ruRU', 'Я разорву тебя на куски!');

-- Nightborne Enforcer (101825) - only group0 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101825 AND `Locale` = 'ruRU' AND `GroupID`=0;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101825, 0, 0, 'ruRU', 'Почувствуй мощь шал''дорай!');

-- Questioner Arev'naal (89673) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 89673 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(89673, 1, 0, 'ruRU', 'Я тебе ничего не скажу, Пожиратель душ!');

-- Already fully Russian, nothing to do: Hatecoil Slavemaster (90109), Dread-Rider Stalker (94338).

-- Crawliac Skywitch (94983) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 94983 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(94983, 0, 0, 'ruRU', 'У меня для тебя новое заклинание.'),
(94983, 0, 1, 'ruRU', 'Я сотворю такие чудесные заклинания из твоих костей.'),
(94983, 0, 2, 'ruRU', 'Небеса принадлежат кроулиакам!');

-- Already fully Russian, nothing to do: Nathanos Blightcaller (91158), Greywatch Infiltrator (94825).

-- Lyrea Windfeather (101767) - groups 0,1,3 English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101767 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1,3);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101767, 0, 0, 'ruRU', 'Я не успела вовремя...'),
(101767, 1, 0, 'ruRU', 'Не возвращайся за нами. Предательство помраченных эльфов уже обрекло нас.'),
(101767, 3, 0, 'ruRU', 'У меня не было времени...');

-- Felsoul Inquisitor (101878) - only group0 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101878 AND `Locale` = 'ruRU' AND `GroupID`=0;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101878, 0, 0, 'ruRU', 'Тебе от меня не скрыться.');

-- Selthaes Starsong (102365) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 102365 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(102365, 0, 0, 'ruRU', 'Твоего друга-человека забрали демоны. Дай мне свободу, и я расскажу, куда его увели!'),
(102365, 1, 0, 'ruRU', 'Твоего друга отвели в ямы охотников Скверны под великим флагманом Пылающего Легиона.'),
(102365, 2, 0, 'ruRU', 'Увы, для него, скорее всего, уже слишком поздно... не отдавайте глупо свои жизни за мертвеца!');

-- Already fully Russian, nothing to do: Captive Rivermane (95080), Rensar Greathoof (101195),
-- Rok'nash (103183).

-- Drogbar Manathirster (95866) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 95866 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(95866, 0, 0, 'ruRU', 'Мы — тьма под горой!'),
(95866, 1, 0, 'ruRU', 'Твоя кровь отлично подойдёт...'),
(95866, 2, 0, 'ruRU', 'Глупый каркун! Посмотрим, как быстро ты умрёшь!');

-- Darkfiend Tormentor (91044) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91044 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91044, 1, 0, 'ruRU', 'Я отправлю тебя в вечный сон.');

-- Black Rook Spectral Officer (95247) - only group2 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 95247 AND `Locale` = 'ruRU' AND `GroupID`=2;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(95247, 2, 0, 'ruRU', 'Я не предам своего господина!');

-- Felguard Shocktrooper (101943) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 101943 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(101943, 1, 0, 'ruRU', 'Я изрублю тебя на куски!');

-- Siren Naz'jul (102796) - only group0 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 102796 AND `Locale` = 'ruRU' AND `GroupID`=0;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(102796, 0, 0, 'ruRU', 'Владычица приливов... Я тебя подвела...');

-- Galius Miremoore (104865) - already fully Russian, nothing to do.

-- Perrexx (95318) - only group4 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 95318 AND `Locale` = 'ruRU' AND `GroupID`=4;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(95318, 4, 0, 'ruRU', 'Я ухожу во тьму...');

-- Sashj'tar Myrmidon (100998) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 100998 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(100998, 1, 0, 'ruRU', 'Я тебя раздавлю!');

-- Wormtalon Matriarch (104646) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 104646 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(104646, 0, 0, 'ruRU', 'Дар для Матери-ведьмы!'),
(104646, 1, 0, 'ruRU', 'Никто не выживет!'),
(104646, 2, 0, 'ruRU', 'Сёстры! Отомстите за меня...');

-- Moonclaw Druid (95617) - already fully Russian, nothing to do.

-- Timofey Oshenko (92194) - groups 0,1 English; group 3 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92194 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92194, 0, 0, 'ruRU', 'Дешифратор данных 3000 возможно сможет расшифровать это ядро. Скрести пальцы, чтобы оно не взорвалось в процессе.'),
(92194, 1, 0, 'ruRU', 'Это ядро содержит текст на древнем диалекте высокорожденных, который я прочитать не могу. Профессор Паллин в Святилище писцов, возможно, сумеет его перевести.');

-- Thaon Moonclaw (95399) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 95399 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(95399, 0, 0, 'ruRU', 'Кошмар поглотит тебя!'),
(95399, 1, 0, 'ruRU', 'Жалкое создание! Это проклятие сделало меня сильнее древних!'),
(95399, 6, 0, 'ruRU', 'Никто не устоит перед Повелителем Кошмара!');

-- Nightborne Steward (105372) - only group1 was English; group3 ("Anath'ashar!") is the same
-- fictional phrase kept untranslated elsewhere.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 105372 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(105372, 1, 0, 'ruRU', 'Я научу тебя повиноваться господам.');

-- Barm Stonebreaker (92242) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92242 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92242, 0, 0, 'ruRU', 'Ответственный кузнец не разбрасывается материалом. Можешь использовать любой металлолом, который найдёшь в нашем лагере.'),
(92242, 1, 1, 'ruRU', 'Эй, вы там! Если нужна быстрая встряска — налетай на Снадобье Речной Гривы!'),
(92242, 2, 2, 'ruRU', 'Тыквенную грядку найдёшь в лагере клана Речной Гривы. Выбирай самые спелые — для сока.');

-- Muirn Ironhorn (92243) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92243 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92243, 0, 0, 'ruRU', 'Это всё, на что ты способен? Придётся постараться получше. Так дело не пойдёт.'),
(92243, 1, 0, 'ruRU', 'Давай, кузнец! УДАР! БЕЙ ЧТО ЕСТЬ СИЛЫ!'),
(92243, 2, 0, 'ruRU', 'А теперь ударь по раскалённому металлу молотом изо всех сил, $p.');

-- God-King Skovald (92307) - already fully Russian, nothing to do.

-- Baelbug (100595) - groups 0,1 English; group 3 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 100595 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(100595, 0, 0, 'ruRU', 'Прочь, грязный $c! Бельбуг нашёл клинок и Бельбуг его оставит!'),
(100595, 1, 0, 'ruRU', 'Ты не забирать боевой клинок!');

-- Wormtalon Huntress (95152) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 95152 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(95152, 1, 0, 'ruRU', 'Я разорву тебя в клочья!');

-- Skywhisker Loyalist (95277) - only group4 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 95277 AND `Locale` = 'ruRU' AND `GroupID`=4;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(95277, 4, 0, 'ruRU', '%s в панике пытается сбежать!');

-- Calder (102738) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 102738 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(102738, 0, 0, 'ruRU', 'Побеждён... таким слабаком... как ты...'),
(102738, 2, 0, 'ruRU', 'Я повержен... так ничтожно...'),
(102738, 3, 0, 'ruRU', 'Яндвик — наша земля! Никто тебя сюда не звал!');

-- Eynar (102739) - groups 0,1 English; group 2 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 102739 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(102739, 0, 0, 'ruRU', 'Жалкий чужак бросает мне вызов?'),
(102739, 1, 0, 'ruRU', 'Мы ещё встретимся... в Хельхейме...');

-- Commander Raz'jira (102840) - fully English, naga hiss speech.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 102840 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(102840, 0, 0, 'ruRU', 'У нас незваные гости-сс.'),
(102840, 1, 0, 'ruRU', 'Яндвик будет нашшш...'),
(102840, 2, 0, 'ruRU', 'Яндвик станет нашим-шш...');

-- Redhoof the Ancient (103546) - groups 0,1 English; group 3 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 103546 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(103546, 0, 0, 'ruRU', 'Краснокопыт осторожно взрыхляет почву копытом.'),
(103546, 1, 0, 'ruRU', 'Краснокопыт выжидающе смотрит на Митандроса.');

-- Mayor Heathrow (92619) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92619 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92619, 0, 0, 'ruRU', 'Пенелопа? Слава богам, ты цела! Я так волновался!'),
(92619, 1, 0, 'ruRU', 'Лорд Песнь Теней, я ошибался насчёт вас. Все, опустите оружие!'),
(92619, 2, 0, 'ruRU', '$n, спасибо, что нашёл$g:а; мою дочь. Прошу, тебе здесь всегда рады.');

-- Darkfiend Dreamtwister (92788) - groups 1,2,4 English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92788 AND `Locale` = 'ruRU' AND `GroupID` IN (1,2,4);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92788, 1, 0, 'ruRU', 'Эта земля будет поглощена!'),
(92788, 2, 0, 'ruRU', 'Глупец... эта земля уже обречена...'),
(92788, 4, 0, 'ruRU', 'Ты пока не видишь, но увидишь.');

-- Archmage Celindra (96786) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 96786 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(96786, 0, 0, 'ruRU', 'Я не вспоминала об этом с тех пор... ну, с тех пор как старый друг спрашивал об этом незадолго до того, как покинул этот мир.'),
(96786, 1, 0, 'ruRU', 'После смерти Антонидаса я решила спрятать диск. Не было смысла продолжать исследования.'),
(96786, 2, 0, 'ruRU', 'Но если ты думаешь, что сможешь закончить то, что начал Антонидас, — он твой. Удачи тебе с ним, архимаг $n.');

-- Duskwatch Moonscythe (106654) - only group3 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 106654 AND `Locale` = 'ruRU' AND `GroupID`=3;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(106654, 3, 0, 'ruRU', 'Я раздавлю тебя, червь!');

-- Commander Jarod Shadowsong (92842) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92842 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92842, 0, 0, 'ruRU', 'Всё именно так, как я и опасался. Останки лорда Гребня Ворона исчезли.'),
(92842, 1, 0, 'ruRU', 'Лорд Гребень Ворона погиб много лет назад, но я всегда буду чтить его как своего наставника.'),
(92842, 2, 0, 'ruRU', 'Я разберусь со стражей внутри тюрьмы. Возьми ключи и встреть меня у камер.');

-- Lyrathos Darkgrove (92877) - only group3 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 92877 AND `Locale` = 'ruRU' AND `GroupID`=3;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(92877, 3, 0, 'ruRU', 'Я распространю Кошмар по каждому холму и долу!');

-- Helmouth Cursewalker (105525) - only group4 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 105525 AND `Locale` = 'ruRU' AND `GroupID`=4;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(105525, 4, 0, 'ruRU', 'Я поднесу твой труп Хелии!');

-- Already fully Russian, nothing to do: Imperial Arcbinder (108188), Vengeful Soul (107628).

-- Helmouth Soulflayer (105526) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 105526 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(105526, 1, 0, 'ruRU', 'Я поднесу твой труп Хелии!');

-- Vanthir (107598) - groups 0,1 English; group 3 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 107598 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(107598, 0, 0, 'ruRU', 'Разумеется. Согласен, всё это дело... неприятно. И всё же, то влияние, которое у тебя будет...'),
(107598, 1, 0, 'ruRU', 'Это немного, но, пожалуйста, прими это.');

-- Burning Chaplain (107717) - already fully Russian, nothing to do.

-- Sister of the Moon (108600) - only group0(ID1) was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 108600 AND `Locale` = 'ruRU' AND `GroupID`=0 AND `ID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(108600, 0, 1, 'ruRU', 'Я... я спасена!');

-- Eneas (108807) - groups 0,1 English; group 3 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 108807 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(108807, 0, 0, 'ruRU', 'Выпей, дорогая. Тебе станет легче.'),
(108807, 1, 0, 'ruRU', 'Мы доживём до завтра. Вантир всегда о нас заботится. Ты же знаешь.');

-- Audric (108811) - groups 0,1 English; group 3 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 108811 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(108811, 0, 0, 'ruRU', 'Это Чародейское вино. Для тебя. Давай, брат.'),
(108811, 1, 0, 'ruRU', 'Ха! Не торопись! Ещё подавишься.');

-- Bonespeaker Runeaxe (93066) - groups 1,2 English; group 4 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 93066 AND `Locale` = 'ruRU' AND `GroupID` IN (1,2);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(93066, 1, 0, 'ruRU', 'Я сокрушу твои кости!'),
(93066, 2, 0, 'ruRU', 'Я... не повержен...');

-- Bonespeaker Carver (93070) - already fully Russian, nothing to do.

-- Bonespeaker Mystic (93071) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 93071 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(93071, 1, 0, 'ruRU', 'Я повелеваю божественной силой!');

-- Greywatch Saboteur (109635, separate from 94614) - only group3 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 109635 AND `Locale` = 'ruRU' AND `GroupID`=3;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(109635, 3, 0, 'ruRU', 'Я разорву тебя на куски!');

-- Imperial Arcbinder (109647, separate from 108188) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 109647 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(109647, 1, 0, 'ruRU', 'Я раздавлю тебя, червь!');

-- Magister Phaedris (109954) - groups 0,1 English; group 4 already Russian.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 109954 AND `Locale` = 'ruRU' AND `GroupID` IN (0,1);
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(109954, 0, 0, 'ruRU', 'Мои иллюзии станут твоим концом!'),
(109954, 1, 0, 'ruRU', 'Иллюзия... разрушена.');

-- Duskwatch Warpcaster (111523) - only group0 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 111523 AND `Locale` = 'ruRU' AND `GroupID`=0;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(111523, 0, 0, 'ruRU', 'Что-то здесь не так...');

-- Arcane Chronomaton (111622) - fully English, robotic speech.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 111622 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(111622, 0, 0, 'ruRU', 'Предъявите удостоверение личности. ПОДЧИНИТЕСЬ.'),
(111622, 0, 1, 'ruRU', 'СТОЙ. Требуется проверка.'),
(111622, 0, 2, 'ruRU', 'Сканирование тайной сущности...');

-- Lasan Skyhorn (98773) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 98773 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(98773, 0, 0, 'ruRU', 'Хорошо! Я не любитель церемоний, так что покончим с этим.'),
(98773, 1, 0, 'ruRU', 'Да будет известно: я, Ласан Крылорог, вождь племени Крылорогов, вновь заявляю о своей верности Вершине.'),
(98773, 2, 0, 'ruRU', 'Вместе мы — Вершина.');

-- Dargrul (99460) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99460 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99460, 1, 0, 'ruRU', 'Я переоценил тебя...');

-- Kozak the Afflictor (99485) - only group0 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99485 AND `Locale` = 'ruRU' AND `GroupID`=0;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99485, 0, 0, 'ruRU', 'Этот мир... сгорит...');

-- Loyalist Sycophant (111489) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 111489 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(111489, 0, 0, 'ruRU', 'Твоя смерть предопределена!'),
(111489, 1, 0, 'ruRU', 'Твоя звезда угасает!'),
(111489, 2, 0, 'ruRU', 'Мы... потерпели неудачу.');

-- Duskwatch Orbitist (114468) - already fully Russian, nothing to do.

-- Navarrogg (99619) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99619 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99619, 0, 0, 'ruRU', 'Я нервничаю перед входом в это место. Лучше поторопиться, пока они не передумали насчёт безопасного прохода.'),
(99619, 1, 0, 'ruRU', 'Я, Наваррогг, предводитель дрогбаров Темнокаменных, заявляю о своей верности племени Вершины.'),
(99619, 2, 0, 'ruRU', 'Вместе мы — Вершина!');

-- Arcane Sentinel (99755) - fully English, same robotic template as Arcane Chronomaton.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 99755 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(99755, 0, 0, 'ruRU', 'Предъявите удостоверение личности. ПОДЧИНИТЕСЬ.'),
(99755, 0, 1, 'ruRU', 'СТОЙ. Требуется проверка.'),
(99755, 0, 2, 'ruRU', 'Сканирование тайной сущности...');

-- Felbound Spirit (116427) - only group0(ID0) was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 116427 AND `Locale` = 'ruRU' AND `GroupID`=0 AND `ID`=0;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(116427, 0, 0, 'ruRU', 'Тебе здесь не место.');

-- Nikki the Gossip (98092) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 98092 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(98092, 0, 0, 'ruRU', 'Осторожнее, босс. Запределье — довольно опасное место, да и Шаттрат немногим лучше.'),
(98092, 1, 0, 'ruRU', 'Следи за спиной и за карманами.'),
(98092, 2, 0, 'ruRU', 'Просто проследи, чтобы все были с ним поласковее. А то завтра мы все можем не проснуться. Ты понимаешь, о чём я?');

-- "Sure-Shot" Arnie (100230) - only group2 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 100230 AND `Locale` = 'ruRU' AND `GroupID`=2;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(100230, 2, 0, 'ruRU', 'Я не промахиваюсь!');

-- Felborne Collaborator (111750) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 111750 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(111750, 1, 0, 'ruRU', 'Я раздавлю тебя, червь!');

-- Sashj'tar Siren (100999) - already fully Russian, nothing to do.

-- Death Hunter Moorgoth (100633) - group0 is a deliberate French flourish (kept untranslated,
-- same convention as Lord Jorach Ravenholdt); only group3 needed translation.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 100633 AND `Locale` = 'ruRU' AND `GroupID`=3;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(100633, 3, 0, 'ruRU', 'Берегись теней, ведь именно там я охочусь!');

-- Sashj'tar Sandcrusher (102828) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 102828 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(102828, 0, 0, 'ruRU', 'Повелительница приливов...'),
(102828, 1, 0, 'ruRU', 'Сашджтар уничтожат тебя!'),
(102828, 2, 0, 'ruRU', 'Слишком... силён...');

-- Felbound Spirit (116468, separate from 116427) - only group0(ID0) was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 116468 AND `Locale` = 'ruRU' AND `GroupID`=0 AND `ID`=0;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(116468, 0, 0, 'ruRU', 'Покинь это место, $c!');

-- Smolderhide Warrior (91288) - only group1 was English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 91288 AND `Locale` = 'ruRU' AND `GroupID`=1;
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(91288, 1, 0, 'ruRU', 'Я тебя раздавлю!');

-- Dark Ranger Velonara (100452), Gharset the Aimtrue (100534), Huntress Kuzari (100695) -
-- group0 for each is a deliberate French flourish (same Jorach Ravenholdt convention), and
-- group3 already has the equivalent Russian line - nothing to add.

-- French-flourish convention confirmed for a further batch of NPCs (same style as Jorach
-- Ravenholdt/Velonara/Gharset/Kuzari) - deliberate flavor text, left untranslated, nothing to
-- add: Dread Commander Thalanor (93517), Quartermaster Ozorg (93550), smith apprentice at
-- 97111, Lady Alistra (97136), Shandris Feathermoon (98738), Halduron Brightwing (98739),
-- Vereesa Windrunner (98740), Death Hunter Moorgoth (100633, group0 only - group3 already
-- Russian), Beastmaster Tagh (103458), Outfitter Reynolds (103693), Scout Brightspear (100702),
-- Nimi Brightcastle (100697), Emmarel Shadewarden (102578), Gedrah (110799), Tactician
-- Tinderfell (103023).

-- Risen Assassin (94046), groups 3 and 11 - fictional Thalassian-style battle cries
-- ("Tor ilisar'thera'nal!", "Bandu thoribas!") with no existing Cyrillic transliteration
-- precedent anywhere in this DB (checked) - left untranslated per convention.

-- Zuriwa the Hexxer (119173) - fully English.
DELETE FROM `creature_text_locale` WHERE `CreatureID` = 119173 AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`, `GroupID`, `ID`, `Locale`, `Text`) VALUES
(119173, 0, 0, 'ruRU', 'Я отдам тебя на корм коням погибели!');
