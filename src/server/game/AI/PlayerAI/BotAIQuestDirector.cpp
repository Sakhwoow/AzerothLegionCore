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

#include "BotAIQuestDirector.h"
#include "BotAITool.h"
#include "BotBGAIMovement.h"
#include "Player.h"
#include "Creature.h"
#include "Map.h"
#include "ObjectAccessor.h"
#include "ObjectMgr.h"
#include "Cell.h"
#include "CellImpl.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "QuestDef.h"
#include "GossipDef.h"
#include "Log.h"
#include "PlayerBotSetting.h"

namespace
{
	uint32 const QD_SCAN_INTERVAL = 3000;
	float const QD_SCAN_RANGE = BOTAI_SEARCH_RANGE;
	float const QD_TRAVEL_ARRIVE_DIST = 3.0f;
	float const QD_OBJECTIVE_ARRIVE_DIST = 5.0f;
	uint32 const QD_TIMEOUT_TRAVEL = 60000;
	uint32 const QD_TIMEOUT_OBJECTIVE = 180000;
	uint8 const QD_GEAR_SYNC_LEVEL_STEP = 3;
	uint32 const QD_AVAILABLE_STATUS_MASK = DIALOG_STATUS_AVAILABLE | DIALOG_STATUS_AVAILABLE_REP |
		DIALOG_STATUS_LOW_LEVEL_AVAILABLE | DIALOG_STATUS_LOW_LEVEL_AVAILABLE_REP;
}

BotAIQuestDirector::BotAIQuestDirector(Player* self) :
	me(self),
	m_Active(false),
	m_State(QD_STATE_IDLE),
	m_CurrentQuestId(0),
	m_ObjectiveStorageIndex(-1),
	m_StateTick(0),
	m_ScanTick(0),
	m_LevelAtLastGearSync(self ? self->getLevel() : 0)
{
}

void BotAIQuestDirector::SetActive(bool active)
{
	if (m_Active == active)
		return;
	m_Active = active;
	if (!active)
	{
		m_State = QD_STATE_IDLE;
		m_CurrentQuestId = 0;
		m_GiverGUID.Clear();
		m_ObjectiveStorageIndex = -1;
	}
	if (BotUtility::QuestAIDebug)
		TC_LOG_INFO("server.loading", ">> QuestAI: %s (%s) %s", me->GetName().c_str(), me->GetGUID().ToString().c_str(), active ? "enabled" : "disabled");
}

void BotAIQuestDirector::EnterState(BotQuestDirectorState state)
{
	m_State = state;
	m_StateTick = getMSTime();
}

bool BotAIQuestDirector::StateTimedOut(uint32 limitMs) const
{
	return getMSTimeDiff(m_StateTick, getMSTime()) > limitMs;
}

void BotAIQuestDirector::Update(BotBGAIMovement* pMovement)
{
	if (!m_Active || !pMovement)
		return;
	// re-check the conditions that can change over a bot's lifetime (as opposed to the
	// one-time eligibility roll done when this was armed) so a bot that gets grouped,
	// queues into a BG/arena/LFG, or outlevels the quest-AI cap cleanly falls back to
	// ordinary field behaviour - which also makes it eligible for the ambient-population
	// draft again, since that pool skips bots for which IsActive() is still true
	if (me->getLevel() >= BotUtility::QuestAIMaxLevel || me->GetGroup() || me->InBattleground() || me->InArena() || me->isUsingLfg())
	{
		SetActive(false);
		return;
	}
	if (!me->IsAlive() || me->IsInCombat() || me->HasUnitState(UNIT_STATE_CASTING))
		return;

	MaybeSyncGear();

	switch (m_State)
	{
	case QD_STATE_IDLE:
		UpdateIdle(pMovement);
		break;
	case QD_STATE_TRAVEL_TO_GIVER:
		UpdateTravelToGiver(pMovement);
		break;
	case QD_STATE_TRAVEL_TO_OBJECTIVE:
		UpdateTravelToObjective(pMovement);
		break;
	case QD_STATE_RETURN_TO_TURNIN:
		UpdateReturnToTurnIn(pMovement);
		break;
	}
}

void BotAIQuestDirector::MaybeSyncGear()
{
	if (me->getLevel() < m_LevelAtLastGearSync)
	{
		m_LevelAtLastGearSync = me->getLevel();
		return;
	}
	if (me->getLevel() < m_LevelAtLastGearSync + QD_GEAR_SYNC_LEVEL_STEP)
		return;
	m_LevelAtLastGearSync = me->getLevel();
	WorldSession* pSession = me->GetSession();
	if (!pSession || pSession->HasSchedules())
		return;
	if (BotUtility::QuestAIDebug)
		TC_LOG_INFO("server.loading", ">> QuestAI: %s (%s) gear resync at level %u", me->GetName().c_str(), me->GetGUID().ToString().c_str(), me->getLevel());
	me->ResetPlayerToLevel(me->getLevel(), 3);
}

// Detection only: locates a nearby creature that currently has something available for
// this bot (per the engine's own GetQuestDialogStatus), without attempting to accept yet -
// acceptance only happens once the bot is actually within interaction range (see
// UpdateIdle/UpdateTravelToGiver), so this is safe to call for distant candidates too.
bool BotAIQuestDirector::FindQuestgiverNearby()
{
	std::list<Creature*> nearCreatures;
	Trinity::AllWorldObjectsInRange checker(me, QD_SCAN_RANGE);
	Trinity::CreatureListSearcher<Trinity::AllWorldObjectsInRange> searcher(me, nearCreatures, checker);
	Cell::VisitGridObjects(me, searcher, QD_SCAN_RANGE);

	for (Creature* pCreature : nearCreatures)
	{
		if (!pCreature->IsAlive() || pCreature->IsInEvadeMode())
			continue;
		if (!pCreature->IsQuestGiver())
			continue;
		if (me->IsValidAttackTarget(pCreature))
			continue;
		uint32 status = uint32(me->GetQuestDialogStatus(pCreature));
		if (!(status & QD_AVAILABLE_STATUS_MASK))
			continue;

		m_GiverGUID = pCreature->GetGUID();
		m_GiverPos = pCreature->GetPosition();
		return true;
	}
	return false;
}

bool BotAIQuestDirector::IsQuestWorthDoing(Quest const* quest) const
{
	if (!quest)
		return false;
	if (quest->IsDaily() || quest->IsWeekly() || quest->IsRepeatable())
		return false;
	if (quest->GetSuggestedPlayers() > 1)
		return false;
	if (quest->IsWorldQuest())
		return false;
	if (int32(quest->GetQuestLevel()) > int32(me->getLevel()) + 3)
		return false;
	return true;
}

bool BotAIQuestDirector::TryAcceptQuestsAt(WorldObject* questGiver)
{
	if (!questGiver || !me->CanInteractWithQuestGiver(questGiver))
		return false;

	// already working an accepted quest this run - keep progressing it instead of
	// grabbing another one at the same stop
	if (m_CurrentQuestId != 0)
		return false;

	me->PrepareQuestMenu(questGiver->GetGUID());
	QuestMenu& menu = me->PlayerTalkClass->GetQuestMenu();

	for (uint8 i = 0; i < menu.GetMenuItemCount(); ++i)
	{
		QuestMenuItem const& item = menu.GetItem(i);
		Quest const* quest = sObjectMgr->GetQuestTemplate(item.QuestId);
		if (!quest)
			continue;
		if (me->GetQuestStatus(item.QuestId) != QUEST_STATUS_NONE)
			continue;
		if (!me->CanTakeQuest(quest, false))
			continue;
		if (!IsQuestWorthDoing(quest))
			continue;

		me->AddQuestAndCheckCompletion(quest, questGiver);

		m_CurrentQuestId = item.QuestId;
		m_GiverGUID = questGiver->GetGUID();
		m_GiverPos = questGiver->GetPosition();
		m_ObjectiveStorageIndex = -1;

		if (BotUtility::QuestAIDebug)
			TC_LOG_INFO("server.loading", ">> QuestAI: %s (%s) accepted quest %u", me->GetName().c_str(), me->GetGUID().ToString().c_str(), m_CurrentQuestId);

		if (me->GetQuestStatus(m_CurrentQuestId) == QUEST_STATUS_COMPLETE)
			EnterState(QD_STATE_RETURN_TO_TURNIN);
		else if (PickObjectivePosition())
			EnterState(QD_STATE_TRAVEL_TO_OBJECTIVE);
		else
			EnterState(QD_STATE_RETURN_TO_TURNIN);
		return true;
	}
	return false;
}

void BotAIQuestDirector::UpdateIdle(BotBGAIMovement* pMovement)
{
	uint32 now = getMSTime();
	if (now - m_ScanTick < QD_SCAN_INTERVAL)
		return;
	m_ScanTick = now;

	if (!FindQuestgiverNearby())
		return;

	if (me->GetDistance(m_GiverPos) <= QD_TRAVEL_ARRIVE_DIST)
	{
		if (Creature* giver = ObjectAccessor::GetCreature(*me, m_GiverGUID))
			TryAcceptQuestsAt(giver);
		return;
	}
	EnterState(QD_STATE_TRAVEL_TO_GIVER);
	pMovement->MovementTo(m_GiverPos.GetPositionX(), m_GiverPos.GetPositionY(), m_GiverPos.GetPositionZ(), QD_TRAVEL_ARRIVE_DIST);
}

void BotAIQuestDirector::UpdateTravelToGiver(BotBGAIMovement* pMovement)
{
	Creature* giver = ObjectAccessor::GetCreature(*me, m_GiverGUID);
	if (!giver || !giver->IsAlive())
	{
		EnterState(QD_STATE_IDLE);
		return;
	}

	if (me->GetDistance(giver) <= QD_TRAVEL_ARRIVE_DIST + 1.0f)
	{
		if (!TryAcceptQuestsAt(giver))
			EnterState(QD_STATE_IDLE);
		return;
	}
	if (StateTimedOut(QD_TIMEOUT_TRAVEL))
	{
		EnterState(QD_STATE_IDLE);
		return;
	}
	pMovement->MovementTo(giver->GetGUID(), QD_TRAVEL_ARRIVE_DIST);
}

bool BotAIQuestDirector::PickObjectivePosition()
{
	Quest const* quest = sObjectMgr->GetQuestTemplate(m_CurrentQuestId);
	if (!quest)
		return false;

	QuestObjective const* targetObjective = nullptr;
	int32 objectiveIndex = -1;
	QuestObjectives const& objectives = quest->GetObjectives();
	for (size_t i = 0; i < objectives.size(); ++i)
	{
		if (objectives[i].IsStoringFlag())
			continue;
		if (me->IsQuestObjectiveComplete(objectives[i]))
			continue;
		targetObjective = &objectives[i];
		objectiveIndex = int32(i);
		break;
	}
	if (!targetObjective)
		return false;
	m_ObjectiveStorageIndex = targetObjective->StorageIndex;

	QuestPOIVector const* poiVector = sObjectMgr->GetQuestPOIVector(int32(m_CurrentQuestId));
	if (poiVector)
	{
		for (QuestPOI const& poi : *poiVector)
		{
			if (poi.QuestObjectiveID != int32(targetObjective->ID) && poi.ObjectiveIndex != objectiveIndex)
				continue;
			if (poi.points.empty())
				continue;
			QuestPOIPoint const& point = poi.points[poi.points.size() / 2];
			float x = float(point.X);
			float y = float(point.Y);
			float z = me->GetPositionZ();
			z = me->GetMap()->GetHeight(me->GetPhaseShift(), x, y, z);
			m_ObjectivePos = Position(x, y, z, 0.0f);
			return true;
		}
	}

	// no POI data for this quest/objective - stay near the giver and let ordinary
	// field-bot wandering/combat eventually pick it up; the timeout-abandon in
	// UpdateTravelToObjective is the safety net if that never happens
	m_ObjectivePos = m_GiverPos;
	return true;
}

void BotAIQuestDirector::UpdateTravelToObjective(BotBGAIMovement* pMovement)
{
	Quest const* quest = sObjectMgr->GetQuestTemplate(m_CurrentQuestId);
	if (!quest || me->GetQuestStatus(m_CurrentQuestId) == QUEST_STATUS_NONE)
	{
		Abandon("quest no longer in log");
		return;
	}
	if (me->GetQuestStatus(m_CurrentQuestId) == QUEST_STATUS_COMPLETE || me->IsQuestObjectiveProgressComplete(quest))
	{
		EnterState(QD_STATE_RETURN_TO_TURNIN);
		return;
	}

	// re-pick in case the objective we were walking to has since been completed by
	// ambient play (e.g. a kill credit from unrelated combat) and a different one
	// still needs work
	bool stillTrackingSameObjective = false;
	for (QuestObjective const& obj : quest->GetObjectives())
	{
		if (obj.StorageIndex != m_ObjectiveStorageIndex)
			continue;
		stillTrackingSameObjective = !me->IsQuestObjectiveComplete(obj);
		break;
	}
	if (!stillTrackingSameObjective && !PickObjectivePosition())
	{
		EnterState(QD_STATE_RETURN_TO_TURNIN);
		return;
	}

	float dist = me->GetDistance(m_ObjectivePos);
	if (dist <= QD_OBJECTIVE_ARRIVE_DIST)
	{
		// close enough: let ordinary field-bot combat/loot AI opportunistically get
		// credit, we just keep polling until progress happens or we time out
		if (StateTimedOut(QD_TIMEOUT_OBJECTIVE))
			Abandon("no progress on quest objective");
		return;
	}
	if (StateTimedOut(QD_TIMEOUT_TRAVEL))
	{
		Abandon("timed out travelling to quest objective");
		return;
	}
	pMovement->MovementTo(m_ObjectivePos.GetPositionX(), m_ObjectivePos.GetPositionY(), m_ObjectivePos.GetPositionZ(), QD_OBJECTIVE_ARRIVE_DIST);
}

void BotAIQuestDirector::TryTurnInAt(WorldObject* questGiver)
{
	if (!questGiver || !me->CanInteractWithQuestGiver(questGiver))
		return;

	Quest const* quest = sObjectMgr->GetQuestTemplate(m_CurrentQuestId);
	if (!quest || me->GetQuestStatus(m_CurrentQuestId) != QUEST_STATUS_COMPLETE)
	{
		Abandon("quest not actually complete at turn-in");
		return;
	}

	uint32 reward = 0;
	if (quest->GetRewChoiceItemsCount() > 0)
		reward = quest->RewardChoiceItemId[0];

	if (!me->CanRewardQuest(quest, reward, false))
	{
		Abandon("CanRewardQuest refused at turn-in");
		return;
	}

	uint32 questId = m_CurrentQuestId;
	uint8 levelBefore = me->getLevel();
	me->RewardQuest(quest, reward, questGiver, true);

	if (BotUtility::QuestAIDebug)
		TC_LOG_INFO("server.loading", ">> QuestAI: %s (%s) turned in quest %u (level %u -> %u)",
			me->GetName().c_str(), me->GetGUID().ToString().c_str(), questId, levelBefore, me->getLevel());

	m_CurrentQuestId = 0;
	m_GiverGUID.Clear();
	m_ObjectiveStorageIndex = -1;
	EnterState(QD_STATE_IDLE);
	m_ScanTick = 0; // allow an immediate re-scan for a follow-up quest at the same giver
}

void BotAIQuestDirector::UpdateReturnToTurnIn(BotBGAIMovement* pMovement)
{
	Creature* giver = ObjectAccessor::GetCreature(*me, m_GiverGUID);
	if (!giver || !giver->IsAlive())
	{
		Abandon("questgiver vanished before turn-in");
		return;
	}

	if (me->GetDistance(giver) <= QD_TRAVEL_ARRIVE_DIST + 1.0f)
	{
		TryTurnInAt(giver);
		return;
	}
	if (StateTimedOut(QD_TIMEOUT_TRAVEL))
	{
		Abandon("timed out returning to turn in quest");
		return;
	}
	pMovement->MovementTo(giver->GetGUID(), QD_TRAVEL_ARRIVE_DIST);
}

void BotAIQuestDirector::Abandon(char const* reason)
{
	if (BotUtility::QuestAIDebug)
		TC_LOG_INFO("server.loading", ">> QuestAI: %s (%s) abandoning quest %u: %s",
			me->GetName().c_str(), me->GetGUID().ToString().c_str(), m_CurrentQuestId, reason);

	if (m_CurrentQuestId != 0 && me->GetQuestStatus(m_CurrentQuestId) == QUEST_STATUS_INCOMPLETE)
	{
		if (Quest const* quest = sObjectMgr->GetQuestTemplate(m_CurrentQuestId))
			me->RemoveActiveQuest(quest, false);
	}

	m_CurrentQuestId = 0;
	m_GiverGUID.Clear();
	m_ObjectiveStorageIndex = -1;
	EnterState(QD_STATE_IDLE);
}
