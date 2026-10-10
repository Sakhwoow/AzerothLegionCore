-- Legion Bot Helper - minimal panel for .selfbot / .altbot.
-- Two ways buttons talk to the server, matching how AC itself commands bots:
--   RunCommand - sends a "." dot-command (SendChatMessage, "SAY" channel - the server's command
--                parser intercepts "." prefixed text before it's ever broadcast as real chat).
--                Used for account-level actions (altbot add/remove, autogear) that aren't "tell
--                an already-active bot what to do".
--   RunWhisper - whispers your OWN character name. Every other bot type on this server is
--                controlled by whispering it a bare word (no "."); selfbot now understands the
--                same words when you whisper yourself, so these buttons do the same thing you'd
--                get by whispering any other bot. The client's whisper UI won't let you *type*
--                your own name, but SendChatMessage has no such restriction.
local ADDON = "LegionBotHelper"

LegionBotHelperDB = LegionBotHelperDB or {}

local function RunCommand(cmd)
	SendChatMessage(cmd, "SAY")
end

local function RunWhisper(cmd)
	SendChatMessage(cmd, "WHISPER", nil, UnitName("player"))
end

-- ===== Main frame =====

local frame = CreateFrame("Frame", "LegionBotHelperFrame", UIParent)
frame:SetSize(230, 326)
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
	bgFile = "Interface/DialogFrame/UI-DialogBox-Background",
	edgeFile = "Interface/DialogFrame/UI-DialogBox-Border",
	tile = true, tileSize = 32, edgeSize = 32,
	insets = { left = 11, right = 12, top = 12, bottom = 11 },
})
frame:Hide()

local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
title:SetPoint("TOP", frame, "TOP", 0, -16)
title:SetText("Legion Bot Helper")

local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -4, -4)
close:SetScript("OnClick", function() frame:Hide() end)

-- Small helper: a row of same-size buttons sharing one baseline y.
local function MakeButton(parent, label, width, onClick)
	local btn = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
	btn:SetSize(width, 22)
	btn:SetText(label)
	btn:SetScript("OnClick", onClick)
	return btn
end

local function SectionHeader(parent, anchor, text, yOffset)
	local fs = parent:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	fs:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 2, yOffset)
	fs:SetText(text)
	return fs
end

-- ===== Selfbot section =====

local selfHeader = SectionHeader(frame, title, "Selfbot", -16)

-- Toggle stays a dot-command: with selfbot OFF there is no active SelfBotAI yet for the
-- whisper handler to reach (ProcessWhisperCommand only exists once it's already active), so
-- "turn it on in the first place" can't itself be a whispered bot command.
local btnToggle = MakeButton(frame, "Toggle", 90, function() RunCommand(".selfbot") end)
btnToggle:SetPoint("TOPLEFT", selfHeader, "BOTTOMLEFT", 0, -6)

local btnReady = MakeButton(frame, "Ready", 90, function() RunWhisper("ready") end)
btnReady:SetPoint("LEFT", btnToggle, "RIGHT", 10, 0)

local btnStay = MakeButton(frame, "Stay", 90, function() RunWhisper("stay") end)
btnStay:SetPoint("TOPLEFT", btnToggle, "BOTTOMLEFT", 0, -6)

local btnFollow = MakeButton(frame, "Follow", 90, function() RunWhisper("follow") end)
btnFollow:SetPoint("LEFT", btnStay, "RIGHT", 10, 0)

-- "Attack my target" - explicit, like the x5 MultiBot addon's button: attacks whatever you
-- currently have selected, regardless of whether you're already in combat.
local btnAttack = MakeButton(frame, "Attack target", 184, function() RunWhisper("attack") end)
btnAttack:SetPoint("TOPLEFT", btnStay, "BOTTOMLEFT", 0, -6)

local coHeader = SectionHeader(frame, btnAttack, "Combat order", -10)

local btnCoAuto = MakeButton(frame, "Auto", 58, function() RunWhisper("co auto") end)
btnCoAuto:SetPoint("TOPLEFT", coHeader, "BOTTOMLEFT", 0, -6)
local btnCoDps = MakeButton(frame, "DPS", 58, function() RunWhisper("co dps") end)
btnCoDps:SetPoint("LEFT", btnCoAuto, "RIGHT", 4, 0)
local btnCoHeal = MakeButton(frame, "Heal", 58, function() RunWhisper("co heal") end)
btnCoHeal:SetPoint("LEFT", btnCoDps, "RIGHT", 4, 0)

local gearHeader = SectionHeader(frame, btnCoAuto, "AutoGear limit", -10)

local btnGearGreen = MakeButton(frame, "Green", 58, function() RunWhisper("autogear green") end)
btnGearGreen:SetPoint("TOPLEFT", gearHeader, "BOTTOMLEFT", 0, -6)
local btnGearBlue = MakeButton(frame, "Blue", 58, function() RunWhisper("autogear blue") end)
btnGearBlue:SetPoint("LEFT", btnGearGreen, "RIGHT", 4, 0)
local btnGearEpic = MakeButton(frame, "Epic", 58, function() RunWhisper("autogear epic") end)
btnGearEpic:SetPoint("LEFT", btnGearBlue, "RIGHT", 4, 0)

local btnGearReset = MakeButton(frame, "Reset gear", 184, function() RunWhisper("autogear reset") end)
btnGearReset:SetPoint("TOPLEFT", btnGearGreen, "BOTTOMLEFT", 0, -6)

-- ===== Altbot section =====

local altHeader = SectionHeader(frame, btnGearReset, "Altbot (same account)", -14)

local altEdit = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
altEdit:SetSize(184, 20)
altEdit:SetAutoFocus(false)
altEdit:SetPoint("TOPLEFT", altHeader, "BOTTOMLEFT", 6, -10)
altEdit:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)

local btnAltAdd = MakeButton(frame, "Add", 90, function()
	local name = altEdit:GetText()
	if name and name ~= "" then
		RunCommand(".altbot add " .. name)
	end
end)
btnAltAdd:SetPoint("TOPLEFT", altEdit, "BOTTOMLEFT", -6, -6)

local btnAltRemove = MakeButton(frame, "Remove", 90, function()
	local name = altEdit:GetText()
	if name and name ~= "" then
		RunCommand(".altbot remove " .. name)
	end
end)
btnAltRemove:SetPoint("LEFT", btnAltAdd, "RIGHT", 10, 0)

-- ===== Slash command + saved position =====

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
