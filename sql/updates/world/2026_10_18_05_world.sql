-- Метатель глеф 37927 (призывается спеллом 71238 при клике по 38150, квест "И у нас есть союзники"): VehicleId = 0, поэтому игрок не садился, кнопок на панели не было.
-- У такого же метателя глеф (Остров Завоеваний 34802/35273) VehicleId 447; ставим его и призванному. Спеллы панели spell1 70735 и spell2 70732 уже в шаблоне.
-- Откат: UPDATE creature_template SET VehicleId = 0 WHERE entry = 37927;
UPDATE `creature_template` SET `VehicleId` = 447 WHERE `entry` = 37927 AND `VehicleId` = 0;
