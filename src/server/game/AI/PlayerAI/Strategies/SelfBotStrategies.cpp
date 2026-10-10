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

#include "SelfBotStrategies.h"
#include "BotAction.h"
#include "BotAiObjectContext.h"
#include "BotStrategy.h"
#include "BotValue.h"
#include "SelfBotAI.h"
#include "SelfBotMgr.h"
#include "Player.h"
#include "Group.h"
#include "ObjectAccessor.h"
#include "MotionMaster.h"

namespace
{
	// Resolves the target's rotation and casts the first known spell that succeeds - a thin
	// adapter over SelfBotAI::ResolveCombatVictim()/TryUseRotationSpell(), both unchanged from
	// before this migration. Mirrors the second half of the old UpdateCombat(): only reached
	// when the heal action (higher relevance, below) didn't do anything this tick.
	class RotationSpellAction : public BotAction
	{
	public:
		RotationSpellAction(Player* bot) : BotAction(bot, "rotation spell") { }

		bool Execute(Unit* /*target*/) override
		{
			SelfBotAI* ai = sSelfBotMgr->GetSelfBotAI(m_bot);
			if (!ai)
				return false;

			Unit* victim = ai->ResolveCombatVictim();
			if (!victim)
				return false;

			return ai->TryUseRotationSpell(victim);
		}
	};

	class SelfBotRotationStrategy : public BotStrategy
	{
	public:
		SelfBotRotationStrategy(Player* bot) : BotStrategy(bot) { }

		std::string const GetName() override { return "rotation"; }

		std::vector<NextBotAction> GetDefaultActions() override
		{
			return { NextBotAction("rotation spell", BOT_ACTION_DEFAULT) };
		}
	};

	// Thin adapter over SelfBotAI::TryUseHealSpell() (unchanged - group scan, lowest-HP ally,
	// cast first known heal). Higher relevance than "rotation spell" so the engine tries this
	// first every tick, exactly reproducing the old `if (!TryUseHealSpell()) UpdateCombat();`:
	// if this Execute() returns false (no-op - solo, nobody hurt, or nothing known/castable),
	// BotEngine::DoNextAction falls through to "rotation spell" automatically.
	class HealAllySpellAction : public BotAction
	{
	public:
		HealAllySpellAction(Player* bot) : BotAction(bot, "heal ally") { }

		bool Execute(Unit* /*target*/) override
		{
			SelfBotAI* ai = sSelfBotMgr->GetSelfBotAI(m_bot);
			if (!ai)
				return false;

			return ai->TryUseHealSpell();
		}
	};

	class SelfBotHealStrategy : public BotStrategy
	{
	public:
		SelfBotHealStrategy(Player* bot) : BotStrategy(bot) { }

		std::string const GetName() override { return "heal"; }

		std::vector<NextBotAction> GetDefaultActions() override
		{
			return { NextBotAction("heal ally", BOT_ACTION_HIGH) };
		}
	};

	// One self-buff maintained out of combat only (SelfBotAI::TryUseBuffSpell already refuses
	// while in combat) - relevance sits between "rotation spell" (DEFAULT) and "follow leader"
	// (IDLE): in combat, rotation always wins every tick before this is ever reached; out of
	// combat, this runs once per missing buff, then "follow leader" takes over once nothing is
	// left to buff.
	class BuffSelfAction : public BotAction
	{
	public:
		BuffSelfAction(Player* bot) : BotAction(bot, "buff self") { }

		bool Execute(Unit* /*target*/) override
		{
			SelfBotAI* ai = sSelfBotMgr->GetSelfBotAI(m_bot);
			if (!ai)
				return false;

			return ai->TryUseBuffSpell();
		}
	};

	class SelfBotBuffStrategy : public BotStrategy
	{
	public:
		SelfBotBuffStrategy(Player* bot) : BotStrategy(bot) { }

		std::string const GetName() override { return "buff"; }

		std::vector<NextBotAction> GetDefaultActions() override
		{
			return { NextBotAction("buff self", 3.0f) };
		}
	};

	// Phase 8 (".selfbot follow"): maintains a standing MoveFollow on the group leader while
	// out of combat. Lowest relevance of the three default actions (BOT_ACTION_IDLE, below both
	// "heal ally" and "rotation spell"), so BotEngine only ever reaches this once neither of
	// those did anything that tick - i.e. only when there's genuinely nothing to fight or heal,
	// never fighting the player's own combat movement. Reissues MoveFollow every time it runs,
	// same unconditional-reissue reasoning as ResolveCombatVictim()'s MoveChase (Mutate() just
	// replaces the generator, harmless to repeat).
	class FollowLeaderAction : public BotAction
	{
	public:
		FollowLeaderAction(Player* bot) : BotAction(bot, "follow leader") { }

		bool Execute(Unit* /*target*/) override
		{
			SelfBotAI* ai = sSelfBotMgr->GetSelfBotAI(m_bot);
			if (!ai)
				return false;

			BotValue<bool>* follow = ai->GetContext()->GetValue<bool>("follow");
			if (!follow || !follow->Get())
				return false;

			Group* group = m_bot->GetGroup();
			if (!group)
				return false;

			Player* leader = ObjectAccessor::FindPlayer(group->GetLeaderGUID());
			if (!leader || leader == m_bot || !leader->IsAlive() || leader->GetMap() != m_bot->GetMap())
				return false;

			m_bot->GetMotionMaster()->MoveFollow(leader, 2.0f, 0.0f);
			return true;
		}
	};

	class SelfBotFollowStrategy : public BotStrategy
	{
	public:
		SelfBotFollowStrategy(Player* bot) : BotStrategy(bot) { }

		std::string const GetName() override { return "follow"; }

		std::vector<NextBotAction> GetDefaultActions() override
		{
			return { NextBotAction("follow leader", BOT_ACTION_IDLE) };
		}
	};
}

void EnsureSelfBotStrategiesRegistered()
{
	static bool registered = false;
	if (registered)
		return;
	registered = true;

	BotAiObjectContext::RegisterAction("rotation spell", [](Player* bot) -> BotAction*
	{
		return new RotationSpellAction(bot);
	});
	BotAiObjectContext::RegisterAction("heal ally", [](Player* bot) -> BotAction*
	{
		return new HealAllySpellAction(bot);
	});
	BotAiObjectContext::RegisterStrategy("rotation", [](Player* bot) -> BotStrategy*
	{
		return new SelfBotRotationStrategy(bot);
	});
	BotAiObjectContext::RegisterStrategy("heal", [](Player* bot) -> BotStrategy*
	{
		return new SelfBotHealStrategy(bot);
	});
	BotAiObjectContext::RegisterAction("follow leader", [](Player* bot) -> BotAction*
	{
		return new FollowLeaderAction(bot);
	});
	BotAiObjectContext::RegisterStrategy("follow", [](Player* bot) -> BotStrategy*
	{
		return new SelfBotFollowStrategy(bot);
	});
	BotAiObjectContext::RegisterAction("buff self", [](Player* bot) -> BotAction*
	{
		return new BuffSelfAction(bot);
	});
	BotAiObjectContext::RegisterStrategy("buff", [](Player* bot) -> BotStrategy*
	{
		return new SelfBotBuffStrategy(bot);
	});

	// Phase 8 command-driven flags - plain ManualBotValue<bool> slots, default off, read by
	// ResolveCombatVictim() ("stay") / FollowLeaderAction ("follow") / the ready-check hook in
	// SelfBotMgr ("auto ready", default ON since there's no real downside to auto-confirming
	// your own ready state while selfbot is active - see GroupHandler.cpp).
	BotAiObjectContext::RegisterValue("stay", [](Player*) -> UntypedBotValue*
	{
		return new ManualBotValue<bool>(false);
	});
	BotAiObjectContext::RegisterValue("follow", [](Player*) -> UntypedBotValue*
	{
		return new ManualBotValue<bool>(false);
	});
	BotAiObjectContext::RegisterValue("auto ready", [](Player*) -> UntypedBotValue*
	{
		return new ManualBotValue<bool>(true);
	});
}
