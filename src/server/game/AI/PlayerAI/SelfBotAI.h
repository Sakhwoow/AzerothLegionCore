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

#ifndef _SELF_BOT_AI_H_
#define _SELF_BOT_AI_H_

#include <memory>
#include <vector>

class Item;
class Player;
class Unit;
class BotAiObjectContext;
class BotEngine;
class SelfBotWarriorAI;
class SelfBotPaladinAI;

// Lets a real, connected player opt into light AI assistance on their OWN character via
// .selfbot: continue attacking whatever they're already fighting, run a tiny per-class
// rotation, and drink an already-owned potion at low health/mana. Deliberately not full
// bot autonomy (no movement/follow/loot/buffs/target-picking) - see the "Selfbot" plan.
// Driven externally from PlayerScript::OnUpdate (see sc_selfbot.cpp), not from the
// engine's Unit::SetAI()/UnitAI mechanism, so it never touches IsPlayerBot() or anything
// gated on it.
//
// Phase 7 of the "Legion Bot Architecture" plan: heal/rotation decision-making now runs
// through m_Engine (BotEngine, see Engine/) instead of a hand-rolled if/else, via the thin
// RotationSpellAction/HealAllySpellAction adapters in Strategies/SelfBotStrategies.cpp -
// those adapters call straight back into ResolveCombatVictim()/TryUseRotationSpell()/
// TryUseHealSpell() below, unchanged, so this is a control-flow migration only, not new game
// logic. Those three are public for exactly that reason (called from the Action adapters via
// sSelfBotMgr->GetSelfBotAI(), not meant for anything else to call).
class TC_GAME_API SelfBotAI
{
public:
	SelfBotAI(Player* self);
	~SelfBotAI();

	bool IsActive() const { return m_Active; }
	void SetActive(bool active);
	void Update(uint32 diff);

	// Resolves this tick's combat target the same way Phase 1-4 always did (continue an
	// existing victim, else the client's current selection, else whatever is attacking us,
	// else a group member's victim as the lowest-priority fallback - never picks on its own)
	// and, as a side effect, engages it (Attack/MoveChase) if it wasn't already the active
	// victim. Returns nullptr if there's nothing to fight. Called by RotationSpellAction, not
	// Update() directly - see the class comment above.
	Unit* ResolveCombatVictim();
	bool TryUseHealSpell();
	bool TryUseRotationSpell(Unit* target);
	bool TryUseBuffSpell();

	// Thin wrapper over BotUtility::TryAutoGearFromBags, gated the same way buffing is (out of
	// combat only - TryAutoGearFromBags/TryAutoEquipUpgrade already refuse mid-combat too, this
	// is just the earliest, cheapest check). Scans the player's own bags rather than hooking a
	// loot event, since a selfbot has no AI object for LootHandler.cpp to dynamic_cast to - see
	// AutoGearSelfAction in SelfBotStrategies.cpp for where this is actually called from. Reads
	// this player's own "autogear quality"/"autogear ilvl" override values (0 = use the realm
	// default) - set via ".selfbot autogear <color>" / ".selfbot autogear <number>".
	bool TryUseAutoGear();

	// ".selfbot autogear reset" - mirrors AC's "autogear reset": move everything currently
	// equipped into bags (never destroyed, see BotUtility::TryUnequipAllToBags), then run the
	// bag-scan repeatedly until nothing more qualifies under the current quality/ilvl limits.
	// A real, user-invoked one-shot action (unlike TryUseAutoGear, not gated by the "autogear"
	// enabled toggle - requesting a reset IS the request to act).
	bool TryResetAndRegear();

	// Phase 8 (command skeleton): exposes the engine/value registry to cs_selfbot.cpp's
	// subcommand handlers and to the Action adapters in SelfBotStrategies.cpp, so a command
	// like ".selfbot stay" can flip a ManualBotValue<bool> the "rotation"/"follow" strategies'
	// actions read, without SelfBotAI needing a dedicated setter per flag.
	BotAiObjectContext* GetContext() const { return m_Context.get(); }

	// ".selfbot co dps" removes the "heal" strategy entirely (pure damage, never interrupts to
	// heal); ".selfbot co heal"/".selfbot co auto" restore it. Simpler than threading a tri-state
	// value through the engine - the strategy's own presence/absence IS the state here.
	void SetHealEnabled(bool enabled);

	// Public for the same reason ResolveCombatVictim/TryUseRotationSpell are (see class comment):
	// per-class "rich rotation" ports (SelfBotWarriorAI and, eventually, the other classes -
	// see Strategies/SelfBotClassRotation.h) need this exact safe-cast primitive and have no
	// other way to reach it, being plain BotXxxSpells-derived helpers with no SelfBotAI of
	// their own.
	bool TryCastFirstKnown(Unit* target, std::vector<uint32> const& spellList);

private:
	bool CanAct() const;
	Unit* FindGroupAssistTarget() const;
	void TryUseSelfPotion();
	Item* FindOwnedLifePotion() const;
	Item* FindOwnedManaPotion() const;

	std::unique_ptr<BotAiObjectContext> m_Context;
	std::unique_ptr<BotEngine> m_Engine;

	Player* me;
	bool m_Active;
	bool m_NeedMana;
	uint32 m_ActionTick;

	// Already-known rotation spells for this activation, in priority order (highest first) -
	// resolved once at SetActive(true) via BotUtility::FindMaxRankSpellByExist, same idea as
	// mod-playerbots' per-class NextAction priority list (e.g. DpsPaladinStrategy.cpp's
	// "hammer of wrath" > "judgement of wisdom" > "crusader strike" > ... > "melee" chain),
	// just without porting its Strategy/Action engine: TryUseRotationSpell tries each in
	// order and falls through to the next on failure, with plain melee auto-attack (Phase 1)
	// as the ultimate fallback if none are known/castable yet.
	std::vector<uint32> m_RotationSpells;

	// Same idea, for the 4 hybrid healer-capable classes only (Priest/Druid/Shaman/Paladin) -
	// empty (and TryUseHealSpell() a no-op) for every other class. Only ever used while in a
	// real group (Phase 3 scope: no solo behavior change) and only when a party member is
	// actually hurt - see TryUseHealSpell().
	std::vector<uint32> m_HealSpells;

	// One iconic, long-stable self-buff per class (empty for Rogue - classic rogues have no
	// real buff spell beyond poisons, which need reagent/weapon handling out of scope here).
	// Only ever applied out of combat (pre-pull maintenance), lowest-relevance of the default
	// actions - see TryUseBuffSpell()/BuffSelfAction.
	std::vector<uint32> m_BuffSpells;

	// Pilot of the "real per-class rotation, not the thin m_RotationSpells list" port (see
	// Strategies/SelfBotClassRotation.h) - null except for the one class matching me->getClass()
	// (if ported yet) until the remaining classes get the same treatment. TryUseRotationSpell
	// prefers whichever of these is set over m_RotationSpells.
	std::unique_ptr<SelfBotWarriorAI> m_WarriorRotation;
	std::unique_ptr<SelfBotPaladinAI> m_PaladinRotation;
};

#endif // !_SELF_BOT_AI_H_
