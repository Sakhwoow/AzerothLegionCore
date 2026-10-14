/*
    Invasion Valshara
*/

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScenarioMgr.h"
#include "Scenario.h"
#include "InstanceScenario.h"
#include "Conversation.h"
#include "GameObject.h"
#include "DB2Stores.h"

class instance_invasion_valshara : public InstanceMapScript
{
public:
    instance_invasion_valshara() : InstanceMapScript("instance_invasion_valshara", 1704) { }

    InstanceScript* GetInstanceScript(InstanceMap* map) const override
    {
        return new instance_invasion_valshara_InstanceMapScript(map);
    }

    struct instance_invasion_valshara_InstanceMapScript : public InstanceScript
    {
        instance_invasion_valshara_InstanceMapScript(InstanceMap* map) : InstanceScript(map) {}

        GuidList StartedGroup;
        ObjectGuid StalkerTarget;
        
        void Initialize() override
        {
            StartedGroup.clear();
            StalkerTarget.Clear();
        }


        void OnPlayerEnter(Player* player) override
        {
            if (!player)
                return;

            if (player->GetQuestStatus(45856) != QUEST_STATUS_INCOMPLETE)
            {
                player->AddDelayedEvent(2000, [player]() -> void
                {
                    player->TeleportTo(1220, -834.95f, 4277.59f, 746.25f, 1.0f);
                });
                return;
            }

            player->AddDelayedEvent(5000, [player]() -> void
            {
                Conversation::CreateConversation(4587, player, player->GetPosition(), { player->GetGUID() });
            });
        }

        void OnPlayerDeath(Player* player) override
        {
            InstanceScript::OnPlayerDeath(player);

            uint32 graveyardId = 5885;
            if (m_ScenarioStep >= 1 && m_ScenarioStep <= 6)
                graveyardId = 5887;
            else if (m_ScenarioStep >= 7)
                graveyardId = 5888;

            if (WorldSafeLocsEntry const* gy = sWorldSafeLocsStore.LookupEntry(graveyardId))
                player->TeleportTo(gy->MapID, gy->Loc.X, gy->Loc.Y, gy->Loc.Z, player->GetOrientation());
        }

        void OnCreatureCreate(Creature* creature) override
        {
            switch(creature->GetEntry())
            {
                case 118445:
                if (creature->GetPositionY() <= 7789.52f)
                    StartedGroup.push_back(creature->GetGUID());
                break;
                case 118463:
                    StalkerTarget = creature->GetGUID();
                break;
            }
        }   
        
        void OnUnitDeath(Unit* creature) override
        {     
            if (creature->GetEntry() == 118180)
            {
                if (InstanceScenario* scenario = instance->GetInstanceScenario())
                    if (ScenarioEntry const* scenarioEntry = scenario->GetEntry())
                        for (ScenarioStepEntry const* step : sScenarioStepStore)
                            if (step->ScenarioID == scenarioEntry->ID && step->ID == 8)
                            {
                                scenario->SetStep(step);
                                break;
                            }
            }
        }
        
        
        void updateCriteriaForPlayers(int32 objective)
        {
            Map::PlayerList const &PlList = instance->GetPlayers();

            if (PlList.isEmpty())
                return;
            
            for (Map::PlayerList::const_iterator i = PlList.begin(); i != PlList.end(); ++i)
                if (Player* player = i->GetSource())
                {
                    if (objective > 0)
                        player->UpdateCriteria(CRITERIA_TYPE_SEND_EVENT, uint32(objective));
                    else
                        Conversation::CreateConversation(uint32(abs(objective)), player, player->GetPosition(), { player->GetGUID() });
                    break;
                }
        }

        void onScenarionNextStep(uint32 newStep)
        {
            switch(newStep)
            {
                case 1:
                    for (auto guid : StartedGroup)
                    {
                        if (Creature* cre = instance->GetCreature(guid))
                            cre->GetMotionMaster()->MovePath(10993812, false);
                    }
                    break;
                case 2:
                    updateCriteriaForPlayers(-4983);
                    break;
                case 3:
                    updateCriteriaForPlayers(-4355);
                    if (Creature* cre = instance->GetCreature(StalkerTarget))
                    {
                        if (GameObject* go = cre->FindNearestGameObject(268519, 20.0f))
                            go->Delete();
                        
                        cre->DespawnOrUnsummon();
                    }
                    break;
                case 4:
                    updateCriteriaForPlayers(-4356);
                    break;
                case 6:
                    updateCriteriaForPlayers(-4357);
                    break;
                case 8:
                    updateCriteriaForPlayers(-4438);
                    break;
            }
        }
        
    };
};

void AddSC_instance_invasion_valshara()
{
    new instance_invasion_valshara();
}
