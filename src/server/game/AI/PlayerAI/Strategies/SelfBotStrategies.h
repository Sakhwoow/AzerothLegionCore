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

#ifndef _SELF_BOT_STRATEGIES_H_
#define _SELF_BOT_STRATEGIES_H_

// Phase 7 of the "Legion Bot Architecture" plan: re-expresses SelfBotAI's already-shipped
// heal/rotation logic as BotStrategy/BotAction instances on the Phase 6 engine, instead of the
// explicit `if (!TryUseHealSpell()) UpdateCombat();` branch it replaces. Deliberately thin
// adapters only - RotationSpellAction/HealAllySpellAction call straight back into SelfBotAI's
// existing, already-proven methods (SelfBotAI::TryUseRotationSpell/TryUseHealSpell/
// ResolveCombatVictim), so this is a control-flow migration with zero new game logic, not a
// rewrite. Registers itself with BotAiObjectContext once, lazily, on first use - see
// EnsureSelfBotStrategiesRegistered() in the .cpp.
void EnsureSelfBotStrategiesRegistered();

#endif // !_SELF_BOT_STRATEGIES_H_
