-- rbac_permissions
DELETE FROM `rbac_permissions` WHERE `id` IN(1530);
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
(1530, 'Command:.xp rate');

-- rbac_linked_permissions
-- Linked under 195 (Player), same reasoning as .selfbot's 1527 - this replaces the old
-- npc_rate_xp_modifier gossip NPC, which any player could already talk to freely.
DELETE FROM `rbac_linked_permissions` WHERE `linkedId` IN (1530);
INSERT INTO `rbac_linked_permissions` (`id`, `linkedId`) VALUES
(195,1530);
