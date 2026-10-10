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

#include "AltBotMgr.h"
#include "Player.h"
#include "ObjectMgr.h"
#include "ObjectAccessor.h"
#include "PlayerBotSession.h"
#include "PlayerBotMgr.h"
#include "Group.h"
#include "GroupMgr.h"
#include "Config.h"
#include "World.h"
#include "AccountMgr.h"
#include "CharacterPackets.h"
#include "Opcodes.h"
#include "WorldPacket.h"
#include "Language.h"
#include <iterator>

namespace
{
    uint32 const ALTBOT_LOGIN_TIMEOUT_MS = 10000;
}

AltBotMgr* AltBotMgr::instance()
{
    static AltBotMgr instance;
    return &instance;
}

uint32 AltBotMgr::CountForMaster(uint32 accountId) const
{
    uint32 count = 0;
    for (auto const& [guid, entry] : m_ActiveAltBots)
        if (entry.masterAccountId == accountId)
            ++count;
    return count;
}

bool AltBotMgr::IsActiveAltBotGuid(ObjectGuid const& guid) const
{
    return m_ActiveAltBots.find(guid) != m_ActiveAltBots.end();
}

bool AltBotMgr::AddAltBot(Player* master, std::string const& charName, std::string& outError)
{
    if (!sConfigMgr->GetBoolDefault("altbot_enable", false))
    {
        outError = "Альтбот отключён на этом сервере.";
        return false;
    }
    if (!master || master->IsPlayerBot())
    {
        outError = "Нет подходящего персонажа.";
        return false;
    }

    ObjectGuid altGuid = ObjectMgr::GetPlayerGUIDByName(charName);
    if (!altGuid)
    {
        outError = "Такого персонажа нет.";
        return false;
    }
    if (altGuid == master->GetGUID())
    {
        outError = "Это твой же текущий персонаж.";
        return false;
    }
    if (IsActiveAltBotGuid(altGuid))
    {
        outError = "Этот персонаж уже активен как альтбот.";
        return false;
    }
    // Покрывает и "реально сейчас онлайн", и "уже кем-то управляется" - в обоих случаях
    // этого guid'а нельзя забирать.
    if (ObjectAccessor::FindConnectedPlayer(altGuid))
    {
        outError = "Этот персонаж уже онлайн.";
        return false;
    }

    uint32 masterAccountId = master->GetSession()->GetAccountId();
    uint32 altAccountId = ObjectMgr::GetPlayerAccountIdByGUID(altGuid);
    if (!altAccountId || altAccountId != masterAccountId)
    {
        // Никогда не разрешать управлять чужим персонажем - единственная жёсткая проверка
        // безопасности всей фичи, зеркалит "sameAccount" из mod-playerbots
        // (PlayerbotHolder::AddPlayerBot, PlayerbotMgr.cpp).
        outError = "Этот персонаж не на твоём аккаунте.";
        return false;
    }

    uint32 maxPerMaster = sConfigMgr->GetIntDefault("altbot_max_per_master", 1);
    if (CountForMaster(masterAccountId) >= maxPerMaster)
    {
        outError = "У тебя уже максимум активных альтботов.";
        return false;
    }

    // Намеренно никогда не зовёт sWorld->AddSession() - см. комментарий класса в AltBotMgr.h.
    // Аккаунт мастера уже занимает единственный слот сессии, который World::AddSession_
    // закрепляет за accountId (World.cpp); регистрация второй сессии того же аккаунта убила бы
    // живое подключение мастера. Реальный аналог в mod-playerbots
    // (PlayerbotMgr.cpp::HandlePlayerBotLoginCallback) упирается в то же самое и решает так же:
    // строит WorldSession напрямую, никогда её не регистрирует, тикает сам из своего движка.
    std::string accountName = master->GetSession()->GetAccountName();
    uint32 battlenetAccountId = master->GetSession()->GetBattlenetAccountId();
    PlayerBotSession* botSession = new PlayerBotSession(masterAccountId, accountName, battlenetAccountId,
        AccountTypes::SEC_GAMEMASTER, 2, 0, master->GetSession()->GetSessionDbcLocale(), 0, false, std::string());
    botSession->LoadPermissions();

    // Тот же приём симуляции логина что уже использует PlayerBotMgr::AllPlayerBotRandomLogin
    // для переключения существующей бот-сессии на конкретного персонажа по guid'у.
    WorldPacket rawPacket(CMSG_PLAYER_LOGIN);
    WorldPackets::Character::PlayerLogin cmd(std::move(rawPacket));
    cmd.Guid = altGuid;
    cmd.FarClip = 0.0f;
    botSession->HandlePlayerLoginOpcode(cmd);
    botSession->HandleContinuePlayerLogin();

    // Загрузка персонажа асинхронная (DB-запрос, который разрешается на следующих тиках) -
    // подтверждено вживую: session->GetPlayer() сразу после этих двух вызовов всегда был
    // nullptr, даже когда загрузка в итоге проходила успешно. Сессия, зарегистрированная
    // обычным sWorld->AddSession(), тикается движком сама по себе каждый тик - именно поэтому
    // AllPlayerBotRandomLogin (откуда скопирован этот приём) не нужно было ничего ждать. Нашей
    // сессии тикать некому кроме UpdateAltBotsFor ниже - группировка и переключение на
    // BotGroupAI откладываются туда же, до первого тика где GetPlayer() станет не-null.
    AltBotEntry entry;
    entry.session = botSession;
    entry.masterAccountId = masterAccountId;
    entry.masterGuid = master->GetGUID();
    entry.grouped = false;
    entry.pendingSinceMs = getMSTime();
    m_ActiveAltBots[altGuid] = entry;
    return true;
}

bool AltBotMgr::RemoveAltBot(Player* master, std::string const& charName, std::string& outError)
{
    if (!master)
    {
        outError = "Нет подходящего персонажа.";
        return false;
    }
    ObjectGuid altGuid = ObjectMgr::GetPlayerGUIDByName(charName);
    auto it = altGuid ? m_ActiveAltBots.find(altGuid) : m_ActiveAltBots.end();
    if (it == m_ActiveAltBots.end() || it->second.masterAccountId != master->GetSession()->GetAccountId())
    {
        outError = "Это не твой активный альтбот.";
        return false;
    }
    RemoveAltBotByGuid(altGuid);
    return true;
}

void AltBotMgr::RemoveAltBotByGuid(ObjectGuid const& guid)
{
    auto it = m_ActiveAltBots.find(guid);
    if (it == m_ActiveAltBots.end())
        return;

    PlayerBotSession* session = it->second.session;
    m_ActiveAltBots.erase(it);

    if (session->GetPlayer())
        session->LogoutPlayer(true);
    delete session;
}

void AltBotMgr::RemoveAllForMaster(Player* master)
{
    if (!master)
        return;
    uint32 accountId = master->GetSession()->GetAccountId();
    for (auto it = m_ActiveAltBots.begin(); it != m_ActiveAltBots.end();)
    {
        if (it->second.masterAccountId == accountId)
        {
            ObjectGuid guid = it->first;
            ++it;
            RemoveAltBotByGuid(guid);
        }
        else
            ++it;
    }
}

void AltBotMgr::FinishPendingLogin(ObjectGuid const& altGuid, AltBotEntry& entry)
{
    Player* altPlayer = entry.session->GetPlayer();
    Player* master = ObjectAccessor::FindPlayer(entry.masterGuid);

    if (!altPlayer)
    {
        if (getMSTime() - entry.pendingSinceMs < ALTBOT_LOGIN_TIMEOUT_MS)
            return; // ещё грузится, подождём следующий тик

        if (master)
            master->Whisper("Альтбот: не удалось загрузить персонажа.", LANG_UNIVERSAL, master);
        RemoveAltBotByGuid(altGuid);
        return;
    }

    // Группируем с мастером, чтобы PlayerBotMgr::OnPlayerBotLogin подключил BotGroupAI, а не
    // автономный BotFieldAI - тот вызов уже отработал раньше (внутри HandlePlayerLoginOpcode,
    // CharacterHandler.cpp смотрит только IsBotSession(), без учёта имени аккаунта), но выбрал
    // BotGroupAI только если персонаж УЖЕ был в группе в тот самый момент. Свежий альтбот
    // никогда не был - группируем сейчас и переключаем явно.
    if (master)
    {
        Group* group = master->GetGroup();
        if (!group)
        {
            group = new Group();
            group->Create(master);
            sGroupMgr->AddGroup(group);
        }
        if (group->AddMember(altPlayer))
        {
            group->BroadcastGroupUpdate();
            PlayerBotMgr::SwitchPlayerBotAI(altPlayer, PlayerBotAIType::PBAIT_GROUP, true);
            altPlayer->Whisper("Я на связи.", LANG_UNIVERSAL, master);
        }
        else
        {
            master->Whisper("Альтбот: не удалось добавить в группу (группа заполнена?).", LANG_UNIVERSAL, master);
            RemoveAltBotByGuid(altGuid);
            return;
        }
    }

    entry.grouped = true;
}

void AltBotMgr::UpdateAltBotsFor(Player* master, uint32 diff)
{
    if (!master)
        return;
    uint32 accountId = master->GetSession()->GetAccountId();
    for (auto it = m_ActiveAltBots.begin(); it != m_ActiveAltBots.end();)
    {
        // Capture the next iterator before any possible erase below (RemoveAltBotByGuid /
        // FinishPendingLogin can both erase `it`'s own entry) - advancing from a stale `it`
        // after an erase would be undefined behaviour, and re-finding by guid instead of just
        // continuing from the right place would wrongly abort the whole loop early whenever one
        // entry among several got removed this tick.
        auto next = std::next(it);

        if (it->second.masterAccountId != accountId)
        {
            it = next;
            continue;
        }

        ObjectGuid guid = it->first;
        PlayerBotSession* session = it->second.session;
        WorldSessionFilter filter(session);
        bool keepAlive = session->Update(diff, filter);
        if (!keepAlive)
        {
            RemoveAltBotByGuid(guid);
            it = next;
            continue;
        }

        if (!it->second.grouped)
            FinishPendingLogin(guid, it->second);

        it = next;
    }
}
