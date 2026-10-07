-- `command` holds permission-override rows for console/chat commands, matched against the
-- actual C++ command table on first use (ChatHandler::SetDataForCommandInTable). The only
-- subcommand cs_arena.cpp registers under "arena" is "end" (HandleEndArenaCommand) -- these
-- six rows reference subcommands with no corresponding C++ handler at all (not a rename, the
-- functionality is simply absent), so every server start logs six
-- "Table `command` contains a non-existing subcommand '...' in command 'arena ...', skipped."
-- warnings for nothing actionable. Safe to drop: a permission override for a command that
-- cannot be invoked has no effect either way.
DELETE FROM `command` WHERE `name` IN ('arena create','arena disband','arena rename','arena captain','arena info','arena lookup');
