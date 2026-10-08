-- rbac_permissions
DELETE FROM `rbac_permissions` WHERE `id` IN(1527);
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(1527, 'Command:.selfbot');

-- rbac_linked_permissions
-- Linked under 195 (Player), not under 198/194 (GM) like the PBOTAI admin commands: this
-- must be available to every account tier so ordinary players can use .selfbot once
-- selfbot_level is raised above 1 in worldserver.conf. The 0/1/2/3 runtime restriction is
-- enforced by BotUtility::SelfBotLevel + Player::CanBeGameMaster() in the command handler,
-- not by RBAC.
DELETE FROM `rbac_linked_permissions` WHERE `linkedId` IN (1527);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
(195,1527);
