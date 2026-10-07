-- Translate the ".server info" console output labels (trinity_string entries
-- 12/13/19/60, consumed via LANG_CONNECTED_USERS/LANG_UPTIME/LANG_UPDATE_DIFF/
-- LANG_CONNECTED_PLAYERS in src/server/scripts/Commands/cs_server.cpp) to
-- Russian. Console output always renders content_default (no per-session
-- locale for a console), so the translation goes there directly rather than
-- into a content_locN column.
UPDATE `trinity_string` SET `content_default`='Активных подключений: %u (макс: %u) В очереди: %u (макс: %u)' WHERE `entry`=12;
UPDATE `trinity_string` SET `content_default`='Время работы сервера: %s' WHERE `entry`=13;
UPDATE `trinity_string` SET `content_default`='Задержка обновления: %u мс.' WHERE `entry`=19;
UPDATE `trinity_string` SET `content_default`='Игроков онлайн: %u (макс: %u)' WHERE `entry`=60;
