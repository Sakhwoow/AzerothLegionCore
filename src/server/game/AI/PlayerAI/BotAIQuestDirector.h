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

#ifndef _BOT_AI_QUEST_DIRECTOR_H_
#define _BOT_AI_QUEST_DIRECTOR_H_

#include "Position.h"
#include "ObjectGuid.h"

class Player;
class WorldObject;
class BotBGAIMovement;
class Quest;

enum BotQuestDirectorState : uint8
{
	QD_STATE_IDLE = 0,
	QD_STATE_TRAVEL_TO_GIVER,
	QD_STATE_TRAVEL_TO_OBJECTIVE,
	QD_STATE_RETURN_TO_TURNIN,
};

// Phase 1 MVP autonomous quest AI for ungrouped field bots. Reuses the engine's own
// quest API directly (no packet faking) and the existing BotBGAIMovement pathing. Does
// not branch per objective type: walks to the quest's QuestPOI cluster for the current
// objective and lets ordinary combat/loot AI opportunistically get credit, same shortcut
// mod-playerbots' NewRpg system uses - works for MONSTER/ITEM/GAMEOBJECT/TALKTO objectives.
class TC_GAME_API BotAIQuestDirector
{
public:
	BotAIQuestDirector(Player* self);
	~BotAIQuestDirector() {}

	bool IsActive() const { return m_Active; }
	void SetActive(bool active);
	void Update(BotBGAIMovement* pMovement);

private:
	void UpdateIdle(BotBGAIMovement* pMovement);
	void UpdateTravelToGiver(BotBGAIMovement* pMovement);
	void UpdateTravelToObjective(BotBGAIMovement* pMovement);
	void UpdateReturnToTurnIn(BotBGAIMovement* pMovement);

	bool FindQuestgiverNearby();
	bool TryAcceptQuestsAt(WorldObject* questGiver);
	bool IsQuestWorthDoing(Quest const* quest) const;
	bool PickObjectivePosition();
	void TryTurnInAt(WorldObject* questGiver);
	void Abandon(char const* reason);
	void EnterState(BotQuestDirectorState state);
	bool StateTimedOut(uint32 limitMs) const;
	void MaybeSyncGear();

	Player* me;
	bool m_Active;
	BotQuestDirectorState m_State;

	uint32 m_CurrentQuestId;
	ObjectGuid m_GiverGUID;
	Position m_GiverPos;
	Position m_ObjectivePos;
	int8 m_ObjectiveStorageIndex;

	uint32 m_StateTick;
	uint32 m_ScanTick;
	uint8 m_LevelAtLastGearSync;

	// Snapshot of where/which zone this bot was in when quest AI armed (SetActive(true)).
	// Without this, nothing stops a chain of quest turn-ins from walking a bot out of its
	// starting zone one short hop at a time - each individual giver-scan/objective-travel
	// distance is small, but it compounds over many quest cycles. Candidates outside the
	// home zone (FindQuestgiverNearby) or too far from the home position
	// (PickObjectivePosition) are rejected so the bot stays local for this phase.
	uint32 m_HomeZoneId;
	Position m_HomePos;
};

#endif // !_BOT_AI_QUEST_DIRECTOR_H_
