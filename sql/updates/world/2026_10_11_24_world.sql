-- ruRU locale for creature_text, scoped to map 1107 (Dreadscar Rift - Warlock Mage Tower scenario).

DELETE FROM `creature_text_locale` WHERE (`CreatureID`,`GroupID`,`ID`) IN (
  (99702,0,0),
  (101097,0,0),
  (104795,3,0),
  (111740,3,0),
  (112434,3,0)
) AND `Locale` = 'ruRU';
INSERT INTO `creature_text_locale` (`CreatureID`,`GroupID`,`ID`,`Locale`,`Text`) VALUES
(99702,0,0,'ruRU','Мы ожидаем твоих приказаний, $gвластитель:властительница;.'),
(101097,0,0,'ruRU','Пока ты занят, Калидус поищет подходящее место для ритуала.'),
(104795,3,0,'ruRU','Я не успокоюсь, пока не восстановлю Совет.'),
(111740,3,0,'ruRU','Я буду добавлять новые сведения по мере нашего исследования. Тебе стоит взглянуть, когда будет время.'),
(112434,3,0,'ruRU','Уделишь мне минутку? У меня тут есть кое-что для тебя интересное.');

-- quest_template_locale: closed the one missing map-1107 quest (generic artifact research work order).
DELETE FROM `quest_template_locale` WHERE `ID` = 43887 AND `locale` = 'ruRU';
INSERT INTO `quest_template_locale` (`ID`, `locale`, `LogTitle`, `LogDescription`, `QuestDescription`) VALUES
(43887, 'ruRU', 'За книги', 'Начните исследовательский заказ.', 'У тебя в руках оружие, одновременно древнее и могущественное. И всё же мы едва ли понимаем его природу. Если мы действительно хотим раскрыть весь его потенциал, нам нужно узнать о нём больше. Это то, что я могу сделать для тебя.\n\nИ всё же потребуется время и больше глаз, чем только мои, чтобы разобрать всю эту историю, перевести её и превратить в нечто осмысленное.\n\nНам стоит направить часть ресурсов ордена на это исследование. Это будет стоить каждой потраченной минуты.');
