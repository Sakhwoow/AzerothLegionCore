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

#ifndef _SELF_BOT_CLASS_ROTATION_H_
#define _SELF_BOT_CLASS_ROTATION_H_

#include "BotAISpells.h"

class Player;
class Unit;
class SelfBotAI;

// User's ask, verified against the real code rather than assumed: .selfbot's rotation was a
// separate, much thinner system (SelfBotAI::m_RotationSpells, 1-2 hand-picked spells, no spec
// awareness) than what random/account bots already have (BotFieldClassAI's full per-branch
// ProcessMeleeSpell priority chains, now correctly spec-selected via
// PlayerBotSetting::FindPlayerTalentType's Player::GetActiveTalentGroup() fix). Rather than
// maintain two divergent rotation systems, this ports the real per-class decision logic for
// reuse here too - starting with Warrior as the pilot (melee-only, already-read combat logic,
// no ranged-kiting complexity), one class at a time, same discipline as every other phase this
// session.
//
// What made this possible without dragging in BotFieldAI's full "spawned bot follows a master"
// machinery (confirmed unsafe to just instantiate - its constructor forces the character's PvP
// flag on as a side effect): BotWarriorSpells (BotAISpells.h) is already a clean, independent
// spell-id holder with its own InitializeSpells(Player*) - FieldWarriorAI inherits it via
// multiple inheritance (`class FieldWarriorAI : public BotFieldAI, public BotWarriorSpells`)
// specifically because it's meant to be reusable this way. The actual decision logic
// (ProcessMeleeSpell et al, FieldWarriorAI.cpp) is what's ported below, substituting:
//   - BotFieldAI::TryCastSpell -> SelfBotAI::TryCastFirstKnown (same safety contract - builds
//     the Spell directly and checks the real SpellCastResult, never Unit::CastSpell's
//     inverted-bool overload - this fork's own established trap, see SelfBotAI.cpp)
//   - RangeEnemyListByTargetIsMe/NonAura (BotFieldAI's grid-search nearby-enemy counters, each
//     pulling in further member-coupled helpers like IsNotSelect/TargetIsStealth) ->
//     Unit::getAttackers().size(), an already-available, simpler engine primitive with the same
//     practical meaning ("how many things are currently fighting me") - good enough for a real
//     player's own fight (rarely tanking a packed pull solo), flagged here as a known
//     simplification rather than a full line-for-line grid-search port.
//   - HasAuraMechanic -> BotUtility::HasAuraMechanic (new shared static, confirmed
//     self-contained by reading all 5 existing per-context copies - BotFieldAI/BotGroupAI/
//     BotDuelAI/BotAI/BotMovementAI all had an identical duplicate).
//   - Charge/Intercept gap-closers and ProcessFlee are deliberately NOT ported - they move the
//     character (MoveCharge/FleeMovement), which is outside .selfbot's scope by design (see the
//     original Selfbot plan: "no movement/follow/loot/buffs/target-picking" beyond continuing an
//     already-selected target) - a real player can walk into range themselves.
class SelfBotWarriorAI : public BotWarriorSpells
{
public:
	// Mirrors FieldWarriorAI::ProcessMeleeSpell's structure and priority order exactly (same
	// shared checks, then dispatch to the branch matching Player::GetActiveTalentGroup() -
	// Arms=0/Fury=1/Protection=2, verified against this file's own spell choices this session,
	// not assumed). Returns true if something was actually cast.
	bool ProcessMeleeSpell(SelfBotAI* owner, Player* me, Unit* target);

private:
	void UpdateWarriorPose(Player* me);
	uint32 GetRagePowerPer(Player* me);
	bool ProcessWeaponMeleeSpell(SelfBotAI* owner, Player* me, Unit* target);
	bool ProcessRageMeleeSpell(SelfBotAI* owner, Player* me, Unit* target);
	bool ProcessDefanceMeleeSpell(SelfBotAI* owner, Player* me, Unit* target);
};

// Same porting approach as SelfBotWarriorAI above - ported from FieldPaladinAI.cpp's
// ProcessMeleeSpell/ProcessAura. Deliberately leaves out everything that targets OTHER players
// (ProcessDispel's group-cleanse scan, NeedUseGuardWish/KingWish/WitWish/StrWish's group-blessing
// maintenance, ProcessHealthSpell's group-heal-search): selfbot already has its own, separate
// group-aware systems for buffing (TryUseBuffSpell) and healing (TryUseHealSpell) - porting the
// Field AI's versions too would just be a second, redundant implementation of the same job, not
// a gap to close. What's ported is the self-contained rotation/self-preservation logic that has
// no selfbot equivalent yet: the branch-specific melee finisher, Judgement (universal), the
// aura/stance upkeep, and the "heal myself if critically low mid-fight" safety net (a real
// Retribution/Holy Paladin ability choice, not something TryUseHealSpell covers solo - that one
// is group-only by its own original Phase 3 scope).
class SelfBotPaladinAI : public BotPaladinSpells
{
public:
	bool ProcessMeleeSpell(SelfBotAI* owner, Player* me, Unit* target);

private:
	uint32 GetManaPowerPer(Player* me);
	bool ProcessAura(SelfBotAI* owner, Player* me);
};

#endif // !_SELF_BOT_CLASS_ROTATION_H_
