-- Legion Bot Helper - минимальная панель для .selfbot / .altbot.
-- Два способа общения с сервером, как в AC:
--   RunCommand - шлёт dot-команду (SendChatMessage, канал "SAY" - сервер перехватывает текст
--                с "." раньше, чем он улетит в чат). Для действий уровня аккаунта (altbot
--                add/remove), где нет "уже активного бота, которому шепчешь".
--   RunWhisper - шепчет СВОЕМУ ЖЕ персонажу. Все остальные типы ботов на сервере управляются
--                шёпотом голого слова (без точки); селфбот теперь понимает те же слова при
--                шёпоте самому себе - кнопки делают то же самое, что шёпот любому другому боту.
--                Клиентский UI не даёт вписать своё имя в шёпот вручную, но SendChatMessage
--                такого ограничения не имеет.
local ADDON = "LegionBotHelper"

LegionBotHelperDB = LegionBotHelperDB or {}

local function RunCommand(cmd)
	SendChatMessage(cmd, "SAY")
end

local function RunWhisper(cmd)
	SendChatMessage(cmd, "WHISPER", nil, UnitName("player"))
end

-- ===== Общие цвета/отступы =====

local PAD = 14       -- отступ от края рамки
local ROW_GAP = 8     -- между строками кнопок внутри секции
local SECTION_GAP = 16 -- от последней строки секции до следующего заголовка
local HEADER_GAP = 8   -- от заголовка секции до первой строки кнопок

-- ===== Главное окно =====

local frame = CreateFrame("Frame", "LegionBotHelperFrame", UIParent)
frame:SetPoint("CENTER")
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	local point, _, relPoint, x, y = self:GetPoint()
	LegionBotHelperDB.point = point
	LegionBotHelperDB.relPoint = relPoint
	LegionBotHelperDB.x = x
	LegionBotHelperDB.y = y
end)
frame:SetBackdrop({
	bgFile = "Interface/Tooltips/UI-Tooltip-Background",
	edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
	tile = true, tileSize = 16, edgeSize = 16,
	insets = { left = 4, right = 4, top = 4, bottom = 4 },
})
frame:SetBackdropColor(0.04, 0.04, 0.06, 0.95)
frame:SetBackdropBorderColor(0.55, 0.45, 0.2, 1)
frame:Hide()

local titleBar = CreateFrame("Frame", nil, frame)
titleBar:SetHeight(28)
titleBar:SetPoint("TOPLEFT", frame, "TOPLEFT", 4, -4)
titleBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -4)

local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
title:SetPoint("TOP", frame, "TOP", 0, -10)
title:SetText("Помощник ботов")

local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -2, -2)
close:SetScript("OnClick", function() frame:Hide() end)

-- Небольшая золотистая линия-разделитель под заголовком секции - визуально рвёт панель на
-- блоки, вместо того чтобы кнопки шли сплошным безликим списком.
local function SectionHeader(parent, anchor, text, yOffset)
	local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	fs:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, yOffset)
	fs:SetTextColor(1, 0.82, 0.1)
	fs:SetText(text)

	local line = parent:CreateTexture(nil, "ARTWORK")
	line:SetHeight(1)
	line:SetColorTexture(0.55, 0.45, 0.2, 0.6)
	line:SetPoint("TOPLEFT", fs, "BOTTOMLEFT", 0, -4)
	line:SetPoint("RIGHT", frame, "RIGHT", -PAD, 0)

	return line -- следующий элемент вешаем на линию, не на текст, для ровного отступа
end

local function MakeButton(parent, label, width, onClick)
	local btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	btn:SetSize(width, 24)
	btn:SetText(label)
	btn:SetScript("OnClick", onClick)
	return btn
end

local WIDE = 212  -- ширина кнопки/поля во всю секцию (3 колонки * 66 + 2*7 зазора)
local COL3 = 66   -- ширина кнопки в ряду из 3

-- ===== Селфбот =====

local selfHeader = SectionHeader(frame, titleBar, "Селфбот", -(PAD - 4))

-- "Вкл/Выкл" остаётся dot-командой: пока селфбот выключен, активного SelfBotAI для шёпота
-- ещё нет (ProcessWhisperCommand существует только у уже включённого) - "включить" не может
-- само быть шёпот-командой боту, которого ещё нет.
local btnToggle = MakeButton(frame, "Вкл/Выкл", 102, function() RunCommand(".selfbot") end)
btnToggle:SetPoint("TOPLEFT", selfHeader, "BOTTOMLEFT", 0, -HEADER_GAP)

local btnReady = MakeButton(frame, "Готовность", 102, function() RunWhisper("ready") end)
btnReady:SetPoint("LEFT", btnToggle, "RIGHT", 8, 0)

local btnStay = MakeButton(frame, "Стоять", 102, function() RunWhisper("stay") end)
btnStay:SetPoint("TOPLEFT", btnToggle, "BOTTOMLEFT", 0, -ROW_GAP)

local btnFollow = MakeButton(frame, "Следовать", 102, function() RunWhisper("follow") end)
btnFollow:SetPoint("LEFT", btnStay, "RIGHT", 8, 0)

-- "Атаковать цель" - явная команда, как кнопка "attack my target" в аддоне на x5: атакует то,
-- что у тебя сейчас выделено, независимо от того, в бою ты уже или нет.
local btnAttack = MakeButton(frame, "Атаковать цель", WIDE, function() RunWhisper("attack") end)
btnAttack:SetPoint("TOPLEFT", btnStay, "BOTTOMLEFT", 0, -ROW_GAP)

-- ===== Порядок боя =====

local coHeader = SectionHeader(frame, btnAttack, "Порядок боя", -SECTION_GAP)

local btnCoAuto = MakeButton(frame, "Авто", COL3, function() RunWhisper("co auto") end)
btnCoAuto:SetPoint("TOPLEFT", coHeader, "BOTTOMLEFT", 0, -HEADER_GAP)
local btnCoDps = MakeButton(frame, "ДД", COL3, function() RunWhisper("co dps") end)
btnCoDps:SetPoint("LEFT", btnCoAuto, "RIGHT", 7, 0)
local btnCoHeal = MakeButton(frame, "Лекарь", COL3, function() RunWhisper("co heal") end)
btnCoHeal:SetPoint("LEFT", btnCoDps, "RIGHT", 7, 0)

-- ===== АвтоГир =====

local gearHeader = SectionHeader(frame, btnCoAuto, "Лимит автогира", -SECTION_GAP)

local btnGearGreen = MakeButton(frame, "Зелёное", COL3, function() RunWhisper("autogear green") end)
btnGearGreen:SetPoint("TOPLEFT", gearHeader, "BOTTOMLEFT", 0, -HEADER_GAP)
local btnGearBlue = MakeButton(frame, "Синее", COL3, function() RunWhisper("autogear blue") end)
btnGearBlue:SetPoint("LEFT", btnGearGreen, "RIGHT", 7, 0)
local btnGearEpic = MakeButton(frame, "Эпик", COL3, function() RunWhisper("autogear epic") end)
btnGearEpic:SetPoint("LEFT", btnGearBlue, "RIGHT", 7, 0)

local btnGearReset = MakeButton(frame, "Сбросить шмот", WIDE, function() RunWhisper("autogear reset") end)
btnGearReset:SetPoint("TOPLEFT", btnGearGreen, "BOTTOMLEFT", 0, -ROW_GAP)

-- ===== Альтбот =====

local altHeader = SectionHeader(frame, btnGearReset, "Альтбот (тот же аккаунт)", -SECTION_GAP)

local altLabel = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
altLabel:SetPoint("TOPLEFT", altHeader, "BOTTOMLEFT", 2, -HEADER_GAP)
altLabel:SetText("Имя персонажа:")

local altEdit = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
altEdit:SetSize(WIDE - 12, 20)
altEdit:SetAutoFocus(false)
altEdit:SetPoint("TOPLEFT", altLabel, "BOTTOMLEFT", 6, -6)
altEdit:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)

local btnAltAdd = MakeButton(frame, "Добавить", 102, function()
	local name = altEdit:GetText()
	if name and name ~= "" then
		RunCommand(".altbot add " .. name)
	end
end)
btnAltAdd:SetPoint("TOPLEFT", altEdit, "BOTTOMLEFT", -6, -ROW_GAP)

local btnAltRemove = MakeButton(frame, "Убрать", 102, function()
	local name = altEdit:GetText()
	if name and name ~= "" then
		RunCommand(".altbot remove " .. name)
	end
end)
btnAltRemove:SetPoint("LEFT", btnAltAdd, "RIGHT", 8, 0)

-- ===== Итоговый размер рамки =====

frame:SetWidth(WIDE + PAD * 2 + 4)
frame:SetHeight(468)

-- ===== Слэш-команда + сохранённая позиция =====

SLASH_LEGIONBOTHELPER1 = "/lbh"
SlashCmdList["LEGIONBOTHELPER"] = function()
	if frame:IsShown() then
		frame:Hide()
	else
		frame:Show()
	end
end

local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:SetScript("OnEvent", function(self, event, name)
	if name ~= ADDON then
		return
	end
	if LegionBotHelperDB.point then
		frame:ClearAllPoints()
		frame:SetPoint(LegionBotHelperDB.point, UIParent, LegionBotHelperDB.relPoint, LegionBotHelperDB.x, LegionBotHelperDB.y)
	end
	self:UnregisterEvent("ADDON_LOADED")
end)
