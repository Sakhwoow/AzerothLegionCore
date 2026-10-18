-- Управляемые игроком летающие транспорты (Гиппогриф 43751 "Эндшпиль", Пойманный нетопырь 38540 "Оттянуть неизбежное"): InhabitType 3 (земля и воздух) заставлял клиент считать их
-- наземными, гиппогриф двигался только по земле и не взлетал. У всех летающих транспортов этой базы (драконы, Argent/Skychaser Hippogryph) InhabitType 4 (только воздух).
-- Откат: UPDATE creature_template SET InhabitType = 3 WHERE entry IN (43751, 38540);
UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` IN (43751, 38540) AND `InhabitType` = 3;
