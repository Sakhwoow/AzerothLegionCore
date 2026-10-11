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

-- MenuId 11154, 11169, 11172, 11217, 11266, 11268 - class-trainer "teach me" dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (11154,11169,11266) AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11154, 0, 'ruRU', 'Я ищу обучения путям охотника.'),
(11154, 1, 'ruRU', 'Я хочу забыть свои таланты.'),
(11169, 0, 'ruRU', 'Меня интересует обучение колдовству.'),
(11169, 1, 'ruRU', 'Я хочу забыть свои таланты.'),
(11266, 0, 'ruRU', 'Меня интересует обучение колдовству.'),
(11266, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (11172,11217,11268) AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11172, 0, 'ruRU', 'Научи меня путям духов.'),
(11172, 1, 'ruRU', 'Я хочу забыть свои таланты.'),
(11217, 0, 'ruRU', 'Научи меня путям духов.'),
(11217, 1, 'ruRU', 'Я хочу забыть свои таланты.'),
(11268, 0, 'ruRU', 'Научи меня путям духов.'),
(11268, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 11159 - "Gordo, do you think you could repair my gear?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11159 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11159, 0, 'ruRU', 'Гордо, не мог бы ты починить моё снаряжение?');

-- MenuId 11189 - "Can I catch a ride to Razor Hill?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11189 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11189, 0, 'ruRU', 'Могу я добраться до Лезвия Холма?');

-- MenuId 11201, 11248 - "Gobber, I need to look in my pack."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11201 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11201, 0, 'ruRU', 'Гоббер, мне нужно заглянуть в мой рюкзак.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11248 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11248, 0, 'ruRU', 'Гоббер, мне нужно заглянуть в мой рюкзак.');

-- MenuId 11209 - "Can you tell me your fable, Shin?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11209 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11209, 0, 'ruRU', 'Можешь рассказать мне свою историю, Шин?');

-- MenuId 11223, 11253, 11275 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11223 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11223, 0, 'ruRU', 'Я хотел бы купить у тебя.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11253 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11253, 0, 'ruRU', 'Я хотел бы купить у тебя.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11275 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11275, 0, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 11238 - "These ogres are on our side?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11238 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11238, 0, 'ruRU', 'Эти огры на нашей стороне?');

-- MenuId 11239 - Fizzle's Hand dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11239 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11239, 0, 'ruRU', '<Попытаться снять Руку Физзла, значит.>'),
(11239, 1, 'ruRU', '<Сдаться. Это слишком страшно.>');

-- MenuId 11240 - "<Attempt to remove the orb.>"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11240 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11240, 0, 'ruRU', '<Попытаться снять сферу.>');

-- MenuId 11256, 11257 - generic trainer "Train me."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11256 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11256, 0, 'ruRU', 'Обучи меня.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11257 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11257, 0, 'ruRU', 'Обучи меня.');

-- MenuId 11281 - "<Administer the draught.>"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11281 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11281, 0, 'ruRU', '<Дать выпить зелье.>');

-- MenuId 11289 - "research into the Eye" dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11289 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11289, 0, 'ruRU', 'Хорошо, попробуем ещё раз.'),
(11289, 1, 'ruRU', 'Эм, нет. Не против ещё немного подождать? Мне нужно сначала кое с чем разобраться.'),
(11289, 2, 'ruRU', 'Как продвигается твоё исследование Ока?');

-- MenuId 11304 - "Shym, I need to get to Westreach Summit"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11304 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11304, 1, 'ruRU', 'Шим, мне нужно попасть на вершину Крайнего Предела.');

-- MenuId 11316, 11319, 11320 - Tyrus Blackhorn dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11316 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11316, 0, 'ruRU', 'Да, Чернорог. Меня послали просить о твоей помощи, если ты согласен.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11319 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11319, 0, 'ruRU', 'Кто такой Тайрус Чернорог?'),
(11319, 1, 'ruRU', 'Расскажи мне о духе Эссины.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11320 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11320, 0, 'ruRU', 'Чернорог — демон?');

-- MenuId 11322 - Blackhorn redemption dialogue (continued).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11322 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11322, 0, 'ruRU', 'Когда-то ты был смертным, Чернорог. Одним из нас.'),
(11322, 1, 'ruRU', 'Тебя уничтожит, если Молот Сумерек обрушит эту гору!'),
(11322, 2, 'ruRU', 'Матокоготь верит, что тебя ещё можно спасти. Это твой шанс искупить союз с демонами.');

-- MenuId 11325, 11326 - Twilight's Hammer dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11325 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11325, 0, 'ruRU', 'Ты поможешь нам победить их?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11326 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11326, 0, 'ruRU', 'Если, конечно, от мира вообще что-то останется для твоего легиона. Молот Сумерек стремится уничтожить всё.');

-- MenuId 11339 - "We're ready! Go, Brann!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11339 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11339, 0, 'ruRU', 'Мы готовы! Вперёд, Бранн!');

-- MenuId 11373 - "Seyala, I need to get to New Thalanaar!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11373 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11373, 1, 'ruRU', 'Сейяла, мне нужно попасть в Новый Таланаар!');

-- MenuId 11379 - "Tell me about Tortolla."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11379 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11379, 0, 'ruRU', 'Расскажи мне о Тортолле.');

-- MenuId 11382 - "Instructor Devoran sends a contender against your raptor."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11382 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11382, 0, 'ruRU', 'Инструктор Деворан отправляет соперника против твоего ящера.');

-- MenuId 11384 - "Queue for The Frost Lord Ahune battle."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11384 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11384, 0, 'ruRU', 'Встать в очередь на бой с Повелителем Льда Ахуне.');

-- MenuId 11420 - "Boss, one of the boys is causing some trouble outside."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11420 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11420, 0, 'ruRU', 'Босс, один из парней что-то натворил снаружи.');

-- MenuId 11427 - "Get me into my boat, Griznak."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11427 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11427, 0, 'ruRU', 'Посади меня в мою лодку, Гризнак.');

-- MenuId 11434 - "I am ready to begin the battle against Ragnaros."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11434 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11434, 0, 'ruRU', 'Я готов начать битву с Рагнаросом.'),
(11434, 1, 'ruRU', 'Я готов начать битву с Рагнаросом.');

-- MenuId 11437 - innkeeper/vendor combo.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11437 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11437, 0, 'ruRU', 'Сделать эту гостиницу своим домом.'),
(11437, 1, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 11451, 11493, 11494, 11495 - Val'sharah shrine dialogue (shared lines across menus).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11451 AND `OptionIndex` IN (0,1,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11451, 0, 'ruRU', 'Расскажи мне о Святилище Голдринна.'),
(11451, 1, 'ruRU', 'Что происходит в Роще Эссины?'),
(11451, 2, 'ruRU', 'Чем я могу помочь Святилищу Авианы?'),
(11451, 3, 'ruRU', 'Могу ли я чем-то помочь в Святилище Малорна?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11493 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11493, 0, 'ruRU', 'Что происходит в Роще Эссины?'),
(11493, 1, 'ruRU', 'Чем я могу помочь Святилищу Авианы?'),
(11493, 2, 'ruRU', 'Могу ли я чем-то помочь в Святилище Малорна?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11494 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11494, 0, 'ruRU', 'Расскажи мне о Святилище Голдринна.'),
(11494, 1, 'ruRU', 'Чем я могу помочь Святилищу Авианы?'),
(11494, 2, 'ruRU', 'Могу ли я чем-то помочь в Святилище Малорна?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11495 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11495, 0, 'ruRU', 'Расскажи мне о Святилище Голдринна.');

-- MenuId 11461, 11462, 11463 - egg-stealing confrontation dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11461 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11461, 0, 'ruRU', '<Ослабить её.>'),
(11461, 1, 'ruRU', 'Зачем ты крадёшь яйца?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11462 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11462, 0, 'ruRU', 'Кому? Кому ты отдаёшь яйца?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11463 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11463, 0, 'ruRU', 'Выводок Хранителя Земли... ты подчиняешься чёрному дракону? Назови имя!');

-- MenuId 11464 - Thisalee harpy dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11464 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11464, 0, 'ruRU', '<Приказать Тисали убить гарпию.>'),
(11464, 1, 'ruRU', '<Попросить Тисали отпустить гарпию.>');

-- MenuId 11469 - "We are ready!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11469 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11469, 0, 'ruRU', 'Мы готовы!');

-- MenuId 11473 - "I would like to start the Blood Ritual, Lynnore."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11473 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11473, 0, 'ruRU', 'Я хотел бы начать Кровавый ритуал, Линнора.');

-- MenuId 11495, 11496 - Val'sharah shrine dialogue remainder.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11495 AND `OptionIndex` IN (1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11495, 1, 'ruRU', 'Что происходит в Роще Эссины?'),
(11495, 2, 'ruRU', 'Могу ли я чем-то помочь в Святилище Малорна?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11496 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11496, 0, 'ruRU', 'Расскажи мне о Святилище Голдринна.'),
(11496, 1, 'ruRU', 'Что происходит в Роще Эссины?'),
(11496, 2, 'ruRU', 'Чем я могу помочь Святилищу Авианы?');

-- MenuId 11524 - "On your feet, soldier..."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11524 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11524, 0, 'ruRU', 'На ноги, солдат. Древние с нами, и гора исцелена!');

-- MenuId 11528 - "I lost my turtle companion. Can I have another?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11528 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11528, 0, 'ruRU', 'Я потерял своего черепашьего спутника. Можно мне другого?');

-- MenuId 11530, 11541, 11542, 11544 - Goldrinn/Lo'Gosh dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11530 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11530, 0, 'ruRU', 'Расскажи мне о Голдринне.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11541 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11541, 0, 'ruRU', 'Расскажи мне о древнем волке, Ло''Гоше.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11542 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11542, 0, 'ruRU', 'Что с ним случилось?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11544 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11544, 0, 'ruRU', 'Да, расскажи подробнее.');

-- MenuId 11546, 11547, 11548 - Aviana dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11546 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11546, 0, 'ruRU', 'Расскажи мне об Авиане.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11547 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11547, 0, 'ruRU', 'Ты говоришь в прошедшем времени. Что с ней случилось?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11548 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11548, 0, 'ruRU', 'Что с ней стало?');

-- MenuId 11557-11562 - Gurrok captivity dialogue chain.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (11557,11558,11559,11560,11562) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11557, 0, 'ruRU', 'Как ты сюда попал?'),
(11558, 0, 'ruRU', 'Расскажи нам о своих похитителях, Геррок.'),
(11559, 0, 'ruRU', 'Ты видел Назгрима и его войска?'),
(11560, 0, 'ruRU', 'Как тебе удалось сбежать?'),
(11562, 0, 'ruRU', 'Что можешь рассказать об этих тварях, Геррок? Как нам их победить?');

-- MenuId 11569 - innkeeper dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11569 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11569, 0, 'ruRU', 'Сделать эту гостиницу своим домом.'),
(11569, 1, 'ruRU', 'Что я могу делать в гостинице?');

-- MenuId 11592 - "Mix the samples together!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11592 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11592, 1, 'ruRU', 'Смешать образцы!');

-- MenuId 11626 - "I am prepared, Erunak. Let's go!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11626 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11626, 0, 'ruRU', 'Я готов, Эрунак. Идём!');

-- MenuId 11646 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11646 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11646, 0, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 11653, 11654 - Dragonmaw map dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11653 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11653, 0, 'ruRU', 'Драконья Пасть снова может стать великой. Помоги нашему завоеванию Сумеречного нагорья - не дашь карту?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11654 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11654, 0, 'ruRU', 'Да, карту прибрежных подступов.');

-- MenuId 11659 - "Nobody shorts Garrosh Hellscream..."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11659 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11659, 0, 'ruRU', 'Никто не обманывает Гарроша Адского Крика. Доделай эти корабли - и доделай как следует - или это станет личным.');

-- MenuId 11684 - "Take me to Revantusk Village."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11684 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11684, 1, 'ruRU', 'Отвези меня в деревню Ревантуск.');

-- MenuId 11691 - "Send me ashore, Horzog."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11691 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11691, 0, 'ruRU', 'Высади меня на берег, Хорзог.');

-- MenuId 11704 - "Can I get a ride back to the fleet?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11704 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11704, 0, 'ruRU', 'Могу я вернуться на флот?');

-- MenuId 11705 - Rocketway terminus/exchange selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11705 AND `OptionIndex` IN (0,1,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11705, 0, 'ruRU', 'Южный терминал Ракетной дороги, пожалуйста.'),
(11705, 1, 'ruRU', 'Пересадочная станция Галливикса, пожалуйста.'),
(11705, 2, 'ruRU', 'Северная пересадочная станция Ракетной дороги, пожалуйста.'),
(11705, 3, 'ruRU', 'Северный терминал Ракетной дороги, пожалуйста.');

-- MenuId 11706 - "Orgrimmar Rocketway Exchange, please."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11706 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11706, 0, 'ruRU', 'Пересадочная станция Оргриммара, пожалуйста.');

-- MenuId 11706, 11708, 11709, 11710 - Rocketway terminus/exchange selection remainder.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11706 AND `OptionIndex` IN (1,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11706, 1, 'ruRU', 'Пересадочная станция Галливикса, пожалуйста.'),
(11706, 2, 'ruRU', 'Северная пересадочная станция Ракетной дороги, пожалуйста.'),
(11706, 3, 'ruRU', 'Северный терминал Ракетной дороги, пожалуйста.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11708 AND `OptionIndex` IN (0,1,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11708, 0, 'ruRU', 'Пересадочная станция Оргриммара, пожалуйста.'),
(11708, 1, 'ruRU', 'Северная пересадочная станция Ракетной дороги, пожалуйста.'),
(11708, 2, 'ruRU', 'Южный терминал Ракетной дороги, пожалуйста.'),
(11708, 3, 'ruRU', 'Северный терминал Ракетной дороги, пожалуйста.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11709 AND `OptionIndex` IN (0,1,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11709, 0, 'ruRU', 'Северный терминал Ракетной дороги, пожалуйста.'),
(11709, 1, 'ruRU', 'Пересадочная станция Галливикса, пожалуйста.'),
(11709, 2, 'ruRU', 'Пересадочная станция Оргриммара, пожалуйста.'),
(11709, 3, 'ruRU', 'Южный терминал Ракетной дороги, пожалуйста.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11710 AND `OptionIndex` IN (0,1,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11710, 0, 'ruRU', 'Северная пересадочная станция Ракетной дороги, пожалуйста.'),
(11710, 1, 'ruRU', 'Пересадочная станция Галливикса, пожалуйста.'),
(11710, 2, 'ruRU', 'Пересадочная станция Оргриммара, пожалуйста.'),
(11710, 3, 'ruRU', 'Южный терминал Ракетной дороги, пожалуйста.');

-- MenuId 11707 - "Our warriors are dying..."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11707 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11707, 0, 'ruRU', 'Наши воины гибнут. Есть ли у тебя медикаменты, которые я мог бы забрать с собой?');

-- MenuId 11719 - "Take me to the battle at the Ruins of Feathermoon."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11719 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11719, 1, 'ruRU', 'Отведи меня к битве у руин Перолунья.');

-- MenuId 11727 - "I hear you've got some drinks I can buy, Slim."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11727 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11727, 0, 'ruRU', 'Слышал, у тебя есть напитки на продажу, Слим.');

-- MenuId 11743 - "What've you got?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11743 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11743, 1, 'ruRU', 'Что у тебя есть?');

-- MenuId 11745 - "You're the boss."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11745 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11745, 0, 'ruRU', 'Ты здесь главный.');

-- MenuId 11757, 11758 - warrior/shaman weapon-choice dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11757 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11757, 0, 'ruRU', 'Сражайся со мной! Возьми этот клинок и стань воином.'),
(11757, 1, 'ruRU', 'Поддерживай и исцеляй меня! Возьми этот боевой молот и стань шаманом.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11758 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11758, 0, 'ruRU', 'Сражайся со мной! Возьми этот клинок и стань воином.'),
(11758, 1, 'ruRU', 'Поддерживай и исцеляй меня! Возьми этот боевой молот и стань шаманом.');

-- MenuId 11764 - innkeeper "Make this inn your home."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11764 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11764, 0, 'ruRU', 'Сделать эту гостиницу своим домом.');

-- MenuId 11766 - "I would like to train."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11766 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11766, 0, 'ruRU', 'Я хотел бы обучиться.');

-- MenuId 11778 - "Show me what you have for sale."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11778 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11778, 0, 'ruRU', 'Покажи мне, что у тебя есть на продажу.');

-- MenuId 11781 - "I would like to go to the battleground."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11781 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11781, 0, 'ruRU', 'Я хочу отправиться на Поле Боя.');

-- MenuId 11793 - warrior trainer dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11793 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11793, 0, 'ruRU', 'Мне нужно обучение воина.'),
(11793, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 11801 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11801 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11801, 0, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 11804-11807 - Orgrimmar skyway cult-infiltration dialogue chain.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (11804,11805,11806,11807) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11804, 0, 'ruRU', 'Тайный культ проник в небесный путь Оргриммара?'),
(11805, 0, 'ruRU', 'Я не говорил про Молот Сумерек. Это ТЫ сказал про Молот Сумерек.'),
(11806, 0, 'ruRU', 'Я знаю всё о твоём хозяине из культа.'),
(11807, 0, 'ruRU', 'Значит, это правда? Сауранок ДЕЙСТВИТЕЛЬНО виновен в измене!');

-- MenuId 11829, 11875, 11879 - trainer "teach me" dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11829 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11829, 0, 'ruRU', 'Я ищу обучения друида.'),
(11829, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11875 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11875, 0, 'ruRU', 'Мне нужно обучение воина.'),
(11875, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11879 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11879, 0, 'ruRU', 'Я ищу обучения путям охотника.'),
(11879, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 11832 - "This is terrible, Durak!..."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11832 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11832, 0, 'ruRU', 'Это ужасно, Дурак! Адский Крик уверен, что за нашей работой здесь стоит демон! Что нам делать?!');

-- MenuId 11839, 11841, 11843 - Stormwind district service selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11839 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11839, 0, 'ruRU', 'Аукционный дом Торгового квартала'),
(11839, 1, 'ruRU', 'Аукционный дом Дворфийского квартала');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11841 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11841, 0, 'ruRU', 'Банк Торгового квартала'),
(11841, 1, 'ruRU', 'Банк Дворфийского квартала');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11843 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11843, 0, 'ruRU', 'Трактир Торгового квартала'),
(11843, 1, 'ruRU', 'Трактир Дворфийского квартала');

-- MenuId 11845 - Stormwind landmark selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11845 AND `OptionIndex` IN (0,2,3,4,5) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11845, 0, 'ruRU', 'Чертог чемпионов'),
(11845, 2, 'ruRU', 'Львиный покой'),
(11845, 3, 'ruRU', 'Острог'),
(11845, 4, 'ruRU', 'Гавань Штормграда'),
(11845, 5, 'ruRU', 'Крепость Штормграда');

-- MenuId 11846 - stable master selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11846 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11846, 0, 'ruRU', 'Смотритель стойл Старого города'),
(11846, 1, 'ruRU', 'Смотритель стойл Дворфийского квартала');

-- MenuId 11848 - service hub list.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11848 AND `OptionIndex` IN (0,1,2,3,4,5) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11848, 0, 'ruRU', 'Аукционный дом'),
(11848, 1, 'ruRU', 'Укротитель грифонов'),
(11848, 2, 'ruRU', 'Интенданты Доблести и Справедливости'),
(11848, 3, 'ruRU', 'Интенданты Чести и Завоевания'),
(11848, 4, 'ruRU', 'Коневод'),
(11848, 5, 'ruRU', 'Тренер профессии');

-- MenuId 11855 - hunter trainer selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11855 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11855, 0, 'ruRU', 'Тренер охотников Дворфийского квартала'),
(11855, 1, 'ruRU', 'Тренер охотников Старого города');

-- MenuId 11874 - "Come with me, your highness."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11874 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11874, 0, 'ruRU', 'Идём со мной, ваше высочество.'),
(11874, 1, 'ruRU', 'Идём со мной, ваше высочество.');

-- MenuId 11877 - druidic training dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11877 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11877, 0, 'ruRU', 'Я ищу дальнейшего обучения друидизму, чтобы лучше понять волю Матери-Земли.'),
(11877, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 11892 - "I need to take a bat to the Dawning Isles."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11892 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11892, 0, 'ruRU', 'Мне нужно долететь на нетопыре до Островов Рассвета.');

-- MenuId 11909 - "It's over, Samuelson..."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11909 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11909, 0, 'ruRU', 'Всё кончено, Самуэльсон. Мы знаем, кто ты, и я положил конец твоей маленькой афере с собором.');

-- MenuId 11912 - "I require warrior training."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11912 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11912, 0, 'ruRU', 'Мне нужно обучение воина.');

-- MenuId 11912(remainder), 11913, 11932 - trainer "teach me" dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11912 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11912, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11913 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11913, 0, 'ruRU', 'Я ищу обучения путям охотника.'),
(11913, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11932 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11932, 0, 'ruRU', 'Меня интересует обучение колдовству.'),
(11932, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 11919 - innkeeper "Make this inn your home."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11919 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11919, 0, 'ruRU', 'Сделать эту гостиницу своим домом.');

-- MenuId 11933 - "I am interested in mage training."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11933 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11933, 0, 'ruRU', 'Меня интересует обучение магии.');

-- MenuId 11934, 11936 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11934 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11934, 1, 'ruRU', 'Я хотел бы купить у тебя.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11936 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11936, 1, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 11969 - service hub list.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11969 AND `OptionIndex` IN (0,1,2,3,4,5,6,7) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11969, 0, 'ruRU', 'Аукционный дом'),
(11969, 1, 'ruRU', 'Банк'),
(11969, 2, 'ruRU', 'Тренер класса'),
(11969, 3, 'ruRU', 'Трактир'),
(11969, 4, 'ruRU', 'Почтовый ящик'),
(11969, 5, 'ruRU', 'Тренер профессии'),
(11969, 6, 'ruRU', 'Смотритель стойл'),
(11969, 7, 'ruRU', 'Торговец');

-- MenuId 11971 - "I'm looking for a lost companion."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11971 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11971, 1, 'ruRU', 'Я ищу пропавшего спутника.');

-- MenuId 11976 - class-trainer selection (full list).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11976 AND `OptionIndex` IN (0,1,2,3,4,5,6,7) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11976, 0, 'ruRU', 'Друид'),
(11976, 1, 'ruRU', 'Охотник'),
(11976, 2, 'ruRU', 'Маг и портал'),
(11976, 3, 'ruRU', 'Жрец'),
(11976, 4, 'ruRU', 'Разбойник'),
(11976, 5, 'ruRU', 'Шаман'),
(11976, 6, 'ruRU', 'Колдун'),
(11976, 7, 'ruRU', 'Воин');

-- MenuId 11977 - profession-trainer selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11977 AND `OptionIndex` IN (0,1,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11977, 0, 'ruRU', 'Кулинария'),
(11977, 1, 'ruRU', 'Травничество'),
(11977, 2, 'ruRU', 'Начертание'),
(11977, 3, 'ruRU', 'Рыбная ловля');

-- MenuId 11978 - vendor category selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11978 AND `OptionIndex` IN (0,1,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11978, 0, 'ruRU', 'Товары общего назначения'),
(11978, 1, 'ruRU', 'Яды и реагенты'),
(11978, 2, 'ruRU', 'Змеи-питомцы'),
(11978, 3, 'ruRU', 'Торговые принадлежности');

-- MenuId 11996 - "I wish to browse your wares."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11996 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11996, 0, 'ruRU', 'Я хочу посмотреть твои товары.');

-- MenuId 12010, 12048, 12052 - trainer "teach me" dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12010 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12010, 0, 'ruRU', 'Я ищу дальнейшего обучения жреческим путям.'),
(12010, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12048 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12048, 0, 'ruRU', 'Я ищу обучения путям охотника.'),
(12048, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12052 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12052, 0, 'ruRU', 'Научи меня путям духов.'),
(12052, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12012, 12014 - repair/supplies vendor dialogue (same two lines, reversed order).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12012 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12012, 0, 'ruRU', 'У тебя есть припасы?'),
(12012, 1, 'ruRU', 'Можешь починить снаряжение?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12014 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12014, 0, 'ruRU', 'Можешь починить снаряжение?'),
(12014, 1, 'ruRU', 'У тебя есть припасы?');

-- MenuId 12019, 12056 - "I wish to browse your wares."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12019 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12019, 0, 'ruRU', 'Я хочу посмотреть твои товары.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12056 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12056, 0, 'ruRU', 'Я хочу посмотреть твои товары.');

-- MenuId 12025 - innkeeper "Make this inn your home."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12025 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12025, 0, 'ruRU', 'Сделать эту гостиницу своим домом.');

-- MenuId 12040 - innkeeper/vendor combo.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12040 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12040, 0, 'ruRU', 'Сделать эту гостиницу своим домом.'),
(12040, 1, 'ruRU', 'Дай мне посмотреть твои товары.');

-- MenuId 12045 - full profession-trainer list (11 professions).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12045 AND `OptionIndex` BETWEEN 0 AND 10 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12045, 0, 'ruRU', 'Алхимия'),
(12045, 1, 'ruRU', 'Кузнечное дело'),
(12045, 2, 'ruRU', 'Создание чар'),
(12045, 3, 'ruRU', 'Инженерное дело'),
(12045, 4, 'ruRU', 'Травничество'),
(12045, 5, 'ruRU', 'Начертание'),
(12045, 6, 'ruRU', 'Ювелирное дело'),
(12045, 7, 'ruRU', 'Кожевничество'),
(12045, 8, 'ruRU', 'Горное дело'),
(12045, 9, 'ruRU', 'Снятие шкур'),
(12045, 10, 'ruRU', 'Портняжное дело');

-- MenuId 12046 - secondary skill selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12046 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12046, 0, 'ruRU', 'Кулинария'),
(12046, 1, 'ruRU', 'Первая помощь'),
(12046, 2, 'ruRU', 'Рыбная ловля');

-- MenuId 12050 - "I require rogue training."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12050 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12050, 0, 'ruRU', 'Мне нужно обучение разбойника.');

-- MenuId 12094 - reforging dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12094 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12094, 0, 'ruRU', 'Перековать предмет.'),
(12094, 1, 'ruRU', 'Что такое перековка?');

-- MenuId 12101 - innkeeper "Make this inn your home."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12101 AND `OptionIndex` = 2 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12101, 2, 'ruRU', 'Сделать эту гостиницу своим домом.');

-- MenuId 12106 - pet stable dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12106 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12106, 0, 'ruRU', 'Я хотел бы оставить питомца в стойле здесь.'),
(12106, 1, 'ruRU', 'Я ищу пропавшего спутника.');

-- MenuId 12125 - "Could you please send me to Moonglade, Emissary?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12125 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12125, 0, 'ruRU', 'Не мог бы ты отправить меня в Лунную поляну, посланник?');

-- MenuId 12151, 12233 - trainer "teach me" dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12151 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12151, 0, 'ruRU', 'Мне нужно обучение воина.'),
(12151, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12233 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12233, 0, 'ruRU', 'Меня интересует обучение магии.'),
(12233, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12167 - Val'sharah shrine dialogue remainder.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12167 AND `OptionIndex` IN (1,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12167, 1, 'ruRU', 'Что происходит в Роще Эссины?'),
(12167, 2, 'ruRU', 'Чем я могу помочь Святилищу Авианы?'),
(12167, 3, 'ruRU', 'Могу ли я чем-то помочь в Святилище Малорна?');

-- MenuId 12180, 12185, 12186, 12190, 12192, 12195, 12198 - "Train me in X" profession dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12180 AND `OptionIndex` IN (1,3,6,8) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12180, 1, 'ruRU', 'Обучи меня кузнечному делу.'),
(12180, 3, 'ruRU', 'Обучи меня инженерному делу.'),
(12180, 6, 'ruRU', 'Обучи меня ювелирному делу.'),
(12180, 8, 'ruRU', 'Обучи меня горному делу.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12185 AND `OptionIndex` IN (3,8) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12185, 3, 'ruRU', 'Обучи меня инженерному делу.'),
(12185, 8, 'ruRU', 'Обучи меня горному делу.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12186 AND `OptionIndex` IN (3,8) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12186, 3, 'ruRU', 'Обучи меня инженерному делу.'),
(12186, 8, 'ruRU', 'Обучи меня горному делу.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12190 AND `OptionIndex` = 9 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12190, 9, 'ruRU', 'Обучи меня снятию шкур.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12192 AND `OptionIndex` = 8 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12192, 8, 'ruRU', 'Обучи меня горному делу.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12195 AND `OptionIndex` = 8 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12195, 8, 'ruRU', 'Обучи меня горному делу.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12198 AND `OptionIndex` = 9 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12198, 9, 'ruRU', 'Обучи меня снятию шкур.');

-- MenuId 12231 - "I'm ready. Let's go!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12231 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12231, 0, 'ruRU', 'Я готов. Идём!');

-- MenuId 12235 - "Please teach me."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12235 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12235, 0, 'ruRU', 'Пожалуйста, научи меня.');

-- MenuId 12243 - "Teldrassil or the Exodar in Kalimdor"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12243 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12243, 1, 'ruRU', 'Тельдрассил или Экзодар в Калимдоре');

-- MenuId 12245 - expansion/zone destination list.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12245 AND `OptionIndex` BETWEEN 0 AND 8 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12245, 0, 'ruRU', 'Громовой Утёс в Мулгоре'),
(12245, 1, 'ruRU', 'Подземный Город или Луносвет в Восточных королевствах'),
(12245, 2, 'ruRU', 'Тернистая долина в Восточных королевствах'),
(12245, 3, 'ruRU', 'Полуостров Адского Пламени в Запределье'),
(12245, 4, 'ruRU', 'Борейская тундра в Нордсколе'),
(12245, 5, 'ruRU', 'Земли, открытые Катаклизмом'),
(12245, 6, 'ruRU', 'Медовая Роса в Пандарии'),
(12245, 7, 'ruRU', 'Выжженные земли и портал в Дренор'),
(12245, 8, 'ruRU', 'Даларан над Расколотыми островами');

-- MenuId 12268 - "Show me your wares, quartermaster."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12268 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12268, 0, 'ruRU', 'Покажи мне свои товары, интендант.');

-- MenuId 12272, 12273 - Azurelode Mine quest-redirect flavor dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12272 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12272, 0, 'ruRU', 'Подожди-ка. Похоже, кое-что появилось. Да, вот здесь, на этом листе бумаги. Тебе нужно отправиться на юго-восток, к руднику Лазурной Жилы, и доложиться капитану Кейтону. Юго-восток вон там *ты указываешь на юго-восток*.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12273 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12273, 0, 'ruRU', 'Может, тебе стоит пойти вздремнуть или вроде того. Не знаю, найдётся ли для тебя работа.');

-- MenuId 12274-12279 - comedic quest-redirect dialogue chain (Westfall-style).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (12274,12275,12276,12277,12278,12279) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12274, 0, 'ruRU', 'Хорошо, спасибо. Просто иди на юго-восток. Больше на юг, чем на восток. Наверное, у побережья.'),
(12275, 0, 'ruRU', 'Ничего.'),
(12276, 0, 'ruRU', 'Эм... Похоже, в Южнобережье какие-то проблемы. Что-то связанное с мятежниками-воргенами. Может, поможешь с ними?'),
(12277, 0, 'ruRU', 'ЭТО ВСЁ, ДЖОННИ КРУТЫШКА. БЕРИ ИЛИ УХОДИ!'),
(12278, 0, 'ruRU', 'Это всё.'),
(12279, 0, 'ruRU', 'Что ж, у нас проблемы на Илистых полях, к северо-востоку отсюда. Смотрителю Стилуотеру пригодилась бы твоя помощь.');

-- MenuId 12299 - "I'm ready to press up the canyon. Is the Gob Squad prepped?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12299 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12299, 0, 'ruRU', 'Я готов идти вверх по каньону. Гоблинский отряд готов?');

-- MenuId 12301 - "I am ready to fight Torth!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12301 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12301, 0, 'ruRU', 'Я готов сразиться с Тортом!');

-- MenuId 12341, 12344, 12540 - trainer "teach me" dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12341 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12341, 0, 'ruRU', 'Я ищу обучения путям охотника.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12344 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12344, 0, 'ruRU', 'Мне нужно обучение воина.'),
(12344, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12540 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12540, 0, 'ruRU', 'Я ищу обучения путям охотника.');

-- MenuId 12343 - "I am ready, Uchek!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12343 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12343, 0, 'ruRU', 'Я готов, Учек!');

-- MenuId 12371, 12376 - hide-gathering quest dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12371 AND `OptionIndex` = 2 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12371, 2, 'ruRU', 'Исследовать шкуры.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12376 AND `OptionIndex` = 2 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12376, 2, 'ruRU', 'Я принёс тебе шкуры, грязь и нитки.');

-- MenuId 12410 - generic trainer "Train me."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12410 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12410, 0, 'ruRU', 'Обучи меня.');

-- MenuId 12414, 12415, 12416 - "Talk...."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (12414,12415,12416) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12414, 0, 'ruRU', 'Говорить...'),
(12415, 0, 'ruRU', 'Говорить...'),
(12416, 0, 'ruRU', 'Говорить...');

-- MenuId 12439, 12449 - vendor dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12439 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12439, 0, 'ruRU', 'Я хотел бы купить у тебя.'),
(12439, 1, 'ruRU', 'Я хотел бы купить у тебя.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12449 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12449, 0, 'ruRU', 'Я хочу купить у тебя, Дерак.');

-- MenuId 12516, 12527 - "ways of the Light" training dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12516 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12516, 0, 'ruRU', 'Я хотел бы продолжить обучение путям Света.'),
(12516, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12527 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12527, 0, 'ruRU', 'Я хотел бы продолжить обучение путям Света.'),
(12527, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12521, 12522 - mage/warlock training dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12521 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12521, 0, 'ruRU', 'Меня интересует обучение магии.'),
(12521, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12522 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12522, 0, 'ruRU', 'Меня интересует обучение колдовству.'),
(12522, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12529 - "Teach me the ways of the spirits."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12529 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12529, 0, 'ruRU', 'Научи меня путям духов.');

-- MenuId 12537, 12539 - training dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12537 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12537, 0, 'ruRU', 'Я хотел бы обучиться.'),
(12537, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12539 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12539, 0, 'ruRU', 'Я ищу обучения друида.'),
(12539, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12540(remainder) - unlearn.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12540 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12540, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12541 - "Come little guy, let's get out of here."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12541 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12541, 0, 'ruRU', 'Идём, малыш, выбираемся отсюда.');

-- MenuId 12549, 12550, 12551 - Grim Guzzler elevator-button dialogue (shared lines).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12549 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12549, 0, 'ruRU', 'Нажать кнопку с надписью «Сразу за Мрачным Пожирателем».'),
(12549, 1, 'ruRU', 'Нажать кнопку с надписью «В жилище».');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12550 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12550, 0, 'ruRU', 'Нажать кнопку с надписью «Вход».'),
(12550, 1, 'ruRU', 'Нажать кнопку с надписью «В жилище».');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12551 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12551, 0, 'ruRU', 'Нажать кнопку с надписью «Вход».'),
(12551, 1, 'ruRU', 'Нажать кнопку с надписью «Сразу за Мрачным Пожирателем».');

-- MenuId 12579, 12580 - "Teach me the ways of the spirits."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12579 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12579, 0, 'ruRU', 'Научи меня путям духов.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12580 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12580, 0, 'ruRU', 'Научи меня путям духов.'),
(12580, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12606 - mage training dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12606 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12606, 0, 'ruRU', 'Меня интересует обучение магии.'),
(12606, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12609, 12613 - "I am ready."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12609 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12609, 0, 'ruRU', 'Я готов.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12613 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12613, 0, 'ruRU', 'Я готов.');

-- MenuId 12637, 12638, 12639 - Orgrimmar valley selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (12637,12638,12639) AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12637, 0, 'ruRU', 'Долина Силы'),
(12637, 1, 'ruRU', 'Долина Чести'),
(12638, 0, 'ruRU', 'Долина Силы'),
(12638, 1, 'ruRU', 'Долина Чести'),
(12639, 0, 'ruRU', 'Долина Силы'),
(12639, 1, 'ruRU', 'Долина Чести');

-- MenuId 12642 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12642 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12642, 0, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 12646 - elevator floor selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12646 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12646, 0, 'ruRU', 'Вызвать лифт на первый этаж.'),
(12646, 1, 'ruRU', 'Вызвать лифт на второй этаж.'),
(12646, 2, 'ruRU', 'Вызвать лифт на третий этаж.');

-- MenuId 12669 - instance-wing destination selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12669 AND `OptionIndex` IN (0,1,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12669, 0, 'ruRU', 'Можешь отвести меня в Великий зал?'),
(12669, 1, 'ruRU', 'Можешь отвести меня в Часовню?'),
(12669, 2, 'ruRU', 'Можешь отвести меня на Бастионы?'),
(12669, 3, 'ruRU', 'Можешь отвести меня в Лабораторию?');

-- MenuId 12677 - Duskhaven amnesia dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12677 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12677, 0, 'ruRU', 'Я мало что помню о том, как попал в Сумеречную Гавань. Расскажи, что знаешь.'),
(12677, 1, 'ruRU', 'Сделать эту гостиницу своим домом.');

-- MenuId 12701 - "Umm... Pebblebitty... the gate is open."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12701 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12701, 0, 'ruRU', 'Эм... Пебблбитти... ворота открыты.');

-- MenuId 12714 - training dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12714 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12714, 0, 'ruRU', 'Я хотел бы обучиться.'),
(12714, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12716 - "I seek further training."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12716 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12716, 0, 'ruRU', 'Я ищу дальнейшего обучения.');

-- MenuId 12716(remainder) - unlearn.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12716 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12716, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12717 - "I'm ready to fly, let's bomb the Undercity!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12717 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12717, 0, 'ruRU', 'Я готов лететь, бомбим Подземный Город!');

-- MenuId 12744 - "Im ready. Lets go"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12744 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12744, 0, 'ruRU', 'Я готов. Идём');

-- MenuId 12746 - training dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12746 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12746, 0, 'ruRU', 'Обучи меня.'),
(12746, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12754 - "Im ready to ride"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12754 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12754, 0, 'ruRU', 'Я готов ехать');

-- MenuId 12755 - druid training dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12755 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12755, 0, 'ruRU', 'Я ищу обучения друида.'),
(12755, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12760 - "I am ready to meet with Anachronos, Ziradormi."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12760 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12760, 0, 'ruRU', 'Я готов встретиться с Анахроносом, Зирадорми.');

-- MenuId 12761 - "Let me see what you have for sale."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12761 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12761, 0, 'ruRU', 'Покажи мне, что у тебя есть на продажу.');

-- MenuId 12762 - "I am prepared to face Nemesis, Tooga."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12762 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12762, 0, 'ruRU', 'Я готов встретиться с Немезидой, Туга.');

-- MenuId 12795 - "What can you tell me about these spiders?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12795 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12795, 0, 'ruRU', 'Что ты можешь рассказать об этих пауках?');

-- MenuId 12797 - "We're ready to open the gates."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12797 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12797, 0, 'ruRU', 'Мы готовы открыть ворота.');

-- MenuId 12799 - "How are we doing in the battle?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12799 AND `OptionIndex` IN (2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12799, 2, 'ruRU', 'Как у нас дела в бою?'),
(12799, 3, 'ruRU', 'Как у нас дела в бою?');

-- MenuId 12800, 12802, 12805, 12807 - captivity-release dialogue chain.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (12800,12802,12805,12807) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12800, 0, 'ruRU', 'Налоракк мёртв, ты свободен.'),
(12802, 0, 'ruRU', 'Путь свободен. Ты свободен!'),
(12805, 0, 'ruRU', 'Мы убили твоих похитителей. Ты свободен.'),
(12807, 0, 'ruRU', 'Должно быть, тебя чем-то опоили. Теперь безопасно.');

-- MenuId 12821 - warlock training dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12821 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12821, 0, 'ruRU', 'Меня интересует обучение колдовству.'),
(12821, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12833 - "How do I get out of here?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12833 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12833, 0, 'ruRU', 'Как мне отсюда выбраться?');

-- MenuId 12836, 12837 - "Present the Smoke-Stained Locket."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12836 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12836, 0, 'ruRU', 'Предъявить закопчённый медальон.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12837 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12837, 0, 'ruRU', 'Предъявить закопчённый медальон.');

-- MenuId 12855 - class-trainer selection (8 classes).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12855 AND `OptionIndex` IN (0,1,2,3,4,5,6,7) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12855, 0, 'ruRU', 'Охотник'),
(12855, 1, 'ruRU', 'Маг'),
(12855, 2, 'ruRU', 'Паладин'),
(12855, 3, 'ruRU', 'Жрец'),
(12855, 4, 'ruRU', 'Разбойник'),
(12855, 5, 'ruRU', 'Шаман'),
(12855, 6, 'ruRU', 'Колдун'),
(12855, 7, 'ruRU', 'Воин');

-- MenuId 12865 - profession-trainer selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12865 AND `OptionIndex` IN (0,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12865, 0, 'ruRU', 'Алхимия'),
(12865, 2, 'ruRU', 'Кузнечное дело'),
(12865, 3, 'ruRU', 'Кулинария');

-- MenuId 12865 - profession-trainer selection remainder.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12865 AND `OptionIndex` IN (4,5,6,7,8,9,10,11,12,14,15) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12865, 4, 'ruRU', 'Создание чар'),
(12865, 5, 'ruRU', 'Инженерное дело'),
(12865, 6, 'ruRU', 'Первая помощь'),
(12865, 7, 'ruRU', 'Рыбная ловля'),
(12865, 8, 'ruRU', 'Травничество'),
(12865, 9, 'ruRU', 'Начертание'),
(12865, 10, 'ruRU', 'Ювелирное дело'),
(12865, 11, 'ruRU', 'Кожевничество'),
(12865, 12, 'ruRU', 'Горное дело'),
(12865, 14, 'ruRU', 'Снятие шкур'),
(12865, 15, 'ruRU', 'Портняжное дело');

-- MenuId 12880, 12887 - trainer dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12880 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12880, 0, 'ruRU', 'Мне нужно обучение, Кренк.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12887 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12887, 0, 'ruRU', 'Обучи меня.');

-- MenuId 12890 - "What occasion brings you to our home town, drake?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12890 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12890, 0, 'ruRU', 'Что привело тебя в наш родной город, дракончик?');

-- MenuId 12897 - "What more can you tell me about these fire hawks?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12897 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12897, 0, 'ruRU', 'Что ещё ты можешь рассказать об этих огненных ястребах?');

-- MenuId 12911 - "Tell me about the ancient, Malorne."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12911 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12911, 0, 'ruRU', 'Расскажи мне о древнем, Малорне.');

-- MenuId 12918 - "I am interested in mage training."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12918 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12918, 0, 'ruRU', 'Меня интересует обучение магии.');

-- MenuId 12920, 12927 - priest/druid training dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12920 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12920, 0, 'ruRU', 'Мне нужно обучение жреца.'),
(12920, 1, 'ruRU', 'Я хочу забыть свои таланты.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12927 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12927, 0, 'ruRU', 'Я ищу дальнейшего обучения друидизму, чтобы лучше понять волю Матери-Земли.'),
(12927, 1, 'ruRU', 'Я хочу забыть свои таланты.');

-- MenuId 12939 - "Wait no longer, I'm ready to fight."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12939 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12939, 0, 'ruRU', 'Хватит ждать, я готов сражаться.');

-- MenuId 12941, 12949 - auction browsing dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12941 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12941, 0, 'ruRU', 'Я хотел бы посмотреть лоты аукциона.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12949 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12949, 1, 'ruRU', 'Покажи мне лоты аукциона.');

-- MenuId 12950, 12951 - Aggra/totems dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12950 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12950, 0, 'ruRU', 'Эм, Агра... разве тебе не следует быть рядом с Траллом?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12951 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12951, 0, 'ruRU', 'Не забудь свои тотемы!');

-- MenuId 12972, 12973, 12977, 12979, 12981 - lore-dialogue fragments.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (12972,12973,12977,12979,12981) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12972, 0, 'ruRU', 'Нет, расскажи подробнее!'),
(12973, 0, 'ruRU', 'Что произошло во время Войны древних?'),
(12977, 0, 'ruRU', 'Кажется, я понимаю. Спасибо.'),
(12979, 0, 'ruRU', 'Увлекательно.'),
(12981, 0, 'ruRU', 'Мне жаль это слышать.');

-- MenuId 12991, 12992 - Darkmoon Faire dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12991 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12991, 0, 'ruRU', 'Я готов.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 12992 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(12992, 0, 'ruRU', 'Отведи меня к месту проведения ярмарки.');

-- MenuId 13012 - Darkmoon Faire Ring Toss; color token preserved.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13012 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13012, 0, 'ruRU', 'Как играть в Бросок колец?'),
(13012, 1, 'ruRU', 'Готов играть! |cFF0008E8(Жетон ярмарки Новолуния)|r'),
(13012, 2, 'ruRU', 'Готов играть! |cFF0008E8(Жетон ярмарки Новолуния)|r');

-- MenuId 13013, 13014, 13015 - misc dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13013 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13013, 0, 'ruRU', 'Я понимаю.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13014 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13014, 0, 'ruRU', 'Обучи меня.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13015 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13015, 0, 'ruRU', 'Да, Тралл.');

-- MenuId 13018 - "How do I play Whack-a-Gnoll?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13018 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13018, 0, 'ruRU', 'Как играть в Ударь гнолла?');

-- MenuId 13018(remainder), 13019 - Darkmoon Faire games; color token preserved.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13018 AND `OptionIndex` IN (1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13018, 1, 'ruRU', 'Готов ударить! |cFF0008E8(Жетон ярмарки Новолуния)|r'),
(13018, 2, 'ruRU', 'Готов ударить! |cFF0008E8(Жетон ярмарки Новолуния)|r');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13019 AND `OptionIndex` IN (0,1,2) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13019, 0, 'ruRU', 'Как играть в Испытание на танке?'),
(13019, 1, 'ruRU', 'Готов играть! |cFF0008E8(Жетон ярмарки Новолуния)|r'),
(13019, 2, 'ruRU', 'Готов играть! |cFF0008E8(Жетон ярмарки Новолуния)|r');

-- MenuId 13047 - "I'd like to travel by air."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13047 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13047, 0, 'ruRU', 'Я хотел бы полететь по воздуху.');

-- MenuId 13063 - "Yes Thrall, lets do this!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13063 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13063, 0, 'ruRU', 'Да, Тралл, сделаем это!');

-- MenuId 13065, 13066, 13068 - "I understand."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (13065,13066,13068) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13065, 0, 'ruRU', 'Я понимаю.'),
(13066, 0, 'ruRU', 'Я понимаю.'),
(13068, 0, 'ruRU', 'Я понимаю.');

-- MenuId 13111 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13111 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13111, 0, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 13162 - "I am ready to be hidden by your shadowcloak."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13162 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13162, 0, 'ruRU', 'Я готов, чтобы меня скрыл твой теневой плащ.');

-- MenuId 13163, 13164 - "Let's go!" / "Lead the way."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13163 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13163, 0, 'ruRU', 'Идём!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13164 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13164, 0, 'ruRU', 'Веди.');

-- MenuId 13183 - "Yes Thrall."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13183 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13183, 0, 'ruRU', 'Да, Тралл.');

-- MenuId 13210 - "No thank you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13210 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13210, 1, 'ruRU', 'Нет, спасибо.');

-- MenuId 13294, 13295 - "We defeated the Destroyer!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13294 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13294, 0, 'ruRU', 'Мы победили Разрушителя!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13295 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13295, 0, 'ruRU', 'Немыслимо! Он просто не может быть жив!');

-- MenuId 13321 - Caverns of Time wing selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13321 AND `OptionIndex` IN (0,1,2,3,4,5,9) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13321, 0, 'ruRU', 'Преддверие Времени'),
(13321, 1, 'ruRU', 'Рубиновое святилище драконов'),
(13321, 2, 'ruRU', 'Изумрудное святилище драконов'),
(13321, 3, 'ruRU', 'Лазурное святилище драконов'),
(13321, 4, 'ruRU', 'Обсидиановое святилище драконов'),
(13321, 5, 'ruRU', 'Рубиновое святилище драконов'),
(13321, 9, 'ruRU', 'Бронзовое святилище драконов');

-- MenuId 13326 - Well of Eternity teleport dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13326 AND `OptionIndex` IN (5,7) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13326, 5, 'ruRU', 'Телепортировать во дворец Азшары.'),
(13326, 7, 'ruRU', 'Телепортировать к Колодцу Вечности.');

-- MenuId 13352 - cannon teleport dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13352 AND `OptionIndex` IN (0,7) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13352, 0, 'ruRU', 'Телепортируй меня к пушке.'),
(13352, 7, 'ruRU', 'Мне не нужен телепорт.');

-- MenuId 13356 - "I humbly request that the Dragon Aspects provide no aid..."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13356 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13356, 0, 'ruRU', 'Я почтительно прошу Аспектов драконов не оказывать помощь ни мне, ни моим товарищам-искателям приключений. Пусть они беспокоятся о своих проблемах, а мы - о своих.');

-- MenuId 13357 - "We will become legend."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13357 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13357, 0, 'ruRU', 'Мы станем легендой.');

-- MenuId 13360, 13362 - time-travel dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13360 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13360, 0, 'ruRU', 'Я готов отправиться назад во времени - к Колодцу Вечности.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13362 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13362, 0, 'ruRU', 'Я готов помочь Траллу, вернувшись в своё время.');

-- MenuId 13373, 13376 - Kalecgos dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13373 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13373, 0, 'ruRU', 'У нас получилось, Калекгос.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13376 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13376, 0, 'ruRU', 'Ты из бронзового клана, ты знаешь, что будет дальше! Может, просто перенесёшь нас сразу к настоящему действию?');

-- MenuId 13390 - "Show me, dragon."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13390 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13390, 0, 'ruRU', 'Покажи мне, дракон.');

-- MenuId 13405, 13406 - garden-entrance teleport dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13405 AND `OptionIndex` IN (0,5) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13405, 0, 'ruRU', 'Телепортировать ко входу в сад.'),
(13405, 5, 'ruRU', 'Телепортировать во дворец Азшары.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13406 AND `OptionIndex` IN (0,5) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13406, 0, 'ruRU', 'Телепортировать ко входу в сад.'),
(13406, 5, 'ruRU', 'Телепортировать во дворец Азшары.');

-- MenuId 13406(remainder) - Well of Eternity teleport.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13406 AND `OptionIndex` = 7 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13406, 7, 'ruRU', 'Телепортировать к Колодцу Вечности.');

-- MenuId 13411 - "I humbly request that the Dragon Aspects provide no aid..." (same as 13356).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13411 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13411, 0, 'ruRU', 'Я почтительно прошу Аспектов драконов не оказывать помощь ни мне, ни моим товарищам-искателям приключений. Пусть они беспокоятся о своих проблемах, а мы - о своих.');

-- MenuId 13691 - Fire Lotus Incense dialogue; \n preserved.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 13691 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(13691, 0, 'ruRU', 'Что ж, ты не можешь просто оставаться здесь! Ты не оставляешь мне выбора!\n<Использовать благовоние огненного лотоса.>');

-- MenuId 14084, 14294, 14295 - "Enter the Ordeal"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 14084 AND `OptionIndex` = 8 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(14084, 8, 'ruRU', 'Войти в Испытание');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 14294 AND `OptionIndex` = 4 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(14294, 4, 'ruRU', 'Войти в Испытание');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 14295 AND `OptionIndex` = 4 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(14295, 4, 'ruRU', 'Войти в Испытание');

-- MenuId 14991 - pet battle-stone trader dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 14991 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(14991, 0, 'ruRU', 'Интересуют редкие питомцы для поимки?'),
(14991, 1, 'ruRU', 'Хочешь обменять свои боевые камни?');

-- MenuId 15187 - "Could you, please, send me to Moonglade, Emissary?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 15187 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(15187, 0, 'ruRU', 'Не мог бы ты, пожалуйста, отправить меня в Лунную поляну, посланник?');

-- MenuId 16767 - reforge vendor dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 16767 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(16767, 0, 'ruRU', '<Перековать добычу.>'),
(16767, 1, 'ruRU', 'Покажи мне свои товары!');

-- MenuId 16862 - fishing-advice quest dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 16862 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(16862, 0, 'ruRU', 'Ты похож на умелого рыбака, сможешь нам помочь?\n\nМы разбили небольшой гарнизон неподалёку, но нам трудно прокормить войска. Любой совет по рыбалке нам бы очень пригодился.');

-- MenuId 17404 - "You are free....."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 17404 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(17404, 0, 'ruRU', 'Ты свободен.....');

-- MenuId 18068 - "Let's see what you have."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 18068 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(18068, 0, 'ruRU', 'Давай посмотрим, что у тебя есть.');

-- MenuId 18724 - Legion zone destination selection.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 18724 AND `OptionIndex` IN (2,3,4,5,6,7,8) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(18724, 2, 'ruRU', 'Даларан.'),
(18724, 3, 'ruRU', 'Штормхейм.'),
(18724, 4, 'ruRU', 'Азсуна.'),
(18724, 5, 'ruRU', 'Вал''шара.'),
(18724, 6, 'ruRU', 'Вышегорье.'),
(18724, 7, 'ruRU', 'Сурамар.'),
(18724, 8, 'ruRU', 'Расколотый берег.');

-- MenuId 18747 - "Show me what missions you have prepared."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 18747 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(18747, 0, 'ruRU', 'Покажи мне, какие задания у тебя готовы.');

-- MenuId 18748 - "I wish to trade."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 18748 AND `OptionIndex` = 5 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(18748, 5, 'ruRU', 'Я хочу торговать.');

-- MenuId 18773 - "It works, get ready!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 18773 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(18773, 0, 'ruRU', 'Работает, приготовься!');

-- MenuId 18776 - "Whitemoon, I'll be taking one of your fel bats..."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 18776 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(18776, 0, 'ruRU', 'Уайтмун, я возьму одного из твоих осквернённых нетопырей. Мы получим то, за чем пришли.');

-- MenuId 18850 - "I challenge you, Haldor."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 18850 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(18850, 0, 'ruRU', 'Я вызываю тебя, Халдор.');

-- MenuId 18904 - "Did the taurens participate in the construction of the pavilion?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 18904 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(18904, 1, 'ruRU', 'Таурены участвовали в строительстве павильона?');

-- MenuId 18956 - "I'll have you out of there in just a moment."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 18956 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(18956, 0, 'ruRU', 'Я вытащу тебя оттуда через секунду.');

-- MenuId 19086 - "Something worries you?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 19086 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(19086, 0, 'ruRU', 'Тебя что-то беспокоит?');

-- MenuId 19102 - stable/pet dialogue; group1/2 are deliberate French flavor text (no accented
-- chars so they slipped the usual filter, but match the established French-NPC convention),
-- left untranslated.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 19102 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(19102, 0, 'ruRU', 'Я хотел бы оставить питомца в стойле.');

-- MenuId 19255 - "Here are 100 gold coins..." ransom dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 19255 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(19255, 0, 'ruRU', 'Вот 100 золотых монет. Пойдёт?'),
(19255, 1, 'ruRU', '<Приставить нож к горлу Марина.> Итак, поговорим о деле?');

-- MenuId 19258, 19281 - "How do you go down to the arena?" / "Where does this altar come from?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 19258 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(19258, 0, 'ruRU', 'Как спуститься на арену?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 19281 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(19281, 0, 'ruRU', 'Откуда взялся этот алтарь?');

-- MenuId 19340 - "Do you live here in Thunder Totem, Lessah?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 19340 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(19340, 1, 'ruRU', 'Ты живёшь здесь, в Громовом Тотеме, Лесса?');

-- MenuId 19434 - "I see."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 19434 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(19434, 0, 'ruRU', 'Понятно.');

-- MenuId 19717 - "I have to travel."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 19717 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(19717, 0, 'ruRU', 'Мне нужно отправиться в путь.');

-- MenuId 19948 - "Yes, I'd like to refund the traits in my artifact."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 19948 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(19948, 0, 'ruRU', 'Да, я хочу сбросить способности своего артефакта.');

-- MenuId 4444, 5555 - deliberate French flavor text (same convention as 999/1111/2222/3333),
-- left untranslated.

-- MenuId 19966-19970 - "death hunters" dialogue chain.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 19966 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(19966, 1, 'ruRU', 'Эм, мы знакомы?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (19967,19968,19969,19970) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(19967, 0, 'ruRU', 'Что ж, мне всё равно нужно с ней поговорить.'),
(19968, 0, 'ruRU', 'Я не хочу вмешиваться...'),
(19969, 0, 'ruRU', 'Подожди... я правильно расслышал?'),
(19970, 0, 'ruRU', 'Я никогда не слышал о «охотниках на смерть».');

-- MenuId 20007 - "The Valarjar await."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 20007 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20007, 1, 'ruRU', 'Валарьяры ждут.');

-- MenuId 20079 - "The Light is ready to serve."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 20079 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20079, 0, 'ruRU', 'Свет готов служить.');

-- MenuId 20095 - "Who wants a job?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 20095 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20095, 0, 'ruRU', 'Кому нужна работа?');

-- MenuId 20187 - Suramar withered-training purchase menu; \n, color codes and icon tags
-- preserved verbatim.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 20187 AND `OptionIndex` IN (0,2,4,5,6,7,9) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20187, 0, 'ruRU', 'Восемь иссохших.\n(Стоимость: 400 Древней маны |TINTERFACE\\ICONS\\INV_Misc_ancient_mana.blp:16|t)'),
(20187, 2, 'ruRU', 'Десять иссохших.\n(Стоимость: 650 Древней маны |TINTERFACE\\ICONS\\INV_Misc_ancient_mana.blp:16|t)'),
(20187, 4, 'ruRU', 'Двенадцать иссохших.\n(Стоимость: 900 Древней маны |TINTERFACE\\ICONS\\INV_Misc_ancient_mana.blp:16|t)'),
(20187, 5, 'ruRU', 'Двенадцать иссохших.\n|cFFFF0000(Стоимость: 900 Древней маны |TINTERFACE\\ICONS\\INV_Misc_ancient_mana.blp:16|t)|r'),
(20187, 6, 'ruRU', 'Пятнадцать иссохших.\n(Стоимость: 1300 Древней маны |TINTERFACE\\ICONS\\INV_Misc_ancient_mana.blp:16|t)'),
(20187, 7, 'ruRU', 'Пятнадцать иссохших.\n|cFFFF0000(Стоимость: 1300 Древней маны |TINTERFACE\\ICONS\\INV_Misc_ancient_mana.blp:16|t)|r'),
(20187, 9, 'ruRU', 'Двадцать иссохших.\n|cFFFF0000(Стоимость: 2000 Древней маны |TINTERFACE\\ICONS\\INV_Misc_ancient_mana.blp:16|t)|r');

-- MenuId 20344 - "Place a work order for Champion armaments."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 20344 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20344, 0, 'ruRU', 'Разместить заказ на снаряжение чемпиона.');

-- MenuId 20352, 20356, 20360, 20369, 20370, 20371 - "Let's see what you have there."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (20352,20356,20360,20369,20370,20371) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20352, 0, 'ruRU', 'Давай посмотрим, что у тебя есть.'),
(20356, 0, 'ruRU', 'Давай посмотрим, что у тебя есть.'),
(20360, 0, 'ruRU', 'Давай посмотрим, что у тебя есть.'),
(20369, 0, 'ruRU', 'Давай посмотрим, что у тебя есть.'),
(20370, 0, 'ruRU', 'Давай посмотрим, что у тебя есть.'),
(20371, 0, 'ruRU', 'Давай посмотрим, что у тебя есть.');

-- MenuId 20375 - "Let's see what you have."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 20375 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20375, 0, 'ruRU', 'Давай посмотрим, что у тебя есть.');

-- MenuId 20380-20386, 20542 - "Enter the Ordeal"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (20380,20381,20382,20383,20384,20385,20386,20542) AND `OptionIndex` = 8 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20380, 8, 'ruRU', 'Войти в Испытание'),
(20381, 8, 'ruRU', 'Войти в Испытание'),
(20382, 8, 'ruRU', 'Войти в Испытание'),
(20383, 8, 'ruRU', 'Войти в Испытание'),
(20384, 8, 'ruRU', 'Войти в Испытание'),
(20385, 8, 'ruRU', 'Войти в Испытание'),
(20386, 8, 'ruRU', 'Войти в Испытание'),
(20542, 8, 'ruRU', 'Войти в Испытание');

-- MenuId 20389 - innkeeper/vendor combo.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 20389 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20389, 0, 'ruRU', 'Сделать эту гостиницу своим домом.'),
(20389, 1, 'ruRU', 'Что у тебя есть на продажу?');

-- MenuId 20424 - module-activation dialogue; icon tag preserved.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 20424 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20424, 0, 'ruRU', '<Активировать модуль, потратив 25 |TINTERFACE\\ICONS\\INV_MISC_ANCIENT_MANA.BLP:15|t Древней маны.>');

-- MenuId 20677 - "You are free to go!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 20677 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20677, 0, 'ruRU', 'Ты свободен!');

-- MenuId 20678 - "You are free to go!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 20678 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20678, 0, 'ruRU', 'Ты свободен!');

-- MenuId 20697 - "Teleport to the Nightspire."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 20697 AND `OptionIndex` = 3 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20697, 3, 'ruRU', 'Телепортировать к Шпилю Ночи.');

-- MenuId 20737 - "We're ready to leave now."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 20737 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(20737, 0, 'ruRU', 'Мы готовы отправляться.');

-- MenuId 21249, 21251 - Metzen holiday-event dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21249 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21249, 0, 'ruRU', 'Пожать руку');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21251 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21251, 0, 'ruRU', 'Посыпать Метцена оленьей пылью.');

-- MenuId 21263-21270 - Zul'Gurub tribute-trinket replacement dialogue (lost item variants).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21263 AND `OptionIndex` IN (3,4,5,6) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21263, 3, 'ruRU', 'Кажется, я потерял свою Печать героя. Поможешь?'),
(21263, 4, 'ruRU', 'Кажется, я потерял свою Печать язычника. Поможешь?'),
(21263, 5, 'ruRU', 'Кажется, я потерял свою Печать язычника. Поможешь?'),
(21263, 6, 'ruRU', 'Кажется, я потерял свою Печать язычника. Поможешь?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21264 AND `OptionIndex` IN (3,4,5,6) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21264, 3, 'ruRU', 'Кажется, я потерял свою Ярость Мугамбы. Поможешь?'),
(21264, 4, 'ruRU', 'Кажется, я потерял свою Силу Мугамбы. Поможешь?'),
(21264, 5, 'ruRU', 'Кажется, я потерял свою Силу Мугамбы. Поможешь?'),
(21264, 6, 'ruRU', 'Кажется, я потерял свою Силу Мугамбы. Поможешь?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21265 AND `OptionIndex` IN (3,4,5,6) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21265, 3, 'ruRU', 'Кажется, я потерял свой Всевидящий глаз Зулдазара. Поможешь?'),
(21265, 4, 'ruRU', 'Кажется, я потерял свой Глаз Зулдазара. Поможешь?'),
(21265, 5, 'ruRU', 'Кажется, я потерял свой Глаз Зулдазара. Поможешь?'),
(21265, 6, 'ruRU', 'Кажется, я потерял свой Глаз Зулдазара. Поможешь?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21266 AND `OptionIndex` IN (3,4,5,6) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21266, 3, 'ruRU', 'Кажется, я потерял свою Неостановимую Скверну Кезана. Поможешь?'),
(21266, 4, 'ruRU', 'Кажется, я потерял свою Скверну Кезана. Поможешь?'),
(21266, 5, 'ruRU', 'Кажется, я потерял свою Скверну Кезана. Поможешь?'),
(21266, 6, 'ruRU', 'Кажется, я потерял свою Скверну Кезана. Поможешь?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21267 AND `OptionIndex` IN (3,4,5,6) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21267, 3, 'ruRU', 'Кажется, я потерял свою Драгоценность Каджаро. Поможешь?'),
(21267, 4, 'ruRU', 'Кажется, я потерял свой Камешек Каджаро. Поможешь?'),
(21267, 5, 'ruRU', 'Кажется, я потерял свой Камешек Каджаро. Поможешь?'),
(21267, 6, 'ruRU', 'Кажется, я потерял свой Камешек Каджаро. Поможешь?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21268 AND `OptionIndex` IN (3,4,5,6) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21268, 3, 'ruRU', 'Кажется, я потерял своё Незамутнённое Видение Вудресс. Поможешь?'),
(21268, 4, 'ruRU', 'Кажется, я потерял своё Видение Вудресс. Поможешь?'),
(21268, 5, 'ruRU', 'Кажется, я потерял своё Видение Вудресс. Поможешь?'),
(21268, 6, 'ruRU', 'Кажется, я потерял своё Видение Вудресс. Поможешь?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21269 AND `OptionIndex` IN (3,4,5,6) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21269, 3, 'ruRU', 'Кажется, я потерял свои Безупречные зачарованные водоросли Южных морей. Поможешь?'),
(21269, 4, 'ruRU', 'Кажется, я потерял свои Зачарованные водоросли Южных морей. Поможешь?'),
(21269, 5, 'ruRU', 'Кажется, я потерял свои Зачарованные водоросли Южных морей. Поможешь?'),
(21269, 6, 'ruRU', 'Кажется, я потерял свои Зачарованные водоросли Южных морей. Поможешь?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21270 AND `OptionIndex` IN (3,4) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21270, 3, 'ruRU', 'Кажется, я потерял свой Зандаларский талисман мастерства тени. Поможешь?'),
(21270, 4, 'ruRU', 'Кажется, я потерял свой Зандаларский талисман тени. Поможешь?');

-- MenuId 21270(remainder), 21271 - Zul'Gurub tribute-trinket replacement dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21270 AND `OptionIndex` IN (5,6) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21270, 5, 'ruRU', 'Кажется, я потерял свой Зандаларский талисман тени. Поможешь?'),
(21270, 6, 'ruRU', 'Кажется, я потерял свой Зандаларский талисман тени. Поможешь?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21271 AND `OptionIndex` IN (3,4,5,6) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21271, 3, 'ruRU', 'Кажется, я потерял свой Гнев Водоворота. Поможешь?'),
(21271, 4, 'ruRU', 'Кажется, я потерял своё Щупальце Водоворота. Поможешь?'),
(21271, 5, 'ruRU', 'Кажется, я потерял своё Щупальце Водоворота. Поможешь?'),
(21271, 6, 'ruRU', 'Кажется, я потерял своё Щупальце Водоворота. Поможешь?');

-- MenuId 21336 - "<View Light's Judgment.>"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21336 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21336, 0, 'ruRU', '<Взглянуть на Суд Света.>');

-- MenuId 21910 - Vigilant Quoram (Army of the Light) dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21910 AND `OptionIndex` BETWEEN 0 AND 5 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21910, 0, 'ruRU', 'Привет, Бдительный Кворам. Мы уже встречались на Аргусе.'),
(21910, 1, 'ruRU', 'Я прошёл своё испытание!'),
(21910, 2, 'ruRU', 'Что ты знаешь о становлении Озарёнными Светом?'),
(21910, 3, 'ruRU', 'Ты планируешь остаться с дренеями?'),
(21910, 4, 'ruRU', 'Как тебе на борту Виндикара?'),
(21910, 5, 'ruRU', 'Можешь телепортировать меня обратно на мостик?');

-- MenuId 21937, 21938 - race lore dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21937 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21937, 0, 'ruRU', 'Что мы знаем о тауренах Вышегорья?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 21938 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(21938, 0, 'ruRU', 'Что мы знаем о светлостражах?');

-- MenuId 22068, 22081, 22082 - race/lore dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22068 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22068, 0, 'ruRU', 'Что ты знаешь о Телогрусе?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22081 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22081, 0, 'ruRU', 'Что ты можешь рассказать об озарённых Светом дренеях?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22082 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22082, 0, 'ruRU', 'Что мы знаем об эльфах Бездны?');

-- MenuId 22114, 22117, 22121 - profession-trainer/vendor dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22114 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22114, 0, 'ruRU', 'Обучи меня травничеству.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22117 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22117, 0, 'ruRU', 'Дай мне посмотреть твои товары.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22121 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22121, 0, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 22124, 22125 - profession-trainer/vendor combo.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22124 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22124, 0, 'ruRU', 'Я здесь ради обучения кулинарии.'),
(22124, 1, 'ruRU', 'Дай мне посмотреть твои товары.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22125 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22125, 0, 'ruRU', 'Обучи меня портняжному делу.'),
(22125, 1, 'ruRU', 'Дай мне посмотреть твои товары.');

-- MenuId 22169, 22171, 22172, 22173 - profession-trainer/vendor dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22169 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22169, 0, 'ruRU', 'Обучи меня первой помощи.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22171 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22171, 0, 'ruRU', 'Обучи меня портняжному делу.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22172 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22172, 0, 'ruRU', 'Дай мне посмотреть твои товары.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22173 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22173, 0, 'ruRU', 'Обучи меня инженерному делу.');

-- MenuId 22176, 22177 - blacksmith/mining dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22176 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22176, 0, 'ruRU', 'Я хочу стать кузнецом.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22177 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22177, 0, 'ruRU', 'Расскажи мне о горном деле.');

-- MenuId 22193, 22201 - race lore dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22193 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22193, 0, 'ruRU', 'Что мы знаем об орках Маг''хар?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22201 AND `OptionIndex` = 3 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22201, 3, 'ruRU', 'Что ты можешь рассказать о дворфах Тёмного Железа?');

-- MenuId 22234 - innkeeper/vendor combo.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 22234 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(22234, 0, 'ruRU', 'Сделать эту гостиницу своим домом.'),
(22234, 1, 'ruRU', 'Что у тебя есть на продажу?');

-- MenuId 24381-54894 - final scattered batch of one-off gossip options.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 24381 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(24381, 0, 'ruRU', 'Изменение рун');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 25318 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(25318, 0, 'ruRU', 'Идём!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 25794 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(25794, 0, 'ruRU', 'Включить!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 29384 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(29384, 0, 'ruRU', 'Я не рабочий. Я здесь, чтобы освободить тебя от рабства в шахтах.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 30127 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(30127, 0, 'ruRU', 'Взять это железо!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 30154 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(30154, 0, 'ruRU', 'Пропустим разминку, сестра... или ты слишком боишься сразиться с кем-то своего роста?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 33220 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(33220, 0, 'ruRU', 'Ты знаешь, где найти Ясенрощный клинок?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (34957,34958,34959) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(34957, 0, 'ruRU', 'Прокатимся!'),
(34958, 0, 'ruRU', 'Прокатимся!'),
(34959, 0, 'ruRU', 'Прокатимся!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 39865 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(39865, 0, 'ruRU', 'Не мог бы ты, пожалуйста, отправить меня на Хиджал?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 39999 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(39999, 0, 'ruRU', 'Спасти его!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 40056 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(40056, 0, 'ruRU', 'Пожалуйста, помоги нам!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 42465 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(42465, 0, 'ruRU', 'Я слушаю!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 42468 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(42468, 0, 'ruRU', 'Вот, держи!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (43036,43042) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(43036, 0, 'ruRU', 'Идём!'),
(43042, 0, 'ruRU', 'Идём!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 43170 AND `OptionIndex` IN (0,1,2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(43170, 0, 'ruRU', 'Уничтожить вход!!'),
(43170, 1, 'ruRU', 'Уничтожить вход!!'),
(43170, 2, 'ruRU', 'Уничтожить вход!!'),
(43170, 3, 'ruRU', 'Уничтожить вход!!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (43572,44427) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(43572, 0, 'ruRU', 'Идём!'),
(44427, 0, 'ruRU', 'Идём!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 44768 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(44768, 0, 'ruRU', 'Ты теперь свободен!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 46014 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(46014, 0, 'ruRU', 'Проверить его карман...');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (46881,46882) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(46881, 0, 'ruRU', 'Проверить солдата...'),
(46882, 0, 'ruRU', 'Проверить солдата...');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (47814,47820,47821,47822) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(47814, 0, 'ruRU', 'Взять его.'),
(47820, 0, 'ruRU', 'Взять его.'),
(47821, 0, 'ruRU', 'Взять его.'),
(47822, 0, 'ruRU', 'Взять его.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 47930 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(47930, 0, 'ruRU', 'Король желает быть в курсе недавней активности Неферсетов.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 48705 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(48705, 0, 'ruRU', 'Я готов, ВПЕРЁД!!!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 54763 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(54763, 0, 'ruRU', 'Тебе нужно идти!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 54894 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(54894, 0, 'ruRU', 'Начнём!');

-- MenuId 54914-99914 - final tail batch of one-off gossip options.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 54914 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(54914, 0, 'ruRU', 'Я нашёл это!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (54924,54925,54926,54944) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(54924, 0, 'ruRU', 'Приступим!'),
(54925, 0, 'ruRU', 'Приступим!'),
(54926, 0, 'ruRU', 'Приступим!'),
(54944, 0, 'ruRU', 'Приступим!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 54990 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(54990, 0, 'ruRU', 'Теперь ты свободен!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 55009 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(55009, 0, 'ruRU', 'Мы нашли это!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 55201 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(55201, 0, 'ruRU', 'Теперь ты спасён!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (55283,55333) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(55283, 0, 'ruRU', 'Расскажи мне всё!'),
(55333, 0, 'ruRU', 'Расскажи мне всё!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 55490 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(55490, 0, 'ruRU', 'Теперь ты спасён!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 56222 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(56222, 0, 'ruRU', 'Я могу победить тебя!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 56737 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(56737, 0, 'ruRU', 'Я хочу быстро добраться до места'),
(56737, 1, 'ruRU', 'Я хочу отправиться в путь!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 59348 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(59348, 0, 'ruRU', 'Я могу тебе помочь!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 59572 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(59572, 0, 'ruRU', 'Я могу победить тебя!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 59899 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(59899, 0, 'ruRU', 'Я готов идти!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 60000 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(60000, 1, 'ruRU', 'ЗА АЗЕРОТ!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 60001 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(60001, 1, 'ruRU', 'Кадгар попросил нас отвлечь внимание от Ока Килрогга.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 60002 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(60002, 1, 'ruRU', 'У нас есть всё необходимое. Пора строить этот гарнизон.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 61492 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(61492, 0, 'ruRU', 'Теперь ты спасён!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 64475 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(64475, 0, 'ruRU', 'Отдать ему реликвию...');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (64491,64493,64494) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(64491, 0, 'ruRU', 'Ты спасён!'),
(64493, 0, 'ruRU', 'Ты спасён!'),
(64494, 0, 'ruRU', 'Ты спасён!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 65910 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(65910, 0, 'ruRU', 'Я из Альянса');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 66292 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(66292, 0, 'ruRU', 'Я готов, ВПЕРЁД!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (66564,66567) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(66564, 0, 'ruRU', 'Теперь ты спасён!'),
(66567, 0, 'ruRU', 'Теперь ты спасён!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 67067 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(67067, 0, 'ruRU', 'Идём!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 86563 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(86563, 1, 'ruRU', 'В пути в Азсуну!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 88867 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(88867, 0, 'ruRU', 'Я не пойду с тобой пешком! Телепорт.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 93428 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(93428, 1, 'ruRU', 'Телепортировать в Хельхейм.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 97664 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(97664, 1, 'ruRU', 'Телепортируй меня за пределы Хельхейма.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 99914 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(99914, 0, 'ruRU', 'Мистик, благодарю за твою жертву'),
(99914, 1, 'ruRU', 'Мы не забудем твою жертву');

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

-- MenuId 10358 - champion's pennant selection remainder (Horde capitals).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10358 AND `OptionIndex` IN (3,4,5,6,7) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10358, 3, 'ruRU', 'Вымпел чемпиона Чёрного Копья'),
(10358, 4, 'ruRU', 'Вымпел чемпиона Отрёкшихся'),
(10358, 5, 'ruRU', 'Вымпел чемпиона Оргриммара'),
(10358, 6, 'ruRU', 'Вымпел чемпиона Луносвета'),
(10358, 7, 'ruRU', 'Вымпел чемпиона Громового Утёса');

-- MenuId 10392 - "I want to create a guild crest."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10392 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10392, 1, 'ruRU', 'Я хочу создать герб гильдии.');

-- MenuId 10437 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10437 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10437, 1, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 10514 - "Yes, I'm ready. Let's do this thing!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10514 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10514, 0, 'ruRU', 'Да, я готов. Давай сделаем это!');

-- MenuId 10519 - "<Pound this chump.>"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10519 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10519, 0, 'ruRU', '<Отколотить этого придурка.>');

-- MenuId 10521 - comedic interrogation action menu.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10521 AND `OptionIndex` IN (0,1,2,3,4) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10521, 0, 'ruRU', 'Кто тебя послал?!'),
(10521, 1, 'ruRU', '<Дать ему в морду.>'),
(10521, 2, 'ruRU', '<Дать пинка по его толстой роже.>'),
(10521, 3, 'ruRU', '<Предложить еду.>'),
(10521, 4, 'ruRU', '<Пора щекотать!>');

-- MenuId 10528 - "Bring it on, Rocco."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10528 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10528, 0, 'ruRU', 'Покажи, на что ты способен, Рокко.');

-- MenuId 10550 - "I am interested in warlock training."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10550 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10550, 0, 'ruRU', 'Меня интересует обучение колдовству.');

-- MenuId 10552 - "Teach me the ways of the spirits."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10552 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10552, 0, 'ruRU', 'Научи меня путям духов.');

-- MenuId 10556 - "Move on, lazy ass..!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10556 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10556, 0, 'ruRU', 'Пошевеливайся, лентяй!');

-- MenuId 10560 - "<Rifle through his pockets.>"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10560 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10560, 0, 'ruRU', '<Обыскать его карманы.>');

-- MenuId 10567 - Longshore rescue dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10567 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10567, 0, 'ruRU', 'Никогда, двуличный пёс!'),
(10567, 1, 'ruRU', '<Разбить кандалы Лонгшора и освободить его.>');

-- MenuId 10569 - "I seek training."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10569 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10569, 0, 'ruRU', 'Я ищу обучения.');

-- MenuId 10576 - "How do the Bountiful Tables work?" (official ruRU term "Щедрый стол").
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10576 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10576, 0, 'ruRU', 'Как работают Щедрые столы?');

-- MenuId 10602 - "I would like to go to the battleground."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10602 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10602, 0, 'ruRU', 'Я хочу отправиться на Поле Боя.');

-- MenuId 10620, 10622, 10624 - Shattrath fashion-vendor flavor dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10620 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10620, 0, 'ruRU', 'Снабди меня самым крутым и блестящим шиком, что у тебя есть!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10622 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10622, 0, 'ruRU', 'Сабо, мне нужен стильный новый наряд для вечеринки, которую я устраиваю!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10624 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10624, 0, 'ruRU', 'Мне нужны крутые очки. Что я получу за две стопки макарон?');

-- MenuId 10638 - "I wish to start gaining experience again."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10638 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10638, 1, 'ruRU', 'Я хочу снова начать получать опыт.');

-- MenuId 10641-10646 - "nearby ruins" lore dialogue chain.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (10641,10642,10643,10644,10645,10646) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10641, 0, 'ruRU', 'Расскажи мне о ближних руинах.'),
(10642, 0, 'ruRU', 'Что ты здесь делаешь?'),
(10643, 0, 'ruRU', 'Нет, пожалуйста, продолжай.'),
(10644, 0, 'ruRU', 'Что случилось с магами?'),
(10645, 0, 'ruRU', 'Им удалось выстоять?'),
(10646, 0, 'ruRU', 'И мы собираемся их выкопать.');

-- MenuId 10658 - "Yes Archmage. I will hide the stone."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10658 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10658, 0, 'ruRU', 'Да, архимаг. Я спрячу камень.');

-- MenuId 10659 - "<Merge with the spirit.>"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10659 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10659, 0, 'ruRU', '<Слиться с духом.>');

-- MenuId 10681, 10683, 10684, 10696 - class-trainer "interested in training" dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10681 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10681, 0, 'ruRU', 'Меня интересует обучение колдовству.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10683 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10683, 0, 'ruRU', 'Меня интересует обучение магии.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10684 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10684, 0, 'ruRU', 'Научи меня путям духов.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10696 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10696, 1, 'ruRU', 'Я ищу дальнейшего обучения древним путям друидов.');

-- MenuId 10767, 10768 - profession/class-trainer selection remainders.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10767 AND `OptionIndex` IN (13,14) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10767, 13, 'ruRU', 'Снятие шкур'),
(10767, 14, 'ruRU', 'Портняжное дело');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10768 AND `OptionIndex` IN (6,7,8) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10768, 6, 'ruRU', 'Шаман'),
(10768, 7, 'ruRU', 'Колдун'),
(10768, 8, 'ruRU', 'Воин');

-- MenuId 10780 - chocolate rock / squeaking pet dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10780 AND `OptionIndex` IN (2,3) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10780, 2, 'ruRU', 'Вот, съешь это! Это особый шоколадный камень.'),
(10780, 3, 'ruRU', 'ПИСК!!');

-- MenuId 10781-10786 - azsharite comedy dialogue chain.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (10781,10782,10783,10784,10785,10786) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10781, 0, 'ruRU', 'Ты что-нибудь знаешь об азшарите?'),
(10782, 0, 'ruRU', 'Те кучки голубоватых кристаллов, что мы находим на земле.'),
(10783, 0, 'ruRU', 'Значит, азшарит оставляют великаны? Но откуда он берётся?'),
(10784, 0, 'ruRU', 'Это... ваши испражнения?! И гоблины бегают вокруг, собирая их?'),
(10785, 0, 'ruRU', 'Как часто вы, э-э, "ходите"?'),
(10786, 0, 'ruRU', 'От 15 до 25 лет? Помощнику Грили это не понравится!');

-- MenuId 10797 - "I'm ready. Shrink me!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10797 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10797, 0, 'ruRU', 'Я готов. Уменьши меня!');

-- MenuId 10801 - "<Ring the Buzzer>"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10801 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10801, 0, 'ruRU', '<Нажать на звонок>');

-- MenuId 10810 - "Mini-Mount"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10810 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10810, 0, 'ruRU', 'Мини-маунт');

-- MenuId 10817, 10821, 10834, 10836, 10837, 10838 - more trainer dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10817 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10817, 0, 'ruRU', 'Научи меня путям духов.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10821 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10821, 0, 'ruRU', 'Мне нужно обучение воина.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10834 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10834, 0, 'ruRU', 'Я ищу дальнейшего обучения древним путям друидов.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10836 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10836, 0, 'ruRU', 'Мне нужно обучение воина.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10837 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10837, 0, 'ruRU', 'Я ищу дальнейшего обучения.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10838 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10838, 0, 'ruRU', 'Я ищу дальнейшего обучения.');

-- MenuId 10882 - "I recovered your armor and weapons. Victory or death!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10882 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10882, 0, 'ruRU', 'Я вернул твои доспехи и оружие. Победа или смерть!');

-- MenuId 10894-10896 - Honor's Stand lore dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` IN (10894,10895,10896) AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10894, 0, 'ruRU', 'Это было до Катаклизма?'),
(10895, 0, 'ruRU', 'Килрок, как мы потеряли Рубеж Чести?'),
(10896, 0, 'ruRU', 'Ты и твои люди остались, чтобы сражаться.');

-- MenuId 10903 - "Vinny, I just gotta get me a genuine Cataclysm souvenir!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10903 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10903, 0, 'ruRU', 'Винни, мне просто необходим настоящий сувенир Катаклизма!');

-- MenuId 10908 - "Examine the remains."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10908 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10908, 0, 'ruRU', 'Осмотреть останки.');

-- MenuId 10935 - "I'm here on behalf of Warlord Bloodhilt..."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10935 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10935, 0, 'ruRU', 'Я здесь от имени военачальника Кровавой Рукояти, который хочет, чтобы ты знал - он скоро прибудет.');

-- MenuId 10937 - "I'll be sure to tell the Taurajo refugees that. Those that lived."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10937 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10937, 0, 'ruRU', 'Я непременно передам это беженцам из Тауражо. Тем, кто выжил.');

-- MenuId 10938, 10941, 10942 - assorted lore dialogue (Banshee Queen).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10938 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10938, 0, 'ruRU', 'Скажи ему сам. Он почти здесь!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10941 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10941, 1, 'ruRU', 'Что здесь произошло?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10942 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10942, 0, 'ruRU', 'Чего ты хочешь от меня, Королева банши?');

-- MenuId 10958 - "No Calder. What do you like?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10958 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10958, 0, 'ruRU', 'Нет, Колдер. А что тебе нравится?');

-- MenuId 10960, 10961, 10962 - orc disguise/spy dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10960 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10960, 0, 'ruRU', 'Я готов, Картог. За Орду!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10961 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10961, 0, 'ruRU', 'Ты не орк. Ты шпион! Шпион Альянса!');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10962 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10962, 0, 'ruRU', 'Что? Кто ты? Из какого ты клана?');

-- MenuId 10963 - "I'm ready to enter the Sunwell."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10963 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10963, 0, 'ruRU', 'Я готов войти в Солнечный Колодец.');

-- MenuId 10972, 10974 - "I'm ready to face my challenge."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10972 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10972, 0, 'ruRU', 'Я готов встретить своё испытание.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10974 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10974, 0, 'ruRU', 'Я готов встретить своё испытание.');

-- MenuId 10976 - "Queue for The Crown Chemical Co. battle."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10976 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10976, 1, 'ruRU', 'Встать в очередь на бой с Королевской химической компанией.');

-- MenuId 10977 - "I require warrior training."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10977 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10977, 0, 'ruRU', 'Мне нужно обучение воина.');

-- MenuId 10980, 10982 - "Yes, sir." / "Woo hoo!"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10980 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10980, 0, 'ruRU', 'Да, сэр.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10982 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10982, 0, 'ruRU', 'Ура!');

-- MenuId 10984 - Zen'tabra druid-trainer dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10984 AND `OptionIndex` IN (0,1) AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10984, 0, 'ruRU', 'Я ищу обучения друида.'),
(10984, 1, 'ruRU', 'Зен''табра, ты одна из друидов, о которых ходят слухи? Друиды действительно жили на Островах Эха давным-давно?');

-- MenuId 10986, 10987, 10988 - more class-trainer dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10986 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10986, 0, 'ruRU', 'Мне нужно обучение жреца.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10987 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10987, 0, 'ruRU', 'Меня интересует обучение магии.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 10988 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(10988, 0, 'ruRU', 'Я ищу обучения путям охотника.');

-- MenuId 11009 - vendor "I would like to buy from you."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11009 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11009, 0, 'ruRU', 'Я хотел бы купить у тебя.');

-- MenuId 11024, 11025, 11027, 11036 - short dialogue fragments.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11024 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11024, 0, 'ruRU', 'Как?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11025 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11025, 0, 'ruRU', 'Так что ты сделал?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11027 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11027, 0, 'ruRU', 'Что случилось?');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11036 AND `OptionIndex` = 1 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11036, 1, 'ruRU', 'Кто ты?');

-- MenuId 11054 - "What can you teach me, Gorilla?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11054 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11054, 0, 'ruRU', 'Чему ты можешь меня научить, Горилла?');

-- MenuId 11060 - "What are you doing here?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11060 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11060, 0, 'ruRU', 'Что ты здесь делаешь?');

-- MenuId 11079 - "I need a horse."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11079 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11079, 0, 'ruRU', 'Мне нужна лошадь.');

-- MenuId 11093 - "You sign charter! Is good!" (broken-grammar flavor kept).
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11093 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11093, 0, 'ruRU', 'Ты подписать устав! Это хорошо!');

-- MenuId 11097 - "I wish to browse your wares."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11097 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11097, 0, 'ruRU', 'Я хочу посмотреть твои товары.');

-- MenuId 11109 - "I seek training in the ways of the Hunter."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11109 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11109, 0, 'ruRU', 'Я ищу обучения путям охотника.');

-- MenuId 11127 - "You spoke of communing with Thrall? Did I miss it?"
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11127 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11127, 0, 'ruRU', 'Ты говорил о единении с Траллом? Я это пропустил?');

-- MenuId 11132 - "You're not hideous, Lilian... you're one of us..."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11132 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11132, 0, 'ruRU', 'Ты не уродлива, Лилиан... ты одна из нас. Вот, посмотри в это зеркало, убедись сама.');

-- MenuId 11143, 11144 - vendor dialogue.
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11143 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11143, 0, 'ruRU', 'Я хочу купить у тебя.');
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11144 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11144, 0, 'ruRU', 'А это кто такой малыш?');

-- MenuId 11152 - "I'd like to purchase a bat ride."
DELETE FROM `gossip_menu_option_locale` WHERE `MenuId` = 11152 AND `OptionIndex` = 0 AND `Locale` = 'ruRU';
INSERT INTO `gossip_menu_option_locale` (`MenuId`, `OptionIndex`, `Locale`, `OptionText`) VALUES
(11152, 0, 'ruRU', 'Я хотел бы купить полёт на нетопыре.');
