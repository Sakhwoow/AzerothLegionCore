-- rbac_permissions
DELETE FROM `rbac_permissions` WHERE `id` IN(1529);
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(1529, 'Command:.altbot');

-- rbac_linked_permissions
-- Linked under 195 (Player), same reasoning as .selfbot (1527, 2026_10_08_00_auth.sql): must be
-- available to every account tier so ordinary players can puppet their own alt. The
-- altbot_enable=0 default (worldserver.conf) and the same-account check in AltBotMgr::AddAltBot
-- are the real gates, not RBAC.
DELETE FROM `rbac_linked_permissions` WHERE `linkedId` IN (1529);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
(195,1529);
