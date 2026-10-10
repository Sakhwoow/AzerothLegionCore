/*
 * This file is part of the DestinyCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

#include "Chat.h"
#include "ScriptMgr.h"
#include "WorldSession.h"
#include "Player.h"
#include "Creature.h"
#include "GuildTaskMgr.h"
#include "RBAC.h"

// Phase 9 ("Legion Bot Architecture" plan): hooks GuildTaskMgr into the engine's own
// OnCreatureKill script hook (fires for every Player, bot or real, unconditionally - see
// Unit.cpp) so bot guild members can pick up/advance guild tasks from normal kills, with no
// separate per-tick sweep needed. GuildTaskMgr::OnCreatureKilled itself gates on
// killer->IsPlayerBot() internally via BotUtility::GuildTaskEnabled's config check path, but
// this hook only ever needs to fire for bots in the first place.
class GuildTaskPlayerScript : public PlayerScript
{
public:
	GuildTaskPlayerScript() : PlayerScript("GuildTaskPlayerScript") { }

	void OnCreatureKill(Player* killer, Creature* killed) override
	{
		if (killer && killer->IsPlayerBot())
			sGuildTaskMgr->OnCreatureKilled(killer, killed);
	}
};

// Deliberately a separate, open-to-everyone command (RBAC tier 195, same as .selfbot) since
// this is a read-only status check, not bot-admin tooling - any guild member should be able
// to see what task(s) their bot(s) are working on.
static bool HandleGuildTaskStatusCommand(ChatHandler* handler, const char* /*args*/)
{
	Player* self = handler->GetSession() ? handler->GetSession()->GetPlayer() : nullptr;
	if (!self)
		return false;

	if (!self->GetGuildId())
	{
		handler->SendSysMessage("You are not in a guild.");
		return true;
	}

	std::string status = sGuildTaskMgr->GetStatusText(self->GetGuildId());
	handler->SendSysMessage(status.c_str());
	return true;
}

class guildtask_commandscript : public CommandScript
{
public:
	guildtask_commandscript() : CommandScript("guildtask_commandscript") { }

	std::vector<ChatCommand> GetCommands() const override
	{
		static std::vector<ChatCommand> commandTable =
		{
			{ "guildtask", rbac::RBAC_PREM_COMMAND_GUILDTASK, false, &HandleGuildTaskStatusCommand, "" },
		};

		return commandTable;
	}
};

void AddSC_guildtask_script()
{
	new GuildTaskPlayerScript();
}

void AddSC_guildtask_commandscript()
{
	new guildtask_commandscript();
}
