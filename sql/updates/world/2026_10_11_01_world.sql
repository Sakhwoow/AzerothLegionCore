-- ruRU locale for gossip_menu_option / gossip_menu_option_box.
-- Scope: rows whose OptionText/BoxText is the server's OWN text (OptionBroadcastTextId/
-- BoxBroadcastTextId = 0), not resolved through broadcast_text. Rows backed by a non-zero
-- broadcast text id are a separate, much larger, server-wide pool (legion_hotfixes.broadcast_text/
-- _locale) and are intentionally out of scope for this file.

-- MenuId 0 is the shared/global default gossip menu (used by many unrelated NPCs via
-- creature_template.gossip_menu_id = 0 for standard options like taxi/bank/battleground/
-- resurrect/auction/pet-unlearn) - not tied to one specific NPC, translated using the
-- long-standing canonical Blizzard ruRU phrasing for these default options.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 0 AND `OptionIndex` IN (2,4,5,7,10,11,15) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(0, 2, 'ruRU', 'Я хочу быстро добраться до места.'),
(0, 4, 'ruRU', 'Верни меня к жизни.'),
(0, 5, 'ruRU', 'Верни меня к жизни.'),
(0, 7, 'ruRU', 'Покажи мне мой банк.'),
(0, 10, 'ruRU', 'Я хочу вступить в бой на Поле Битвы.'),
(0, 11, 'ruRU', 'Аукцион!'),
(0, 15, 'ruRU', 'Я хочу, чтобы мой питомец забыл свои навыки.');

-- "<Take the letter>" - recurring action-label across several unrelated letter-delivery menus
-- (85, 141, 381, 410, 411, 436), each only missing OptionIndex 4.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (85,141,381,410,411,436) AND `OptionIndex` = 4 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(85, 4, 'ruRU', '<Взять письмо>'),
(141, 4, 'ruRU', '<Взять письмо>'),
(381, 4, 'ruRU', '<Взять письмо>'),
(410, 4, 'ruRU', '<Взять письмо>'),
(411, 4, 'ruRU', '<Взять письмо>'),
(436, 4, 'ruRU', '<Взять письмо>');

-- MenuId 202 - "Let the event begin!" (event-starter NPC).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 202 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(202, 0, 'ruRU', 'Пусть начинается событие!');

-- MenuId 341 - innkeeper "Make this inn your home." (canonical Blizzard ruRU phrasing).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 341 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(341, 0, 'ruRU', 'Сделать эту гостиницу своим домом.');

-- MenuId 421 - multi-trainer menu (Archaeology/Flying/Riding).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 421 AND `OptionIndex` IN (1,8,14) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(421, 1, 'ruRU', 'Археология'),
(421, 8, 'ruRU', 'Полёт'),
(421, 14, 'ruRU', 'Верховая езда');

-- MenuId 435 - multi-service menu (Battle Pet Trainer/Transmogrification/Void Storage/
-- Points of Interest/Vendor).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 435 AND `OptionIndex` IN (0,2,3,12,16) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(435, 0, 'ruRU', 'Тренер боевых питомцев'),
(435, 2, 'ruRU', 'Трансмогрификация'),
(435, 3, 'ruRU', 'Хранилище Пустоты'),
(435, 12, 'ruRU', 'Интересные места'),
(435, 16, 'ruRU', 'Торговец');

-- MenuId 721 - "The zeppelin master".
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 721 AND `OptionIndex` = 11 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(721, 11, 'ruRU', 'Командир дирижабля');

-- MenuId 740 - class-trainer selection, "Shaman"/"Warrior".
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 740 AND `OptionIndex` IN (6,7) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(740, 6, 'ruRU', 'Шаман'),
(740, 7, 'ruRU', 'Воин');

-- MenuId 751 - profession-trainer selection (Mining/Skinning/Tailoring).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 751 AND `OptionIndex` IN (12,13,14) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(751, 12, 'ruRU', 'Горное дело'),
(751, 13, 'ruRU', 'Снятие шкур'),
(751, 14, 'ruRU', 'Портняжное дело');

-- MenuId 980 - "Hello Sovik, I wish to browse your goods."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 980 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(980, 0, 'ruRU', 'Привет, Совик, хочу посмотреть твои товары.');

-- MenuId 999 ("Suivez-moi"), 1111 ("Je ne bougerait pas ! Teleportez-vous.") - deliberate
-- French flavor text (same convention as the French-speaking NPCs in creature_text), left
-- untranslated.

-- MenuId 1141 - "Tell me more about muisek." (Mogu spirit-essence lore term, transliterated).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1141 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1141, 0, 'ruRU', 'Расскажи мне больше о муйсеке.');

-- MenuId 1290, 1582 - innkeeper "Make this inn your home." (same canonical phrasing as 341).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1290 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1290, 1, 'ruRU', 'Сделать эту гостиницу своим домом.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1582 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1582, 0, 'ruRU', 'Сделать эту гостиницу своим домом.');

-- MenuId 1468 - "Access secret gnome engineering schemata!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1468 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1468, 0, 'ruRU', 'Получить доступ к секретным гномьим инженерным схемам!');

-- MenuId 1541 - "We wish to face the Defiler."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1541 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1541, 1, 'ruRU', 'Мы хотим сразиться с Разорителем.');

-- MenuId 1626 - guild formation menu.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1626 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1626, 0, 'ruRU', 'Я хочу создать герб гильдии.'),
(1626, 1, 'ruRU', 'Как мне основать гильдию?');

-- MenuId 1667 - "Fascinating. Please, tell me more."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1667 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1667, 0, 'ruRU', 'Увлекательно. Пожалуйста, расскажи больше.');

-- MenuId 1750 - "I am ready to GO!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1750 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1750, 0, 'ruRU', 'Я готов, ВПЕРЁД!');

-- MenuId 1942 - profession-trainer selection list (all 13 professions).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1942 AND `OptionIndex` BETWEEN 0 AND 13 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1942, 0, 'ruRU', 'Алхимия'),
(1942, 1, 'ruRU', 'Археология'),
(1942, 2, 'ruRU', 'Кузнечное дело'),
(1942, 3, 'ruRU', 'Кулинария'),
(1942, 4, 'ruRU', 'Создание чар'),
(1942, 5, 'ruRU', 'Инженерное дело'),
(1942, 6, 'ruRU', 'Первая помощь'),
(1942, 7, 'ruRU', 'Рыбная ловля'),
(1942, 8, 'ruRU', 'Полёт'),
(1942, 9, 'ruRU', 'Травничество'),
(1942, 10, 'ruRU', 'Начертание'),
(1942, 11, 'ruRU', 'Ювелирное дело'),
(1942, 12, 'ruRU', 'Кожевничество'),
(1942, 13, 'ruRU', 'Горное дело');

-- MenuId 1942 - remainder of the profession-trainer list.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1942 AND `OptionIndex` IN (14,15,16) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1942, 14, 'ruRU', 'Верховая езда'),
(1942, 15, 'ruRU', 'Снятие шкур'),
(1942, 16, 'ruRU', 'Портняжное дело');

-- MenuId 1949 - class-trainer selection list (all 10 classes).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1949 AND `OptionIndex` BETWEEN 0 AND 9 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1949, 0, 'ruRU', 'Друид'),
(1949, 1, 'ruRU', 'Охотник'),
(1949, 2, 'ruRU', 'Маг'),
(1949, 3, 'ruRU', 'Паладин'),
(1949, 4, 'ruRU', 'Жрец'),
(1949, 5, 'ruRU', 'Шаман'),
(1949, 6, 'ruRU', 'Разбойник'),
(1949, 7, 'ruRU', 'Колдун'),
(1949, 8, 'ruRU', 'Воин'),
(1949, 9, 'ruRU', 'Монах');

-- MenuId 1951 - full service-directory menu (hub NPC pointing to every other service).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1951 AND `OptionIndex` BETWEEN 0 AND 16 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1951, 0, 'ruRU', 'Тренер боевых питомцев'),
(1951, 2, 'ruRU', 'Трансмогрификация'),
(1951, 3, 'ruRU', 'Хранилище Пустоты'),
(1951, 4, 'ruRU', 'Аукционный дом'),
(1951, 5, 'ruRU', 'Банк'),
(1951, 6, 'ruRU', 'Парикмахер'),
(1951, 7, 'ruRU', 'Мастера боя'),
(1951, 8, 'ruRU', 'Тренер класса'),
(1951, 9, 'ruRU', 'Мастер полётов'),
(1951, 10, 'ruRU', 'Мастер гильдии и торговец'),
(1951, 11, 'ruRU', 'Трактир'),
(1951, 12, 'ruRU', 'Зал офицеров'),
(1951, 13, 'ruRU', 'Другие континенты'),
(1951, 14, 'ruRU', 'Тренер профессии'),
(1951, 15, 'ruRU', 'Смотритель стойл'),
(1951, 16, 'ruRU', 'Командир дирижабля');

-- MenuId 1964, 1965 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1964 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1964, 0, 'ruRU', 'Я хотел бы купить у тебя.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 1965 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(1965, 0, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 2001 - "Help me choose wisely."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 2001 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(2001, 0, 'ruRU', 'Помоги мне сделать правильный выбор.');

-- MenuId 2101 - "Where is the zeppelin now?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 2101 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(2101, 0, 'ruRU', 'Где сейчас дирижабль?');
