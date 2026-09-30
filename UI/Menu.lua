-- Menu.lua
local ADDON, ns = ...
local PLR = ns.Addon

local MenuConfig = {
    selectedCharacter = "None",
    selectedProfession = "None",
    selectedRecipes = "None"
}

local currentName = UnitFullName("player") or "Unknown"
local currentRealm = GetRealmName() or "Unknown"
local currentVersion = C_AddOns.GetAddOnMetadata(ADDON, "Version")
local lastUpdated = C_AddOns.GetAddOnMetadata(ADDON, "X-Date")
local currentCharacterKey = currentName .. "-" .. currentRealm
MenuConfig.selectedCharacter = currentCharacterKey

-- ==========================================
-- 1. MAIN LANDING CATEGORY AND CAT TAX
-- ==========================================
local frame = CreateFrame("Frame")

local background = frame:CreateTexture(nil, "BACKGROUND")
background:SetAllPoints(frame)

-- CAT TAX MAKES EVERYTHING BETTER
local logo = frame:CreateTexture(nil, "ARTWORK")
logo:SetSize(128, 128)
logo:SetPoint("TOPLEFT", frame, "TOPLEFT", 30, -30)
logo:SetTexture("Interface\\AddOns\\ProfessionLevelingRoute\\Media\\Logo")

-- Title: Profession Leveling Route (Until I hate the name and change it again)
local titleText = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
titleText:SetPoint("BOTTOM", logo, "BOTTOM", 30, -30)
titleText:SetText("Profession Leveling Route")

-- Metadata Information block: Author, Version, and Timestamp 

-- Yellow text for the Lables 
local labelText = {
    "|cFFFFD100Built by:|r",
    "|cFFFFD100Version:|r",
    "|cFFFFD100Last Updated:|r",
    "|cFFFFD100Special Thanks:|r",
    "|cFFFFD100Recommended Addons: |r"
}

-- White text for the information text that goes wtihin the Labels
local infoText = {
    "Erfwazbezbek",
    C_AddOns.GetAddOnMetadata(ADDON, "Version") or PLR.currentVersion or "Unknown",
    C_AddOns.GetAddOnMetadata(ADDON, "X-Date") or PLR.lastUpdate or "Unknown",
    "Slackluster - The ultimate slacker for his addon skills",
    "ATT, Profession Shopping List, TomTom"
}

-- Combines the Labels and Info text into one var
labelText = table.concat(labelText, "\n")
infoText = table.concat(infoText, "\n")


-- Yellow Lable formatting
local metaLabels = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
metaLabels:SetPoint("TOPLEFT", titleText, "BOTTOMLEFT", 0, -15)
metaLabels:SetJustifyH("LEFT")
metaLabels:SetSpacing(6)
metaLabels:SetWordWrap(true)
metaLabels:SetText(labelText)

-- White info formatting
local metaText= frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
metaText:SetPoint("TOPLEFT", metaLabels , "TOPRIGHT", 10, 0)
metaText:SetJustifyH("LEFT")
metaText:SetSpacing(6)
metaText:SetWordWrap(true)
metaText:SetText(infoText) 

-- Grey text underneath (No idea what to fully use this for but I will think of something)
local descText = frame:CreateFontString(nil, "OVERLAY", "GameFontDisable")
descText:SetPoint("TOPLEFT", metaLabels, "BOTTOMLEFT", 0, -30)
descText:SetJustifyH("LEFT")
descText:SetSpacing(6)
descText:SetWordWrap(true)
descText:SetText("Use the subcategories on the left side menu to manage tracked profiles.")

local mainCategory = Settings.RegisterCanvasLayoutCategory(frame, "Profession Leveling Route")
Settings.RegisterAddOnCategory(mainCategory)

ns.categoryID = mainCategory:GetID()

frame:SetScript("OnShow", function()
    ns.isMenuOpen = true
end)

frame:SetScript("OnHide", function()
    ns.isMenuOpen = false
end)

-- ==========================================
-- 2. CHARACTERS (Will eventually add more but just testing)
-- ==========================================
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


-- ==========================================
-- 3. PROFESSIONS SUBCATEGORY (Again will add more but just testing)
-- ==========================================

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
