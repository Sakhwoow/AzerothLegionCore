-- rbac_permissions
DELETE FROM `rbac_permissions` WHERE `id` IN(1528);
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(1528, 'Command:.guildtask');

-- rbac_linked_permissions
-- Linked under 195 (Player), same reasoning as .selfbot's 1527 - ".guildtask status" is a
-- read-only status check any guild member should be able to run, not an admin command.
DELETE FROM `rbac_linked_permissions` WHERE `linkedId` IN (1528);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
(195,1528);
