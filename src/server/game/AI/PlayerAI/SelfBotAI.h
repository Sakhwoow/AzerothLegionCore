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

#include <vector>

class Player;
class Unit;

// Lets a real, connected player opt into light AI assistance on their OWN character via
// .selfbot: continue attacking whatever they're already fighting, run a tiny per-class
// rotation, and drink an already-owned potion at low health/mana. Deliberately not full
// bot autonomy (no movement/follow/loot/buffs/target-picking) - see the "Selfbot" plan.
// Driven externally from PlayerScript::OnUpdate (see sc_selfbot.cpp), not from the
// engine's Unit::SetAI()/UnitAI mechanism, so it never touches IsPlayerBot() or anything
// gated on it.
class TC_GAME_API SelfBotAI
{
public:
	SelfBotAI(Player* self);
	~SelfBotAI() {}

	bool IsActive() const { return m_Active; }
	void SetActive(bool active);
	void Update(uint32 diff);

private:
	bool CanAct() const;
	void UpdateCombat();
	void TryUseRotationSpell(Unit* target);
	void TryUseSelfPotion();
	Item* FindOwnedLifePotion() const;
	Item* FindOwnedManaPotion() const;

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
};

#endif // !_SELF_BOT_AI_H_
