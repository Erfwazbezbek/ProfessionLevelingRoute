-- Menu.lua

local ADDON, ns = ...
local PLR = ns.Addon

local MenuConfig = {
    selectedCharacter = "None",
    selectedProfession = "None",
    selectedRecipes = "None",
    trackNormal = true,
    trackPvP = true,
    trackRP = true,
    trackRPPVP = true,
    trackHC = true,
}
ns.Characters:_InitAmIRight()
MenuConfig.trackNormal = PLRDB.rulesets.Normal
MenuConfig.trackPvP = PLRDB.rulesets.PvP
MenuConfig.trackRP = PLRDB.rulesets.RP
MenuConfig.trackRPPVP = PLRDB.rulesets.RPPVP
MenuConfig.trackHC = PLRDB.rulesets.HC

local currentName = UnitFullName("player") or "Unknown"
local currentRealm = GetRealmName() or "Unknown"
local currentVersion = C_AddOns.GetAddOnMetadata(ADDON, "Version")
local lastUpdated = C_AddOns.GetAddOnMetadata(ADDON, "X-Date")
local currentCharacterKey = currentName .. "-" .. currentRealm
MenuConfig.selectedCharacter = currentCharacterKey

-- 1. MAIN LANDING CATEGORY: framed, readable credits panel
local frame = CreateFrame("Frame")

local panel = CreateFrame("Frame", nil, frame, "BackdropTemplate")
panel:SetSize(566, 460)
panel:SetPoint("TOPLEFT", frame, "TOPLEFT", 18, -20)
panel:SetBackdrop({
    bgFile = "Interface\\Buttons\\WHITE8X8",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 },
})
panel:SetBackdropColor(0.055, 0.065, 0.085, 0.98)
panel:SetBackdropBorderColor(0.42, 0.34, 0.19, 1)

local heading = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
heading:SetPoint("TOP", panel, "TOP", 0, -18)
heading:SetText("Profession Leveling Route")

local subtitle = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
subtitle:SetPoint("TOP", heading, "BOTTOM", 0, -7)
subtitle:SetText("|cffd9bd7cBuilt by Willow & Rupert Co|r")

local divider = panel:CreateTexture(nil, "ARTWORK")
divider:SetTexture("Interface\\Buttons\\WHITE8X8")
divider:SetColorTexture(0.48, 0.39, 0.23, 0.7)
divider:SetSize(510, 1)
divider:SetPoint("TOP", subtitle, "BOTTOM", 0, -15)

local function CreatePortraitCard(textureName, label, xOffset)
    local card = CreateFrame("Frame", nil, panel, "BackdropTemplate")
    card:SetSize(192, 208)
    card:SetPoint("TOP", divider, "BOTTOM", xOffset, -13)
    card:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 },
    })
    card:SetBackdropColor(0.105, 0.115, 0.14, 1)
    card:SetBackdropBorderColor(0.28, 0.29, 0.33, 0.95)

    local portrait = card:CreateTexture(nil, "ARTWORK")
    portrait:SetSize(174, 174)
    portrait:SetPoint("TOP", card, "TOP", 0, -6)
    portrait:SetTexture("Interface\\AddOns\\ProfessionLevelingRoute\\Media\\" .. textureName)

    local name = card:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    name:SetPoint("BOTTOM", card, "BOTTOM", 0, 11)
    name:SetText(label)
    return card
end

CreatePortraitCard("Willow", "Willow", -105)
CreatePortraitCard("Rupert", "Rupert", 105)

local infoDivider = panel:CreateTexture(nil, "ARTWORK")
infoDivider:SetColorTexture(0.48, 0.39, 0.23, 0.7)
infoDivider:SetSize(510, 1)
infoDivider:SetPoint("TOP", divider, "BOTTOM", 0, -231)

local function AddMetadata(label, value, y)
    local left = panel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    left:SetPoint("TOPLEFT", panel, "TOPLEFT", 28, y)
    left:SetWidth(142)
    left:SetJustifyH("LEFT")
    left:SetText(label)

    local right = panel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    right:SetPoint("TOPLEFT", panel, "TOPLEFT", 174, y)
    right:SetWidth(355)
    right:SetJustifyH("LEFT")
    right:SetWordWrap(false)
    right:SetText(value or "Unknown")
end

AddMetadata("Version", currentVersion or PLR.currentVersion, -291)
AddMetadata("Last updated", lastUpdated or PLR.lastUpdate, -315)
AddMetadata("Special thanks", "Slackluster & ATT for beta testing", -339)
AddMetadata("Recommended", "ATT, Profession Shopping List, TomTom", -363)

local footer = panel:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
footer:SetPoint("BOTTOM", panel, "BOTTOM", 0, 17)
footer:SetText("Use the categories on the left to configure your addon.")

local mainCategory = Settings.RegisterCanvasLayoutCategory(frame, "Profession Leveling Route")
Settings.RegisterAddOnCategory(mainCategory)

ns.categoryID = mainCategory:GetID()

frame:SetScript("OnShow", function()
    ns.isMenuOpen = true
end)

frame:SetScript("OnHide", function()
    ns.isMenuOpen = false
end)

local charSubcategory, charLayout = Settings.RegisterVerticalLayoutSubcategory(mainCategory, "Characters")
Settings.RegisterAddOnCategory(charSubcategory)

local charSetting = Settings.RegisterAddOnSetting(
    charSubcategory,
    "PLR_SelectedCharacter",
    "selectedCharacter",
    MenuConfig,
    Settings.VarType.String,
    "Select a character",
    currentCharacterKey
)

local function GetCharacterOptions()
    local container = Settings.CreateControlTextContainer()
    container:Add(currentCharacterKey, currentName .. " (" .. currentRealm .. ")")

    if PLR and PLR.GetCharacterDropdownOptions then
        local charList = PLR:GetCharacterDropdownOptions()
        for _, charData in ipairs(charList) do
            if charData.value ~= currentCharacterKey then
                container:Add(charData.value, charData.label)
            end
        end
    end
    return container:GetData()
end

Settings.CreateDropdown(charSubcategory, charSetting, GetCharacterOptions, "Select Character to View")
local realmSubcategory, realmLayout = Settings.RegisterVerticalLayoutSubcategory(
    mainCategory,
    "Realms"
)
Settings.RegisterAddOnCategory( realmSubcategory )
local normalSetting = Settings.RegisterProxySetting(
    realmSubcategory,
    "PLR_TrackNormal",
    Settings.VarType.Boolean,
    "Normal",
    true,
    function()
        return PLRDB.rulesets.Normal
    end,
    function( value )
        PLRDB.rulesets.Normal = value
    end
)
Settings.CreateCheckbox(
    realmSubcategory,
    normalSetting,
    "Track characters on Normal realms."
)
normalSetting:SetValueChangedCallback( function( setting, value )
    if ns.Roster and ns.Roster.page then
        ns.Roster:RefreshCharacters( ns.Roster.page )
    end
end )
local pvpSetting = Settings.RegisterProxySetting(
    realmSubcategory,
    "PLR_TrackPvP",
    Settings.VarType.Boolean,
    "PvP",
    true,
    function()
        return PLRDB.rulesets.PvP
    end,
    function( value )
        PLRDB.rulesets.PvP = value
    end
)
Settings.CreateCheckbox(
    realmSubcategory,
    pvpSetting,
    "Track characters on PvP realms."
)
pvpSetting:SetValueChangedCallback( function( setting, value )
    if ns.Roster and ns.Roster.page then
        ns.Roster:RefreshCharacters( ns.Roster.page )
    end
end )
local rpSetting = Settings.RegisterProxySetting(
    realmSubcategory,
    "PLR_TrackRP",
    Settings.VarType.Boolean,
    "Roleplaying",
    true,
    function()
        return PLRDB.rulesets.RP
    end,
    function( value )
        PLRDB.rulesets.RP = value
    end
)
Settings.CreateCheckbox(
    realmSubcategory,
    rpSetting,
    "Track characters on Roleplaying realms."
)
rpSetting:SetValueChangedCallback( function( setting, value )
    if ns.Roster and ns.Roster.page then
        ns.Roster:RefreshCharacters( ns.Roster.page )
    end
end )
local rppvpSetting = Settings.RegisterProxySetting(
    realmSubcategory,
    "PLR_TrackRPPVP",
    Settings.VarType.Boolean,
    "RP-PvP",
    true,
    function()
        return PLRDB.rulesets.RPPVP
    end,
    function(value)
        PLRDB.rulesets.RPPVP = value
    end
)
Settings.CreateCheckbox(
    realmSubcategory,
    rppvpSetting,
    "Track characters on RP-PvP realms."
)
rppvpSetting:SetValueChangedCallback(function(setting, value)
    if ns.Roster and ns.Roster.page then
        ns.Roster:RefreshCharacters(ns.Roster.page)
    end
end)
local hcSetting = Settings.RegisterProxySetting(
    realmSubcategory,
    "PLR_TrackHC",
    Settings.VarType.Boolean,
    "Hardcore",
    true,
    function()
        return PLRDB.rulesets.HC
    end,
    function( value )
        PLRDB.rulesets.HC = value
    end
)
Settings.CreateCheckbox(
    realmSubcategory,
    hcSetting,
    "Track characters on Hardcore realms."
)
hcSetting:SetValueChangedCallback( function( setting, value )
    if ns.Roster and ns.Roster.page then
        ns.Roster:RefreshCharacters( ns.Roster.page )
    end
end )
normalSetting:SetValueChangedCallback( function( setting, value )
    PLRDB.rulesets.Normal = value
end )
pvpSetting:SetValueChangedCallback( function( setting, value )
    PLRDB.rulesets.PvP = value
end )
rpSetting:SetValueChangedCallback( function( setting, value )
    PLRDB.rulesets.RP = value
end )
hcSetting:SetValueChangedCallback( function( setting, value )
    PLRDB.rulesets.HC = value
end )

local profSubcategory, profLayout = Settings.RegisterVerticalLayoutSubcategory(mainCategory, "Professions")
Settings.RegisterAddOnCategory(profSubcategory)

local profSetting = Settings.RegisterAddOnSetting(
    profSubcategory,
    "PLR_SelectedProfession",
    "selectedProfession",
    MenuConfig,
    Settings.VarType.String,
    "Select a profession",
    "Alchemy"
)

local function GetProfessionOptions()
    local container = Settings.CreateControlTextContainer()

    for _, profession in ipairs( ns.Professions.list ) do
    local professionInfo =
        ns.Professions:GetInfo(
            profession.skillLineID
        )
    if professionInfo then
        container:Add(
            profession.skillLineID,
            professionInfo.professionName
        )
    end
end

    return container:GetData()
end


Settings.CreateDropdown(profSubcategory, profSetting, GetProfessionOptions, "Select Profession to Route")