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


#ifndef _BOT_AI_TOOL_H
#define _BOT_AI_TOOL_H

#include "ScriptSystem.h"
#include "PlayerAI.h"
#include "Player.h"
#include "PlayerBotTalkMgr.h"

#define ARENA_PLAYER_BOT_AURA 80849
#define ARENA_WARRIOR_BOT_AURA 80850
#define ARENA_PALADIN_BOT_AURA 80851
#define ARENA_ROGUE_BOT_AURA 80852
#define ARENA_HUNTER_BOT_AURA 80853
#define ARENA_SHAMAN_BOT_AURA 80854
#define ARENA_MAGE_BOT_AURA 80855
#define ARENA_WARLOCK_BOT_AURA 80856
#define ARENA_PRIEST_BOT_AURA 80857
#define ARENA_DRUID_BOT_AURA 80858

#define BOTAI_UPDATE_TICK 500

#define BOTAI_MAXTARGET_TICKTIME 30000
#define BOTAI_FIELDTELEPORT_DISTANCE 80
#define BOTAI_SEARCH_RANGE 32
#define BOTAI_RANGESPELL_DISTANCE 28
#define BOTAI_TOTEMRANGE 18
#define BOTAI_FLEE_JUDGE 14

#define NEEDFLEE_CHECKRANGE 10

enum ShamanTotemPattern
{
    ShamanTP_None = 0,
    ShamanTP_Normal = 1,
    ShamanTP_Flee = 2,
    ShamanTP_Heal = 3,
    ShamanTP_Melee = 4,
    ShamanTP_Range = 5
};

enum BOTAI_WORKTYPE
{
    AIWT_TANK,
    AIWT_MELEE,
    AIWT_RANGE,
    AIWT_HEAL,
    AIWT_ALL
};

struct SpellEntry;
class Player;
class Group;
class GameObject;
class BotBGAIMovement;
class BotFieldAI;

class TC_GAME_API BotUtility
{
public:
    static float BattlegroundScoreRate;
    static float DungeonBotDamageModify;
    static float DungeonBotEndureModify;
    static bool BotCanForceRevive;
    static bool BotCanSettingToMaster;
    static int32 BotCritTakenAddion;
    static bool ControllSpellDiminishing;
    static bool ControllSpellFromDmgBreak;
    static bool DownBotArenaTeam;
    static bool ArenaIsHell;
    static uint32 BotArenaTeamTactics;
    static bool DisableDKQuest;
    static bool QuestAIEnabled;
    static uint32 QuestAIPercent;
    static uint32 QuestAIMaxLevel;
    static bool QuestAIDebug;
    // Separate sub-toggle, off by default even once QuestAIEnabled is on: world quests have a
    // different lifecycle (time-limited, not always in the usual home-zone radius) than the
    // static quests BotAIQuestDirector was originally built around. Confirmed via the live
    // Legion world DB that this isn't blocked by the existing IsDaily/IsWeekly/IsRepeatable
    // exclusion already in IsQuestWorthDoing() (of 1133 real world-quest rows, only 6/5/0 trip
    // those flags) - so this toggle is the only thing standing between "on" and actually trying
    // them, and should stay separately gated until soak-tested on its own.
    static bool QuestAIWorldQuestEnabled;
    static uint32 SelfBotLevel;
    static bool SelfBotDebug;
    // Phase 9 ("Legion Bot Architecture" plan, gear scoring): off by default on purpose - this
    // is a fresh, deliberately simple scoring approximation (see EvaluateItemScore), not a
    // ported, battle-tested system like AC's, so it should be turned on deliberately per-realm
    // after a live check, not assumed safe everywhere by default.
    static bool AutoGearEnabled;
    static bool AutoGearDebug;
    // Caps what AutoGear will ever equip, independent of score - without this, a selfbot
    // scanning its own bags (unlike the loot-triggered Field/Group path, which only ever sees
    // whatever the current content actually drops) could pick up something from trade/mail/AH
    // far above the realm's current expansion tier and "upgrade" into it. Default matches
    // Cataclysm's heroic-raid ceiling (~397, Dragonwrath/heroic 4.3 BiS) - the realm's current
    // Expansion config tier as of this writing.
    static uint32 AutoGearMaxItemLevel;
    // Second, independent cap, mirroring AC's AutoGearQualityLimit (same default, 3 = rare) -
    // AC treats quality and item level as two separate ceilings, not one combined number, so
    // this does too (e.g. a 397 rare and a 200 epic can both be "within limits" depending on
    // which cap is the binding one for that particular item).
    static uint32 AutoGearMaxQuality;
    // Phase 9 (guild tasks): also off by default, same reasoning as AutoGear above - a new,
    // unvalidated system (see GuildTaskMgr).
    static bool GuildTaskEnabled;
    static uint32 GuildTaskChancePercent;
    static bool GuildTaskDebug;
    // Phase 9 (professions - gathering/crafting): same reasoning again, off by default. Grants
    // Skinning+Leatherworking only (a deliberately small first version - Mining/Herbalism need a
    // GameObject chest-interaction mechanism this fork's GameObject::Use() doesn't appear to
    // implement at all, confirmed by reading it; left out rather than guessed at - see the plan).
    static bool ProfessionEnabled;
    static bool ProfessionDebug;

public:
    static SpellEntry* BuildNewArenaSpellEntry();
    static void ModifySpecialSpells();
    //static void BuildNewArenaHellSpells(SpellInfoMap& spellMap);
    static void AddArenaBotSpellsByPlayer(Player* player);
    static void RemoveArenaBotSpellsByPlayer(Player* player);
    static void TryCancelDuel(Player* player);
    static bool SpellHasReady(Player* player, uint32 spellID);
    static uint32 GetFirstNumberByString(std::string text);
    static std::string BuildItemLinkText(const ItemTemplate* pItemTemplate);
    static void UpdatePlayerBotRoll(Player* player);
    static Item* FindItemFromAllBag(Player* player, uint32 entry, bool destroy = false);
    static Item* FindItemFromAllBag(Player* player, uint32 entry, uint8& bag, uint8& index);
    static bool DestroyItemFromAllBag(Player* player, Item* pItem);
    static Item* StoreNewItemByEntry(Player* player, uint32 entry, int32 count = 1);
    static uint32 FindMaxRankSpellByExist(Player* player, uint32 spellID);
    static uint32 FindPetMaxRankSpellByExist(Player* player, uint32 spellID);
    // Phase 9 (gear scoring): a deliberately simple weighted-stat sum for comparing two items
    // in the same equip slot for a given bot - NOT a port of AC's scoring (Legion's secondary
    // stat budget, Crit/Haste/Mastery/Versatility with no hit/expertise, has no WotLK analog to
    // copy), just a fresh approximation. Weights primary stat for the bot's class highest,
    // stamina next, the 4 Legion secondaries roughly equally, ignores dead WotLK/WoD-era stats
    // (hit/expertise/resilience ratings, the old CR_* bonus stats). Good enough to catch a clear
    // upgrade/downgrade, not a replacement for a theorycrafted stat priority per spec. Takes the
    // live Item (not just its template) so armor/weapon-damage scale off Item::GetItemLevel() -
    // the real, bonus-ID-adjusted level - rather than the template's flat base level; stat values
    // themselves still come from the template (bonus-scaled stats are a separate, bigger task).
    static float EvaluateItemScore(Player* bot, Item const* item, bool isTank = false);
    // Auto-equips `item` in place of whatever the bot currently has in that slot if (and only
    // if) EvaluateItemScore says it's a strict upgrade. Reuses the exact simulated-packet
    // mechanism ProcessUpequip already uses for master-commanded equips
    // (WorldSession::HandleAutoEquipItemOpcode) rather than reimplementing the slot/swap logic.
    // No-op (returns false) while AutoGearEnabled is off, mid-combat, or for anything that isn't
    // equippable gear (consumables/trade goods/quest items flowing through the same loot hook).
    // maxQuality/maxItemLevel of 0 mean "use the realm-wide AutoGearMaxQuality/
    // AutoGearMaxItemLevel default" - existing Field/Group call sites that don't pass these at
    // all keep working unchanged. SelfBotAI passes its own per-player override (".selfbot
    // autogear green" / ".selfbot autogear 200") when the player has set one, same two-tier
    // "server ceiling, optional tighter personal choice" relationship AC's AutoGearScoreLimit
    // has with its own "autogear <x>" command argument (x is clamped to the server ceiling,
    // never allowed to exceed it).
    static bool TryAutoEquipUpgrade(Player* bot, Item* item, bool isTank = false, uint32 maxQuality = 0, uint32 maxItemLevel = 0);
    // Scans all of the bot's bags (main pack + equipped bags, same traversal
    // FindItemFromAllBag uses) and tries TryAutoEquipUpgrade on the first equippable item that
    // turns out to be a strict upgrade, stopping there - one equip attempt per call, same
    // "don't do everything in one tick" shape as the rest of this fork's bot maintenance
    // checks. For SelfBotAI (a real player's own character, no loot hook to piggyback on)
    // rather than the loot-triggered Field/Group path.
    static bool TryAutoGearFromBags(Player* bot, bool isTank = false, uint32 maxQuality = 0, uint32 maxItemLevel = 0);
    // Mirrors AC's "autogear reset" (strip gear, then re-gear from whatever's left in bags under
    // the current limits). Moves equipped items into a free bag slot (Player::SwapItem - the
    // same safe, undoable move a manual unequip does), never destroys anything - unlike
    // PlayerBotSetting::UnequipFromAll (which DestroyItem()s outright), that's only ever correct
    // for disposable, regenerated-every-level bot gear, never for a real player's own items via
    // .selfbot. Stops and leaves the rest equipped if bag space runs out rather than failing
    // loudly partway - a selfbot command should never need a GM to clean up after it.
    static bool TryUnequipAllToBags(Player* bot);
    // Maps a color/quality word ("green", "epic", ...) to its ITEM_QUALITY_* value. Returns
    // false (leaves quality untouched) for anything unrecognized, including an empty string.
    // Shared between .selfbot's and a companion bot's "autogear <color>" command parsing.
    static bool ParseGearQualityWord(std::string const& word, uint32& quality);
    // Assigns a real, weighted-random Legion specialization to a freshly-created bot via
    // Player::ActivateTalentGroup (the same function dual-spec switching uses) - mirrors AC's
    // AiPlayerbot.RandomClassSpecProb.<class>.<specno> config (new config key per spec, see
    // bot_spec_weight_<specId> in worldserver.conf.dist). Found and fixed a real, previously
    // invisible gap this session: every bot of a class was getting the exact same class-default
    // spec (confirmed live - every Warrior Arms, every Paladin Retribution, every Druid Balance,
    // zero tanks/healers anywhere in the population) because nothing ever called this before -
    // bots only ever got Player::ResetTalentSpecialization()'s single fixed default, via the
    // ordinary login fallback every other player also goes through. Call once, at creation only
    // (CreateQueuedPlayerBotForSession) - calling this repeatedly would thrash a bot's spec every
    // level-up instead of letting it persist like a real player's choice does.
    static void AssignRandomSpec(Player* bot);
    // Phase 9 (professions): grants Skinning+Leatherworking once (SetSkill's own engine logic -
    // Player::LearnSkillRewardedSpells, called internally - auto-learns every skill-appropriate
    // recipe already in SkillLineAbility data; no recipe spell ids are guessed at here at all).
    // No-op if the bot already has Skinning (covers "already granted" and "a selfbot/real player
    // who picked their own professions" alike, even though this is only ever called for bots).
    static void GrantStarterProfessions(Player* bot);
    // Finds a nearby creature corpse that's become skinnable (UNIT_FLAG_SKINNABLE, set by the
    // engine itself once normal loot is fully taken - see Creature::AllLootRemovedFromCorpse)
    // and, if in range, casts the universal Skinning spell (8613, unchanged since Classic) on
    // it. Returns the target so the caller can walk to it first if it's not in range yet, same
    // two-phase shape as BotAIFindNearLoot::DoFindLoot's own corpse-walk-then-loot pattern -
    // called from inside that exact function as a fallback when there's nothing left to loot
    // normally.
    static Creature* TryAutoSkin(Player* bot, float range);
    // Mining/Herbalism, added once the user confirmed gathering works live for real players.
    // GameObject::Use()'s switch genuinely has no GAMEOBJECT_TYPE_GATHERING_NODE case (read line
    // by line, twice) and HandleLootOpcode rejects GameObject guids outright, so whatever the
    // real client path is wasn't found in the source - almost certainly SmartAI data
    // (smart_scripts rows per node entry), invisible to a code search. Sidesteps that entirely:
    // Player::SendLoot(guid, LOOT_NONE) (Player.cpp) is the actual generic primitive that fills
    // loot from GetGOInfo()->GetLootId() and opens the loot window, regardless of GO type or who
    // calls it - confirmed by reading it, it's the same call fishing already uses. Finds the
    // nearest GAMEOBJECT_TYPE_GATHERING_NODE in GO_READY state via the engine's own
    // WorldObject::FindNearestGameObjectOfType and calls SendLoot directly once in range, same
    // two-phase (walk-then-act) shape as TryAutoSkin. Does not check the node's required skill
    // level (Lock_ reference, field "open") before attempting - a deliberate v1 simplification,
    // not a guess: starter skill already follows bot level (GrantStarterProfessions), so this
    // mostly self-corrects in practice.
    static GameObject* TryAutoGather(Player* bot, float range);
    // Tries every known spell with a SPELL_EFFECT_CREATE_ITEM effect (the universal mechanical
    // shape of every crafting recipe in WoW, not a guessed list) whose reagents the bot actually
    // has, and casts the first one that's affordable. A correct, complete MECHANISM as of today
    // - but a bot has nothing to craft until it actually knows a recipe, and nothing currently
    // grants recipes beyond whatever GrantStarterProfessions's SetSkill call auto-learned at the
    // starting skill level (see its own comment) - a trainer-visit/skill-up feature to grant
    // more over time is a natural next step, not built yet.
    static bool TryAutoCraft(Player* bot);
    static void PlayerBotTogglePVP(Player* player, bool pvp);
    static void TryTeleportHome(BotFieldAI* pAI);
    static Position GetPositionFromGroup(Player* pCenterPlayer, ObjectGuid self, Group* pGroup);
    static void ProcessGroupTankPullTargets(Player* player);
    static void ProcessGroupRingMovement(Player* pCenterPlayer, BOTAI_WORKTYPE aiType);
    static void ProcessGroupCombatMovement(Player* pCenterPlayer, BOTAI_WORKTYPE aiType);
    static Position FindRadiusByNearDistance(Unit* pTargetUnit, float range, Unit* pRefUnit);
    static Position FindRadiusByFarDistance(Unit* pTargetUnit, float range, Unit* pRefUnit);
    static bool FindFirstCollisionPosition(Unit* pTargetUnit, float range, Unit* pRefUnit, Position& outPos);
    static void TryTeleportPlayerPet(Player* player, bool force = false);
};

class TC_GAME_API BotAIGuild
{
public:
    BotAIGuild(Player* self) : me(self)
    {
    }
    ~BotAIGuild() {}

    void UpdateGuildProcess();

private:
    Player* me;
};

class TC_GAME_API BotAITeleport
{
public:
    BotAITeleport(Player* self) : me(self), m_Teleporting(false), m_MapId(self->GetMapId()), m_TeleportStep(0)
    {
    }
    ~BotAITeleport() {}

    void SetTeleport(Position& telePos);
    void SetTeleport(uint32 mapID, Position& telePos);
    void SetTeleport(Player* pTarget, float offset = NEEDFLEE_CHECKRANGE);
    void ClearTeleport();
    void Update(uint32 diff, BotBGAIMovement* pMovement);
    bool CanMovement() { return !m_Teleporting; }
    void UpdateMapID() { if (me) m_MapId = me->GetMapId(); }

private:
    Player* me;
    bool m_Teleporting;
    Position m_TeleportPositon;
    uint32 m_MapId;
    uint32 m_TeleportStep;
};

class TC_GAME_API BotAIStoped
{
public:
    BotAIStoped(Player* self) : me(self), m_updateTick(0), m_SyncTick(0)
    {
        if (me)
        {
            m_lastPosition = me->GetPosition();
        }
    }
    ~BotAIStoped() {}

    void UpdatePosition(uint32 diff);

private:
    bool HasDifference(Position& pos1, Position& pos2);
    void SyncPosition(Position pos, uint32 opcode);

private:
    Player* me;
    int32 m_updateTick;
    Position m_lastPosition;
    uint32 m_SyncTick;
};

class TC_GAME_API BotAIHorrorState
{
public:
    BotAIHorrorState(Player* self) : me(self), m_CurHorrorPos(self->GetPosition()) {}
    ~BotAIHorrorState() {}

    void UpdateHorror(uint32 diff, BotBGAIMovement* movement);

    Position GetNewHorrorPos();
    static Position GetNewHorrorPosByRange(Player* player, float distance);
    Position FindNewHorrorPos(BotBGAIMovement* movement);

private:
    Player* me;
    Position m_CurHorrorPos;
};

struct FoodInfo
{
    uint32 level;
    uint32 foodEntry;
    uint32 foodBuff;
    uint32 waterEntry;
    uint32 waterBuff;

    FoodInfo(uint32 lv, uint32 food, uint32 fbuf, uint32 water, uint32 wbuf)
    {
        level = lv;
        foodEntry = food;
        foodBuff = fbuf;
        waterEntry = water;
        waterBuff = wbuf;
    }
};
typedef std::list<FoodInfo> FOOD_LIST;

class TC_GAME_API BotAIUseFood
{
public:
    BotAIUseFood(Player* self);
    ~BotAIUseFood() {}

    bool UpdateBotFood(uint32 diff, uint32 downMountID);
    bool HasFoodState() { return (m_LastFoodAura > 0 || m_LastWaterAura > 0); }

private:
    FoodInfo* GetFoodInfoByLevel(uint32 level);
    void ClearFoodState();

private:
    Player* me;
    bool m_HasMana;
    FOOD_LIST m_FoodInfos;
    uint32 m_LastFoodAura;
    uint32 m_LastWaterAura;
};

struct PotionInfo
{
    uint32 level;
    uint32 potionEntry;

    PotionInfo(uint32 lv, uint32 entry) : level(lv), potionEntry(entry)
    {
    }
};

class TC_GAME_API BotAIUsePotion
{
    typedef std::list<PotionInfo> POTION_LIST;
public:
    BotAIUsePotion(Player* self);
    ~BotAIUsePotion() {}

    bool TryUsePotion();

private:
    bool TryUseLifeVial();
    bool TryUseManaVial();
    Item* FindLifeVial();
    Item* FindManaVial();

private:
    Player* me;
    bool m_NeedMana;
    POTION_LIST m_LifeVials;
    POTION_LIST m_ManaVials;
};

class TC_GAME_API BotAIFastAid
{
    typedef std::list<PotionInfo> AID_LIST;
public:
    BotAIFastAid(Player* self);
    ~BotAIFastAid() {}

    void CheckPlayerFastAid();
    bool TryDoingFastAidForMe();

private:
    uint32 GetFastAidSpell();
    bool CanFastAidByTarget(Player* target);

private:
    Player* me;
    uint32 m_NoAidBuff;
    AID_LIST m_FastAids;
};

class TC_GAME_API BotAIFindNearLoot
{
public:
    BotAIFindNearLoot(Player* self) : me(self), m_LootingTick(0), m_HasLoot(false) {}
    ~BotAIFindNearLoot() {}

    bool DoFindLoot(uint32 diff, BotBGAIMovement* movement, uint32 downMountID);
    bool HasLoot() { return m_HasLoot; }

private:
    Creature* FindLootCreature(float range);

private:
    Player* me;
    int32 m_LootingTick;
    bool m_HasLoot;
};

class TC_GAME_API BotAILootedItems
{
public:
    BotAILootedItems(Player* self) : me(self) {}
    ~BotAILootedItems() {}

    void LookupLootedItems(uint32 diff);
    void AddLootedItem(uint32 entry) { if (entry > 0) items.push_back(entry); }
    bool HasItems() { return !(items.empty()); }

private:
    Player* me;
    std::list<uint32> items;
};

class TC_GAME_API BotAITrade
{
public:
    BotAITrade(Player* self) : me(self) {}
    ~BotAITrade() {}

    bool ProcessTrade();

private:
    Player* me;
};

class TC_GAME_API BotAIGiveXP
{
public:
    BotAIGiveXP(Player* self) : me(self), m_AddXP(0) {}
    ~BotAIGiveXP() {}

    void ProcessGiveXP(uint32 masterLV);
    void DelayAddXP(uint32 xp) { if (xp > 0) m_AddXP += xp; }

private:
    Player* me;
    uint32 m_AddXP;
};

class TC_GAME_API BotAIRevive
{
    static const uint32 c_MaxReviveWaitTick = 8000;

public:
    BotAIRevive(Player* self) : me(self), m_ReviveTick(0) {}
    ~BotAIRevive() {}

    void UpdateRevive(uint32 diff);

private:
    void ReviveMe();

private:
    uint32 m_ReviveTick;
    Player* me;
};

class TC_GAME_API BotAIFieldRevive
{
    static const uint32 c_MaxReviveWaitTick = 20000;

public:
    BotAIFieldRevive(Player* self) : me(self), m_ReviveTick(0), m_TickOvered(false) {}
    ~BotAIFieldRevive() {}

    void UpdateRevive(uint32 diff, BotAITeleport& teleport);

private:
    void TeleportToAround(BotAITeleport& teleport);
    void ReviveMe();

private:
    uint32 m_ReviveTick;
    bool m_TickOvered;
    Player* me;
};

class TC_GAME_API BotAIRevivePlayer
{
public:
    BotAIRevivePlayer(Player* self) : me(self) {}
    ~BotAIRevivePlayer() {}

    ObjectGuid SearchNeedRevive(uint32 diff);

private:
    bool CanRevivePlayer();

private:
    Player* me;
};

class TC_GAME_API BotAIFlee
{
    struct PVEFleePosition
    {
        Position fleePosition;
        uint32 enemyCount;
        float byMeDist;
        float byMasterDist;
        PVEFleePosition() : enemyCount(0), byMeDist(0), byMasterDist(0)
        {

        }
        bool operator < (const PVEFleePosition& fleePos)
        {
            return byMeDist > fleePos.byMeDist;
        }
    };

public:
    BotAIFlee(Player* self) : me(self), m_FleeTarget(NULL), m_FleeTick(0), m_cruxTime(0) {}
    ~BotAIFlee() {}

    void Clear() { if (m_FleeTarget) { delete m_FleeTarget; m_FleeTarget = NULL; } m_FleeTick = 0; m_cruxTime = 0; }
    bool Fleeing() { return m_FleeTarget != NULL; }
    void UpdateFleeMovementByPVE(Unit* pMaster, Unit* pRefUnit, BotBGAIMovement* pMovement);
    void UpdateFleeMovementByPVP(Unit* pRefUnit, BotBGAIMovement* pMovement);
    void UpdateFleeMovementByPosition(Unit* pRefUnit, Position centerPos, float maxPosDist, BotBGAIMovement* pMovement);
    float CalcMaxFleeDistance(Unit* pRefUnit);
    void AddCruxFlee(uint32 durTime, Unit* pRefUnit, BotBGAIMovement* pMovement);

private:
    bool CanFleeToTargetPlayer(Player* player);
    bool SearchPVEFleePosition(Unit* pMaster, Unit* pRefUnit, Position& fleePos);
    void SearchCreatureListFromRange(Position centerPos, std::list<Creature*>& nearCreatures, float range);
    Position CalculateFlee(float dist, float angle, Unit* pRefUnit, float& outDistance);

private:
    Player* me;
    Position* m_FleeTarget;
    uint32 m_FleeTick;
    uint32 m_cruxTime;
};

class TC_GAME_API BotAIIDLEMovement
{
public:
    BotAIIDLEMovement(Player* self) : me(self), m_IDLETarget(NULL), m_IDLETick(0) {}
    ~BotAIIDLEMovement() {}

    void Clear() { if (m_IDLETarget) { delete m_IDLETarget; m_IDLETarget = NULL; } m_IDLETick = 0; }
    bool Moveing() { return m_IDLETarget != NULL; }
    void UpdateIDLEMovement(BotBGAIMovement* pMovement);

private:
    Position CalculateIDLE(float dist, float angle, float& outDistance);

    Player* me;
    Position* m_IDLETarget;
    uint32 m_IDLETick;
};

class TC_GAME_API BotAICruxMovement
{
public:
    BotAICruxMovement(Player* self) : me(self), m_MovementTarget(NULL), m_LastFleeDistance(0) {}
    ~BotAICruxMovement() {}

    void ClearMovement() { if (m_MovementTarget) { delete m_MovementTarget; m_MovementTarget = NULL; } m_LastFleeDistance = 0; }
    bool HasCruxMovement() { return m_MovementTarget != NULL; }
    void SetMovement(Position& pos);
    void RandomMovement(float range = NEEDFLEE_CHECKRANGE);
    void UpdateCruxMovement(BotBGAIMovement* pMovement);

    Player* me;
    Position* m_MovementTarget;
    float m_LastFleeDistance;
};

class TC_GAME_API BotAITankTarget
{
public:
    BotAITankTarget(Player* self) : me(self), m_MovementTarget(NULL), m_MovementTick(0) {}
    ~BotAITankTarget() {}

    void ClearTarget();
    void SetMovement(Position& pos);
    void AddTarget(Creature* pCreature);
    bool IsSelfTarget(ObjectGuid& target);
    bool AllTargetPullMe();
    bool ExistPullTarget();
    Creature* GetNeedPullTarget();
    bool UpdateTankTarget(BotBGAIMovement* pMovement);

    Player* me;
    Position* m_MovementTarget;
    uint32 m_MovementTick;
    std::vector<ObjectGuid> m_Targets;
};

class TC_GAME_API BotAIFly
{
public:
    BotAIFly(Player* self) : me(self), m_FlyMountID(0), m_LastFlyPos(self->GetPosition()) {}
    ~BotAIFly() {}

    bool HasFlying();
    void CancelFly();
    void RandomFlyMount();
    void FlyToTarget(Player* player, bool offset);
    void UpdateFly(Player* masterPlayer, uint32 groundMountID, BotBGAIMovement* pMovement);

    Player* me;
    uint32 m_FlyMountID;
    Position m_LastFlyPos;
};

class TC_GAME_API BotAIWishStore
{
    typedef std::map<uint32, std::set<ObjectGuid> > WISH_STORES;

public:
    BotAIWishStore(Player* self) : me(self), m_LastWishTick(0) {}
    ~BotAIWishStore() {}

    void ClearWishs() { m_WishStores.clear(); m_LastWishTick = 0; }
    void ClearStores();
    void RegisterWish(uint32 entry);
    bool CanWishStore(uint32 entry, Unit* pTarget);
    bool TryWishStore(uint32 entry, Unit* pTarget);
    void UpdateWishStore();

    Player* me;
    WISH_STORES m_WishStores;
    uint32 m_LastWishTick;
};

class TC_GAME_API BotAICheckSetting
{
public:
    BotAICheckSetting(Player* self) : me(self), m_LastCheckTick(getMSTime()) {}
    ~BotAICheckSetting() {}

    void UpdateCheckSetting();

private:
    bool NeedResetSetting();
    bool CheckEquip();

    Player* me;
    uint32 m_LastCheckTick;
};

class TC_GAME_API BotAIFliterCreatures
{
public:
    BotAIFliterCreatures(Player* self) : me(self), m_FliterTime(5000) {}
    ~BotAIFliterCreatures() {}

    bool IsFliterCreature(Creature* pCreature);
    void UpdateFliterCreature(Creature* pCreature);
    void RemoveFliterCreature(Creature* pCreature);

    Player* me;
    uint32 m_FliterTime;
    std::map<Creature*, uint32> m_Fliters;
};

class TC_GAME_API BotAIWaitSpecialAura
{
public:
    BotAIWaitSpecialAura(Player* self) : me(self) {}
    ~BotAIWaitSpecialAura() {}

    void AddSpecialAura(uint32 id);
    bool HasNeedWaitAura();

    Player* me;
    std::set<uint32> m_NeedWaitAuras;
};

class TC_GAME_API BotAINeedFleeAura
{
public:
    BotAINeedFleeAura(Player* self) : me(self)
    {
        m_NeedFleeAuras.push_back(46924);
    }
    ~BotAINeedFleeAura() {}

    void AddFleeAura(uint32 aura);
    bool TargetHasFleeAura() { return TargetHasFleeAura(me->GetSelectedPlayer()); };
    bool TargetHasFleeAura(ObjectGuid targetGUID) { return TargetHasFleeAura(ObjectAccessor::FindPlayer(targetGUID)); };
    bool TargetHasFleeAura(Unit* pTarget);

    Player* me;
    std::list<uint32> m_NeedFleeAuras;
};

class TC_GAME_API BotAIRecordCastSpell
{
    struct CastedSpell
    {
        CastedSpell() {}
        CastedSpell(ObjectGuid guid)
        {
            castTarget = guid;
        }
        ObjectGuid castTarget;
        std::map<uint32, uint32> castRecords;
    };
    typedef std::map<ObjectGuid, CastedSpell> AIRECORDS;

public:
    BotAIRecordCastSpell(Player* self) : me(self) {}
    ~BotAIRecordCastSpell() {}

    void ClearRecordSpell() { m_Records.clear(); }
    void RecordCastSpellTick(Unit* pTarget, uint32 spellID);
    bool MatchCastRecord(Unit* pTarget, uint32 spellID, uint32 tickGap);

private:
    Player* me;
    AIRECORDS m_Records;
};

class TC_GAME_API BotAICheckDuel
{
public:
    BotAICheckDuel(Player* self) : me(self) {}
    ~BotAICheckDuel() {}

    bool CheckDuel();

private:
    Player* me;
};

class TC_GAME_API BotAIGroupLeader
{
public:
    BotAIGroupLeader(Player* self) : me(self) {}
    ~BotAIGroupLeader() {}

    void ProcessGroupLeader();

private:
    Player* me;
};

class TC_GAME_API BotAIMovetoUseGO
{
public:
    BotAIMovetoUseGO(Player* self) : me(self), m_UseGO(ObjectGuid::Empty), m_RiteSpellID(0) {}
    ~BotAIMovetoUseGO() {}

    bool CanCastSummonRite();
    bool CastingSummonRite() { return m_RiteSpellID != 0; }
    void ClearUseGO() { m_UseGO = ObjectGuid::Empty; m_RiteSpellID = 0; }
    void StartSummonRite(uint32 spellID);
    bool SetNeedMovetoUseGO(ObjectGuid& guid);
    bool ProcessMovetoUseGO(BotBGAIMovement* pMovement);

private:
    Player* me;
    ObjectGuid m_UseGO;
    uint32 m_RiteSpellID;
};

class TC_GAME_API BotAIMoveToHaltPosition
{
public:
    BotAIMoveToHaltPosition(Player* self) : me(self), m_MovetoPos(0, 0, 0, 0), m_MovetoTick(0) {}
    ~BotAIMoveToHaltPosition() {}

    void ClearMoveto() { m_MovetoPos = Position(); m_MovetoTick = 0; m_CurrentTick = 0; }
    bool HasMoveto() { return (m_MovetoPos.GetPositionX() != 0 && m_MovetoPos.GetPositionY() != 0 && m_MovetoPos.GetPositionZ() != 0); }
    void SetMovetoPos(Position pos, uint32 dur = 1000) { m_MovetoPos = pos; m_MovetoTick = dur; m_CurrentTick = 0; }
    bool ProcessMovetoPosition(BotBGAIMovement* pMovement);

private:
    Player* me;
    Position m_MovetoPos;
    uint32 m_MovetoTick;
    uint32 m_CurrentTick;
};

#endif // !_BOT_AI_TOOL_H
