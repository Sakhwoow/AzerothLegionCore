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

-- MenuId 2144, 2168 - class/profession-trainer selection remainders.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 2144 AND `OptionIndex` = 8 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(2144, 8, 'ruRU', 'Шаман');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 2168 AND `OptionIndex` IN (13,14) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(2168, 13, 'ruRU', 'Снятие шкур'),
(2168, 14, 'ruRU', 'Портняжное дело');

-- MenuId 2222, 3333 - deliberate French flavor text (same convention as 999/1111), left
-- untranslated.

-- MenuId 2242, 3130, 3625 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 2242 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(2242, 0, 'ruRU', 'Я хотел бы купить у тебя.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3130 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3130, 0, 'ruRU', 'Я хотел бы купить у тебя.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3625 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3625, 0, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 2351 - profession-trainer selection remainder.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 2351 AND `OptionIndex` IN (10,11,12,13,14) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(2351, 10, 'ruRU', 'Ювелирное дело'),
(2351, 11, 'ruRU', 'Кожевничество'),
(2351, 12, 'ruRU', 'Горное дело'),
(2351, 13, 'ruRU', 'Снятие шкур'),
(2351, 14, 'ruRU', 'Портняжное дело');

-- MenuId 2487 - "Here it IS!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 2487 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(2487, 0, 'ruRU', 'Вот оно!');

-- MenuId 3283, 3329, 3354, 3545, 3564 - class-trainer selection remainders (Shaman/Warrior).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3283 AND `OptionIndex` = 7 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3283, 7, 'ruRU', 'Воин');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3329 AND `OptionIndex` IN (4,5) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3329, 4, 'ruRU', 'Шаман'),
(3329, 5, 'ruRU', 'Воин');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3354 AND `OptionIndex` = 6 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3354, 6, 'ruRU', 'Воин');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3545 AND `OptionIndex` = 7 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3545, 7, 'ruRU', 'Воин');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3564 AND `OptionIndex` = 5 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3564, 5, 'ruRU', 'Воин');

-- MenuId 3580 - "Hippogryph Master"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3580 AND `OptionIndex` = 7 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3580, 7, 'ruRU', 'Укротитель гиппогрифов');

-- MenuId 3651 - Betina's replacement seal/rune.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3651 AND `OptionIndex` IN (1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3651, 1, 'ruRU', 'Бетина, хотел бы получить замену Печати Зари, пожалуйста!'),
(3651, 2, 'ruRU', 'Бетина, хотел бы получить замену Руны Зари, пожалуйста!');

-- MenuId 3679 - "Lets Go!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3679 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3679, 0, 'ruRU', 'Идём!');

-- MenuId 3781 - Alterac Valley battleground info menu.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3781 AND `OptionIndex` IN (0,1,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3781, 0, 'ruRU', 'Расскажи мне об Альтеракской долине.'),
(3781, 1, 'ruRU', 'Расскажи мне о кладбищах.'),
(3781, 2, 'ruRU', 'Расскажи мне о рудниках.'),
(3781, 3, 'ruRU', 'Расскажи мне о башнях.');

-- MenuId 3841 - "Where is the zeppelin now?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3841 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3841, 0, 'ruRU', 'Где сейчас дирижабль?');

-- MenuId 3984 - "<Take the letter>"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 3984 AND `OptionIndex` = 4 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(3984, 4, 'ruRU', '<Взять письмо>');

-- MenuId 4085 - "Yes, Augustus. I would like to do business."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 4085 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(4085, 0, 'ruRU', 'Да, Август. Я хотел бы вести с тобой дела.');

-- MenuId 4093 - "Tell me more."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 4093 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(4093, 0, 'ruRU', 'Расскажи мне больше.');

-- MenuId 4105 - shaman trainer menu.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 4105 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(4105, 0, 'ruRU', 'Научи меня путям духов.'),
(4105, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 4108 - "You challenged us and we have come. Where is this master you speak of?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 4108 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(4108, 0, 'ruRU', 'Ты бросил нам вызов, и мы пришли. Где этот мастер, о котором ты говоришь?');

-- MenuId 4109 - "What else do you have to say?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 4109 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(4109, 0, 'ruRU', 'Что ещё ты можешь сказать?');

-- MenuId 4128/4129/4134/4151/4165/4184/4241/4242/4351 - generic trainer "Train me." line,
-- recurring across many unrelated trainer menus.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (4128,4129,4134,4151,4165,4184,4241,4242,4351) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(4128, 0, 'ruRU', 'Обучи меня.'),
(4129, 0, 'ruRU', 'Обучи меня.'),
(4134, 0, 'ruRU', 'Обучи меня.'),
(4151, 0, 'ruRU', 'Обучи меня.'),
(4165, 0, 'ruRU', 'Обучи меня.'),
(4184, 0, 'ruRU', 'Обучи меня.'),
(4241, 0, 'ruRU', 'Обучи меня.'),
(4242, 0, 'ruRU', 'Обучи меня.'),
(4351, 0, 'ruRU', 'Обучи меня.');

-- MenuId 4150 - "I wish to unlearn my Gnomish Engineering specialization!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 4150 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(4150, 1, 'ruRU', 'Я хочу забыть свою специализацию гномьей инженерии!');

-- MenuId 4360 - "Mountaineer Barleybrew said you could help me get to Loch Modan."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 4360 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(4360, 1, 'ruRU', 'Горец Ячменоваров сказал, что ты можешь помочь мне добраться до Лок Модана.');

-- "<Take the letter>" - another recurring batch of unrelated letter-delivery menus.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (4502,4512,4513,4540,4541,4542,4561,4562,4575,4576,4577,4658,4659,4676,4690) AND `OptionIndex` = 4 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(4502, 4, 'ruRU', '<Взять письмо>'),
(4512, 4, 'ruRU', '<Взять письмо>'),
(4513, 4, 'ruRU', '<Взять письмо>'),
(4540, 4, 'ruRU', '<Взять письмо>'),
(4541, 4, 'ruRU', '<Взять письмо>'),
(4542, 4, 'ruRU', '<Взять письмо>'),
(4561, 4, 'ruRU', '<Взять письмо>'),
(4562, 4, 'ruRU', '<Взять письмо>'),
(4575, 4, 'ruRU', '<Взять письмо>'),
(4576, 4, 'ruRU', '<Взять письмо>'),
(4577, 4, 'ruRU', '<Взять письмо>'),
(4658, 4, 'ruRU', '<Взять письмо>'),
(4659, 4, 'ruRU', '<Взять письмо>'),
(4676, 4, 'ruRU', '<Взять письмо>'),
(4690, 4, 'ruRU', '<Взять письмо>');

-- MenuId 4553, 4555 - mage trainer menu.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (4553,4555) AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(4553, 0, 'ruRU', 'Меня интересует обучение магии.'),
(4553, 1, 'ruRU', 'Я хочу забыть свои таланты.'),
(4555, 0, 'ruRU', 'Меня интересует обучение магии.'),
(4555, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 4845 - "I wish to make a purchase, Nipsy."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 4845 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(4845, 0, 'ruRU', 'Я хочу сделать покупку, Нипси.');

-- MenuId 5002 - mine-related dialogue options.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5002 AND `OptionIndex` IN (0,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5002, 0, 'ruRU', 'Расскажи мне снова о рудниках...'),
(5002, 2, 'ruRU', 'Расскажи мне о чём-то другом...');

-- MenuId 5003 - same mine dialogue as 5002.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5003 AND `OptionIndex` IN (0,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5003, 0, 'ruRU', 'Расскажи мне снова о рудниках...'),
(5003, 2, 'ruRU', 'Расскажи мне о чём-то другом...');

-- MenuId 5048 - "I will be your wingman!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5048 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5048, 0, 'ruRU', 'Я буду твоим прикрытием!');

-- MenuId 5061 - "<Take the letter>"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5061 AND `OptionIndex` = 4 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5061, 4, 'ruRU', '<Взять письмо>');

-- MenuId 5102 - "Have you ever heard of a place called Dire Maul?" (official ruRU zone name
-- "Забытый город").
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5102 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5102, 0, 'ruRU', 'Ты когда-нибудь слышал о месте под названием Забытый город?');

-- MenuId 5124 - "How many more supplies are needed for the next upgrade?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5124 AND `OptionIndex` = 3 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5124, 3, 'ruRU', 'Сколько ещё припасов нужно для следующего улучшения?');

-- MenuId 5146 - "I got your back, Ichman. GO GO GO!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5146 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5146, 0, 'ruRU', 'Я прикрываю тебя, Ичман. Вперёд, вперёд, вперёд!');

-- MenuId 5223/5225/5227/5621/5668/5670/5671 - recurring "graveyard status" dialogue
-- (Alterac Valley battlemaster-style NPCs).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (5223,5225,5227,5621,5668,5670,5671) AND `OptionIndex` IN (0,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5223, 0, 'ruRU', 'Расскажи мне снова о кладбищах...'),
(5223, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5225, 0, 'ruRU', 'Расскажи мне снова о кладбищах...'),
(5225, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5227, 0, 'ruRU', 'Расскажи мне снова о кладбищах...'),
(5227, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5621, 0, 'ruRU', 'Расскажи мне снова о кладбищах...'),
(5621, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5668, 0, 'ruRU', 'Расскажи мне снова о кладбищах...'),
(5668, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5670, 0, 'ruRU', 'Расскажи мне снова о кладбищах...'),
(5670, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5671, 0, 'ruRU', 'Расскажи мне снова о кладбищах...'),
(5671, 2, 'ruRU', 'Расскажи мне о чём-то другом...');

-- MenuId 5669 - Alterac Valley control-status menu (official ruRU location names).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5669 AND `OptionIndex` BETWEEN 0 AND 6 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5669, 0, 'ruRU', 'Кто контролирует Пункт подкрепления Штормпика?'),
(5669, 1, 'ruRU', 'Кто контролирует кладбище Штормпика?'),
(5669, 2, 'ruRU', 'Кто контролирует кладбище Каменного Очага?'),
(5669, 3, 'ruRU', 'Кто контролирует кладбище Снегопада?'),
(5669, 4, 'ruRU', 'Кто контролирует кладбище Ледяной Крови?'),
(5669, 5, 'ruRU', 'Кто контролирует кладбище Северного Волка?'),
(5669, 6, 'ruRU', 'Кто контролирует хижину подкрепления Северного Волка?');

-- MenuId 5673 - Alterac Valley mine control-status menu.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5673 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5673, 0, 'ruRU', 'Кто контролирует рудник Железной Глубины?'),
(5673, 1, 'ruRU', 'Кто контролирует рудник Холодного Клыка?');

-- MenuId 5674 - Alterac Valley bunker/tower control-status menu.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5674 AND `OptionIndex` BETWEEN 0 AND 8 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5674, 0, 'ruRU', 'Кто контролирует южный бункер Дун Балдара?'),
(5674, 1, 'ruRU', 'Кто контролирует северный бункер Дун Балдара?'),
(5674, 2, 'ruRU', 'Кто контролирует бункер Ледяного Крыла?'),
(5674, 3, 'ruRU', 'Кто контролирует бункер Каменного Очага?'),
(5674, 4, 'ruRU', 'Кто контролирует западную башню Северного Волка?'),
(5674, 5, 'ruRU', 'Кто контролирует восточную башню Северного Волка?'),
(5674, 6, 'ruRU', 'Кто контролирует Вершину Башни?'),
(5674, 7, 'ruRU', 'Кто контролирует башню Ледяной Крови?'),
(5674, 8, 'ruRU', 'Кто контролирует западную башню Северного Волка?');

-- MenuId 5676-5684 - recurring "tower status" dialogue (same pattern as the graveyard one).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (5676,5677,5678,5679,5680,5681,5682,5683,5684) AND `OptionIndex` IN (0,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5676, 0, 'ruRU', 'Расскажи мне снова о башнях...'),
(5676, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5677, 0, 'ruRU', 'Расскажи мне снова о башнях...'),
(5677, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5678, 0, 'ruRU', 'Расскажи мне снова о башнях...'),
(5678, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5679, 0, 'ruRU', 'Расскажи мне снова о башнях...'),
(5679, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5680, 0, 'ruRU', 'Расскажи мне снова о башнях...'),
(5680, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5681, 0, 'ruRU', 'Расскажи мне снова о башнях...'),
(5681, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5682, 0, 'ruRU', 'Расскажи мне снова о башнях...'),
(5682, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5683, 0, 'ruRU', 'Расскажи мне снова о башнях...'),
(5683, 2, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5684, 0, 'ruRU', 'Расскажи мне снова о башнях...'),
(5684, 2, 'ruRU', 'Расскажи мне о чём-то другом...');

-- MenuId 5692 - Alterac Valley lore-figure dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5692 AND `OptionIndex` BETWEEN 0 AND 5 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5692, 0, 'ruRU', 'Расскажи мне о капитане Галвангаре.'),
(5692, 1, 'ruRU', 'Расскажи мне о Дрек''Таре.'),
(5692, 2, 'ruRU', 'Расскажи мне о крепости Северного Волка.'),
(5692, 3, 'ruRU', 'Расскажи мне о капитане Белинде Каменный Очаг.'),
(5692, 4, 'ruRU', 'Расскажи мне о Ваннаре Штормпике.'),
(5692, 5, 'ruRU', 'Расскажи мне о Дун Балдаре.');

-- MenuId 5693/5695/5697/5699/5705/5706 - recurring "Alterac Valley" dialogue continuation.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (5693,5695,5697,5699,5705,5706) AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5693, 0, 'ruRU', 'Расскажи мне снова об Альтеракской долине...'),
(5693, 1, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5695, 0, 'ruRU', 'Расскажи мне снова об Альтеракской долине...'),
(5695, 1, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5697, 0, 'ruRU', 'Расскажи мне снова об Альтеракской долине...'),
(5697, 1, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5699, 0, 'ruRU', 'Расскажи мне снова об Альтеракской долине...'),
(5699, 1, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5705, 0, 'ruRU', 'Расскажи мне снова об Альтеракской долине...'),
(5705, 1, 'ruRU', 'Расскажи мне о чём-то другом...'),
(5706, 0, 'ruRU', 'Расскажи мне снова об Альтеракской долине...'),
(5706, 1, 'ruRU', 'Расскажи мне о чём-то другом...');

-- MenuId 5744 - "This sounds like a task worthy of the new king!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5744 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5744, 0, 'ruRU', 'Это задание достойно нового короля!');

-- MenuId 5764/5765/5767/5768/5769 - Felwood Fruit of Fertility quest dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (5764,5765,5767,5768,5769) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5764, 0, 'ruRU', 'Почему ты говоришь, что это случайность, Рабин?'),
(5765, 0, 'ruRU', 'Плод Плодородия?'),
(5767, 0, 'ruRU', 'Что ты хочешь, чтобы я сделал, Рабин?'),
(5768, 0, 'ruRU', 'Что произойдёт, если позволить Плоду Плодородия - или Фелвайну - полностью поддаться Скверне?'),
(5769, 0, 'ruRU', 'Но что-то пошло не так, верно?');

-- MenuId 5968 - flight into the Cauldron (Dragonblight).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 5968 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(5968, 0, 'ruRU', 'Мне нужно долететь.'),
(5968, 1, 'ruRU', 'Я готов лететь в Котёл!');

-- MenuId 6001 - "<Put your hand on the sphere.>"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6001 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6001, 0, 'ruRU', '<Положи руку на сферу.>');

-- MenuId 6021, 6101 - Vaelastrasz dialogue (Blackwing Lair prelude).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6021 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6021, 0, 'ruRU', 'Я не могу, Вейлестраз! Наверняка есть способ тебя исцелить!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6101 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6101, 0, 'ruRU', 'Вейлестраз, нет!!!');

-- MenuId 6083, 6085 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6083 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6083, 0, 'ruRU', 'Я хотел бы купить у тебя.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6085 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6085, 0, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 6187 - roleplay judgment scenario (prisoner mercy vs. execution); trailing \n in
-- option 1 preserved verbatim.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6187 AND `OptionIndex` IN (1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6187, 1, 'ruRU', 'Я казню его, как приказал мой повелитель, но сделаю это как можно безболезненнее. Правосудие должно быть исполнено, но я могу проявить сострадание.\n'),
(6187, 2, 'ruRU', 'Я рискую собственной жизнью и освобождаю его, чтобы он мог доказать свою невиновность. Если смогу, помогу ему всем, чем только можно.');

-- MenuId 6208 - roleplay scenario (confronting a ruler's insult).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6208 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6208, 0, 'ruRU', 'Я открыто обличаю правителя за его злонамеренное поведение, защищая честь своего повелителя, даже рискуя будущей дипломатией.'),
(6208, 1, 'ruRU', 'Я не слишком тихо игнорирую оскорбление, надеясь внушить правителю страх, что он мог допустить ошибку. А вернувшись, сообщу своему повелителю об этом оскорблении.'),
(6208, 2, 'ruRU', 'Я молча игнорирую оскорбление. Я не стану рассказывать об этом своему повелителю, ведь моя задача - сохранить мир любой ценой. Это всего лишь оскорбление, а не объявление войны.');

-- MenuId 6209 - roleplay scenario (brother joining an order).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6209 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6209, 0, 'ruRU', 'Я выступлю против того, чтобы мой брат вступил в орден, даже рискуя навсегда разрушить наши отношения. Он будет опасен для себя и окружающих, и надеяться, что со временем он исправится, - слишком большой риск.'),
(6209, 1, 'ruRU', 'Я выступлю за то, чтобы мой брат вступил в орден, даже рискуя безопасностью самого ордена. Я смогу помочь ему с орденскими порядками и верю в его способность приспособиться и научиться.'),
(6209, 2, 'ruRU', 'Я найду скрытый способ не допустить брата в орден. Я смогу сделать это так, что он даже не узнает, и тем самым сохраню наши родственные связи.');

-- MenuId 6484, 6508 - "I wish to join the battle!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6484 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6484, 0, 'ruRU', 'Я хочу вступить в бой!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6508 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6508, 0, 'ruRU', 'Я хочу вступить в бой!');

-- MenuId 6533, 6534 - Natalia Mar'alith investigation questline.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6533 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6533, 0, 'ruRU', 'Привет, Франкал. Я слышал, у тебя может быть информация о местонахождении госпожи Наталии Мар''алит.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6534 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6534, 0, 'ruRU', 'Привет, Рутгар. Командир отправил меня сюда, чтобы собрать информацию о его пропавшей жене.');

-- MenuId 6539 - Anachronos dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6539 AND `OptionIndex` = 16 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6539, 16, 'ruRU', 'Да, Анахронос. Я готов узреть твоё видение будущего.');

-- MenuId 6545-6551 - Natalia Mar'alith investigation questline, continued.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (6545,6546,6547,6548,6549,6550,6551) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6545, 0, 'ruRU', 'Я вернусь, как только разберусь с этим беспорядком.'),
(6546, 0, 'ruRU', 'Одержим чем?'),
(6547, 0, 'ruRU', 'Потерял его? Что ты имеешь в виду?'),
(6548, 0, 'ruRU', 'Какие требования?'),
(6549, 0, 'ruRU', 'Наталия?'),
(6550, 0, 'ruRU', 'Что случилось с ней после этого?'),
(6551, 0, 'ruRU', 'Звучит опасно.');

-- MenuId 6552-6558 - Natalia Mar'alith investigation questline, continued further.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (6552,6553,6554,6555,6556,6557,6558) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6552, 0, 'ruRU', 'Спасибо за информацию, Франкал.'),
(6553, 0, 'ruRU', 'Какая история! То есть она отправилась в Хайв''Регал, и это был последний раз, когда ты её видел?'),
(6554, 0, 'ruRU', 'А что потом?'),
(6555, 0, 'ruRU', 'Я всё хотел спросить тебя об этой обезьяне.'),
(6556, 0, 'ruRU', 'Ты не справился с одной-единственной жрицей ночных эльфов?'),
(6557, 0, 'ruRU', 'Это странно.'),
(6558, 0, 'ruRU', 'Вот это мне нравится слышать.');

-- MenuId 6574 - "I understand."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6574 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6574, 0, 'ruRU', 'Я понимаю.');

-- MenuId 6575 - Darkmoon Faire cannon; color token preserved.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6575 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6575, 0, 'ruRU', 'Как мне использовать пушку?'),
(6575, 1, 'ruRU', 'Запусти меня! |cFF0008E8(Жетон ярмарки Новолуния)|r'),
(6575, 2, 'ruRU', 'Запусти меня! |cFF0008E8(Жетон ярмарки Новолуния)|r');

-- MenuId 6581, 6582 - Darkmoon Faire tonk/cannon dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6581 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6581, 0, 'ruRU', 'Что это за консоли управления танками?'),
(6581, 1, 'ruRU', 'Расскажи мне о пушке.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6582 AND `OptionIndex` = 3 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6582, 3, 'ruRU', 'Что ещё можно делать на ярмарке?');

-- MenuId 6629 - "Let's find out."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6629 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6629, 0, 'ruRU', 'Давай выясним.');

-- MenuId 6650 - "<Take the letter>"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6650 AND `OptionIndex` = 4 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6650, 4, 'ruRU', '<Взять письмо>');

-- MenuId 6666 - "Teleport me"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6666 AND `OptionIndex` = 6666 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6666, 6666, 'ruRU', 'Телепортируй меня');

-- MenuId 6917, 6924 - "Farewell."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6917 AND `OptionIndex` = 3 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6917, 3, 'ruRU', 'Прощай.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6924 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6924, 1, 'ruRU', 'Прощай.');

-- MenuId 6952 - "Why... yes, of course. I've something to show you right inside this
-- building, Mr. Anvilward."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 6952 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(6952, 0, 'ruRU', 'Что ж... да, разумеется. У меня есть что показать тебе прямо здесь, в этом здании, мистер Энвилворд.');

-- MenuId 7147 - "I'd like to fly back to Silvermoon City."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7147 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7147, 0, 'ruRU', 'Я хотел бы вернуться в Луносвет.');

-- MenuId 7260 - "Enter the Ordeal"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7260 AND `OptionIndex` = 3 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7260, 3, 'ruRU', 'Войти в Испытание');

-- MenuId 7288 - innkeeper "Make this inn your home."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7288 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7288, 0, 'ruRU', 'Сделать эту гостиницу своим домом.');

-- MenuId 7290 - Floyd, Hellfire Peninsula innkeeper/vendor.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7290 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7290, 0, 'ruRU', 'Отличное предложение, Флойд. Я хочу сделать полуостров Адского Пламени своим домом.'),
(7290, 1, 'ruRU', 'Я ищу особые товары. Дай мне взглянуть на твой ассортимент, Флойд.');

-- MenuId 7410 - "I wish to browse your wares."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7410 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7410, 0, 'ruRU', 'Я хочу посмотреть твои товары.');

-- MenuId 7441-7443 - Little Red Riding Hood joke NPC.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (7441,7442,7443) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7441, 0, 'ruRU', 'Ох, бабушка, какие у тебя большие уши.'),
(7442, 0, 'ruRU', 'Ох, бабушка, какие у тебя большие глаза.'),
(7443, 0, 'ruRU', 'Ох, бабушка, какой у тебя жирный лут.');

-- MenuId 7470, 7471 - hippogryph taxi / vendor.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7470 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7470, 0, 'ruRU', 'Я хочу полететь на гиппогрифе.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7471 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7471, 1, 'ruRU', 'Я хочу посмотреть твои товары.');

-- MenuId 7486 - "Take Blood Knight Insignia"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7486 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7486, 0, 'ruRU', 'Взять знак отличия рыцаря крови');

-- MenuId 7552 - Lady Proudmoore dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7552 AND `OptionIndex` IN (1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7552, 1, 'ruRU', 'Мы готовы к всему, что Архимонд может на нас обрушить, леди Праудмур.'),
(7552, 2, 'ruRU', 'До новой встречи, леди Праудмур.');

-- MenuId 7559, 7560 - "Grant me your mark" ancient-spirit dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7559 AND `OptionIndex` IN (1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7559, 1, 'ruRU', 'Даруй мне свою метку, мудрый древний.'),
(7559, 2, 'ruRU', 'Даруй мне свою метку, мудрый древний.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7560 AND `OptionIndex` IN (1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7560, 1, 'ruRU', 'Даруй мне свою метку, могучий древний.'),
(7560, 2, 'ruRU', 'Даруй мне свою метку, могучий древний.');

-- MenuId 7581 - Thrall dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7581 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7581, 0, 'ruRU', 'Нам нечего бояться.'),
(7581, 1, 'ruRU', 'Я с тобой, Тралл.'),
(7581, 2, 'ruRU', 'До новой встречи, Тралл.');

-- MenuId 7628 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7628 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7628, 0, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 7675 - Lantresor dialogue; trailing \n preserved.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7675 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7675, 0, 'ruRU', 'Я убил много твоих огров, Лантресор. Мне нечего бояться.\n');

-- MenuId 7676 - "What do I need to do?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7676 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7676, 1, 'ruRU', 'Что мне нужно сделать?');

-- MenuId 7679 - apology dialogue; trailing \n preserved.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7679 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7679, 0, 'ruRU', 'Мои извинения. Я не хотел никого обидеть. Я здесь от имени своего народа.\n');

-- MenuId 7706 - "I would be grateful for any aid you can provide, Priestess."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7706 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7706, 0, 'ruRU', 'Я был бы благодарен за любую помощь, которую ты можешь предложить, жрица.');

-- MenuId 7788 - profession-trainer selection, "Cooking".
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7788 AND `OptionIndex` = 14 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7788, 14, 'ruRU', 'Кулинария');

-- MenuId 7812 - "I would like to check my deposit box."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7812 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7812, 0, 'ruRU', 'Я хотел бы проверить свой депозитный ящик.');

-- MenuId 7815 - "How do I use Prospecting?" (official ruRU term "Геологоразведка").
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7815 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7815, 1, 'ruRU', 'Как использовать Геологоразведку?');

-- MenuId 7817 - "I would like to train."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7817 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7817, 0, 'ruRU', 'Я хотел бы обучиться.');

-- MenuId 7857, 7869 - innkeeper menus.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7857 AND `OptionIndex` IN (0,5) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7857, 0, 'ruRU', 'Сделать эту гостиницу своим домом.'),
(7857, 5, 'ruRU', 'Что у тебя есть на продажу?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 7869 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(7869, 0, 'ruRU', 'Сделать эту гостиницу своим домом.');

-- MenuId 8031 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8031 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8031, 0, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 8035 - "Let's see what you have."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8035 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8035, 0, 'ruRU', 'Давай посмотрим, что у тебя есть.');

-- MenuId 8075, 8076 - "I would like to go to the battleground."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8075 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8075, 0, 'ruRU', 'Я хочу отправиться на Поле Боя.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8076 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8076, 0, 'ruRU', 'Я хочу отправиться на Поле Боя.');

-- MenuId 8094 - "What do you have for sale?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8094 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8094, 0, 'ruRU', 'Что у тебя есть на продажу?');

-- MenuId 8259 - "I am ready to hear your story, Oronok."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8259 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8259, 1, 'ruRU', 'Я готов услышать твою историю, Оронок.');

-- MenuId 8306 - "Why are you so far from Toshley's Station?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8306 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8306, 1, 'ruRU', 'Почему ты так далеко от Станции Тошли?');

-- MenuId 8339 - Ruusk/Lord Illidan dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8339 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8339, 0, 'ruRU', 'Мне нужно вдаваться в кровавые подробности? Думаю, мы оба прекрасно знаем, что лорд Иллидан делает с теми, кто идёт против его воли. А теперь мне нужно идти! Прощай, Руск! Навсегда...');

-- MenuId 8371 - "Search the corpse for Kagrosh's pack."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8371 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8371, 0, 'ruRU', 'Обыскать труп на предмет сумки Кагроша.');

-- MenuId 8386 - "Let me see your wares."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8386 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8386, 0, 'ruRU', 'Дай мне взглянуть на твои товары.');

-- MenuId 8403 - profession-trainer selection remainder.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8403 AND `OptionIndex` IN (8,9,10,11,12,13) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8403, 8, 'ruRU', 'Начертание'),
(8403, 9, 'ruRU', 'Ювелирное дело'),
(8403, 10, 'ruRU', 'Кожевничество'),
(8403, 11, 'ruRU', 'Горное дело'),
(8403, 12, 'ruRU', 'Снятие шкур'),
(8403, 13, 'ruRU', 'Портняжное дело');

-- MenuId 8517, 8522 - generic trainer "Train me."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8517 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8517, 0, 'ruRU', 'Обучи меня.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8522 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8522, 0, 'ruRU', 'Обучи меня.');

-- MenuId 8540 - "I would like to train."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8540 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8540, 0, 'ruRU', 'Я хотел бы обучиться.');

-- MenuId 8629 - "Let me see the wyverns, Dama."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8629 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8629, 0, 'ruRU', 'Покажи мне виверн, Дама.');

-- MenuId 8638 - "We're ready to face Illidan."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8638 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8638, 0, 'ruRU', 'Мы готовы сразиться с Иллиданом.');

-- MenuId 8659 - "Show me what you have for sale."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8659 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8659, 0, 'ruRU', 'Покажи мне, что у тебя есть на продажу.');

-- MenuId 8763 - "Who is the Headless Horseman?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8763 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8763, 0, 'ruRU', 'Кто такой Всадник без головы?');

-- MenuId 8884, 9112, 9460 - innkeeper "Make this inn your home."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8884 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8884, 0, 'ruRU', 'Сделать эту гостиницу своим домом.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9112 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9112, 0, 'ruRU', 'Сделать эту гостиницу своим домом.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9460 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9460, 0, 'ruRU', 'Сделать эту гостиницу своим домом.');

-- MenuId 8899 - "Please loan me that spyglass."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 8899 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(8899, 0, 'ruRU', 'Пожалуйста, одолжи мне эту подзорную трубу.');

-- MenuId 9006 - "What if I don't like drinking... Is there another way I can help out?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9006 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9006, 0, 'ruRU', 'А что, если я не люблю пить... Есть другой способ помочь?');

-- MenuId 9025 - Brewfest menu.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9025 AND `OptionIndex` IN (1,2,3,4) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9025, 1, 'ruRU', 'Жетоны и сувениры'),
(9025, 2, 'ruRU', 'Гонки на баранах'),
(9025, 3, 'ruRU', 'Клуб эля месяца'),
(9025, 4, 'ruRU', 'Атаки дворфов Тёмного Железа');

-- MenuId 9084, 9085 - gnomish flying machine dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9084 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9084, 0, 'ruRU', 'Летающие машины?'),
(9084, 1, 'ruRU', 'Ты часто сжимаешь гномов?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9085 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9085, 0, 'ruRU', 'Это... прекрасно. А что насчёт этих летающих машин?'),
(9085, 1, 'ruRU', 'Спасибо! Я попробую прямо сейчас.');

-- MenuId 9157 - "Queue for The Frost Lord Ahune battle."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9157 AND `OptionIndex` IN (1,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9157, 1, 'ruRU', 'Встать в очередь на бой с Повелителем Льда Ахуне.'),
(9157, 3, 'ruRU', 'Встать в очередь на бой с Повелителем Льда Ахуне.');

-- MenuId 9190 - "Search the body for the pilot's emergency toolkit."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9190 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9190, 1, 'ruRU', 'Обыскать тело на предмет аварийного набора инструментов пилота.');

-- MenuId 9273, 9274 - "Lay your hand on the stone."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9273 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9273, 0, 'ruRU', 'Положи руку на камень.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9274 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9274, 0, 'ruRU', 'Положи руку на камень.');

-- MenuId 9670 - Brann Bronzebeard dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9670 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9670, 0, 'ruRU', 'Идём, Бранн, хватит урока истории!');

-- MenuId 9706 - "I require repairs and supplies, Corvus."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9706 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9706, 0, 'ruRU', 'Мне нужен ремонт и припасы, Корвус.');

-- MenuId 9712 - "I'm ready to battle the dreadlord, sire."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9712 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9712, 0, 'ruRU', 'Я готов сражаться с повелителем ужаса, сир.');

-- MenuId 9724 - "Can you spare an orange?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9724 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9724, 0, 'ruRU', 'Не найдётся ли у тебя апельсина?');

-- MenuId 9727 - zeppelin tower selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9727 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9727, 0, 'ruRU', 'Восточная башня дирижаблей'),
(9727, 1, 'ruRU', 'Западная башня дирижаблей');

-- MenuId 9755 - "I wish to make a purchase, Fineous."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9755 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9755, 0, 'ruRU', 'Я хочу сделать покупку, Финеус.');

-- MenuId 9762 - "Koltira, let's get out of here!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9762 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9762, 0, 'ruRU', 'Колтира, давай убираться отсюда!');

-- MenuId 9792, 9793 - training dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9792 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9792, 0, 'ruRU', 'Я ищу обучения, Амал''тазад.'),
(9792, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9793 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9793, 0, 'ruRU', 'Я ищу обучения, леди Алистра.');

-- MenuId 9793 (talent unlearn), 9794 - Lord Thorval training dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9793 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9793, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9794 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9794, 0, 'ruRU', 'Я ищу обучения, лорд Торвал.'),
(9794, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 9800 - "Return me to life."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9800 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9800, 0, 'ruRU', 'Верни меня к жизни.');

-- MenuId 9821 - "I'd like to heal and revive my battle pets."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9821 AND `OptionIndex` = 3 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9821, 3, 'ruRU', 'Я хотел бы вылечить и воскресить своих боевых питомцев.');

-- MenuId 9832 - lost tabard dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9832 AND `OptionIndex` IN (12,13) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9832, 12, 'ruRU', 'Я потерял свою накидку Летнего Неба.'),
(9832, 13, 'ruRU', 'Я потерял свою накидку Летнего Пламени.');

-- MenuId 9857 - "I'm ready - lets get you out of here."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9857 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9857, 0, 'ruRU', 'Я готов - давай вытащим тебя отсюда.');

-- MenuId 9873, 9985 - generic trainer "Train me."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9873 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9873, 0, 'ruRU', 'Обучи меня.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9985 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9985, 0, 'ruRU', 'Обучи меня.');

-- MenuId 9983 - "I would like to go to the battleground."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9983 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9983, 0, 'ruRU', 'Я хочу отправиться на Поле Боя.');

-- MenuId 9996 - "Follow me"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 9996 AND `OptionIndex` = 8888 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(9996, 8888, 'ruRU', 'Следуй за мной');

-- MenuId 10027 - "I wish to unlearn my talents."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10027 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10027, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 10078 - profession-trainer selection, "Tailoring".
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10078 AND `OptionIndex` = 14 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10078, 14, 'ruRU', 'Портняжное дело');

-- MenuId 10082, 10153 - service-hub "Class Trainer"/"Profession Trainer".
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10082 AND `OptionIndex` IN (0,5) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10082, 0, 'ruRU', 'Тренер класса'),
(10082, 5, 'ruRU', 'Тренер профессии');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10153 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10153, 0, 'ruRU', 'Тренер профессии');

-- MenuId 10139 - innkeeper "Make this inn your home."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10139 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10139, 0, 'ruRU', 'Сделать эту гостиницу своим домом.');

-- MenuId 10192 - "Key to the Focusing Iris" (Alexstrasza dialogue).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10192 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10192, 0, 'ruRU', 'О великая Королева драконов, я каким-то образом потерял свой Ключ от Фокусирующей Радужницы. Не поможешь ли ты мне найти его?');

-- MenuId 10314 - "We are ready to help!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10314 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10314, 0, 'ruRU', 'Мы готовы помочь!');

-- MenuId 10316 - "fabled sword" dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10316 AND `OptionIndex` IN (2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10316, 2, 'ruRU', 'Рад помочь, моя леди. Мне сказали, что ты когда-то была хранительницей легендарного меча. Знаешь, где его найти?'),
(10316, 3, 'ruRU', 'Рад помочь, моя леди. Мне сказали, что ты когда-то была хранительницей легендарного меча. Знаешь, где его найти?');

-- MenuId 10318 - champion's pennant selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10318 AND `OptionIndex` IN (3,4,5,6) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10318, 3, 'ruRU', 'Вымпел чемпиона Дарнаса'),
(10318, 4, 'ruRU', 'Вымпел чемпиона Экзодара'),
(10318, 5, 'ruRU', 'Вымпел чемпиона Гномрегана'),
(10318, 6, 'ruRU', 'Вымпел чемпиона Стальгорна');

-- MenuId 10332, 10334 - "Yes."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10332 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10332, 0, 'ruRU', 'Да.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10334 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10334, 0, 'ruRU', 'Да.');

-- MenuId 10338 - "Come now, friend. You chop and I will protect you from the elves, ok?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10338 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10338, 0, 'ruRU', 'Идём, друг. Ты рубишь, а я защищу тебя от эльфов, идёт?');

-- MenuId 10342 - "I am ready, Gorka. To Kadrak!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10342 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10342, 0, 'ruRU', 'Я готов, Горка. На Кадрак!');

-- MenuId 10350 - trainer/vendor combo menu.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10350 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10350, 0, 'ruRU', 'Обучи меня.'),
(10350, 1, 'ruRU', 'Дай мне посмотреть твои товары.');

-- MenuId 10358 - mailbox/bank/trader hub.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10358 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10358, 0, 'ruRU', 'Посетить банк.'),
(10358, 1, 'ruRU', 'Посетить торговца.'),
(10358, 2, 'ruRU', 'Посетить почтовый ящик.');
