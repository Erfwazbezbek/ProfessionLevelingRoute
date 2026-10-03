-- Roster.lua

local ADDON, ns = ...
local Roster = {}
ns.Roster = Roster

Roster.filterFaction = nil
Roster.filterSkillLineID = nil
Roster.filterProfessionName = nil
Roster.filterRuleset = nil

local function IsRulesetEnabled( character )
    if not character.realm or not character.realm.ruleset then
        return false
    end
    if not PLRDB or not PLRDB.rulesets then
        return true
    end
    return PLRDB.rulesets[ character.realm.ruleset ] ~= false
end

local function CreateFactionSection( page, faction, side )

    local section = CreateFrame(
        "Frame",
        nil,
        page
    )
    section:SetHeight( 55 )
    section.factionName = faction
    if side == "LEFT" then
        section:SetPoint( "TOPLEFT", page, "TOPLEFT", 15, -15 )
        section:SetPoint( "RIGHT", page, "CENTER", -10, 0 )
    else
        section:SetPoint( "TOPLEFT", page, "TOP", 10, -15 )
        section:SetPoint( "TOPRIGHT", page, "TOPRIGHT", -15, -15 )
    end
    section.faction = section:CreateFontString( nil, "OVERLAY", "GameFontNormalLarge" )
    section.faction:SetPoint( "TOPLEFT", section, "TOPLEFT", 0, 0 )
    section.faction:SetText( faction )
    return section
end

local function SetProfessionTooltipData( icon, skillLineID )

    icon.knownCharacters = {}
    icon.hordeKnown = false
    icon.allianceKnown = false
    for _, character in pairs( ns.Characters:_SmashNGrab() ) do
        if character.professions[ skillLineID ] then
            table.insert( icon.knownCharacters, character.name )
            if character.faction == "Horde" then
                icon.hordeKnown = true
            elseif character.faction == "Alliance" then
                icon.allianceKnown = true
            end
        end
    end
end

local function CreateRulesetFilters( page )

    local container = CreateFrame( "Frame", nil, page )
    container:SetSize( 120, 26 )
    container:SetPoint( "BOTTOMRIGHT", page, "TOPRIGHT", 0, 6 )
    container.buttons = {}
    local rulesetOrder = {
        "Normal",
        "PvP",
        "RP",
        "HC",
    }
    for index, ruleset in ipairs( rulesetOrder ) do
        local rulesetInfo = ns.Realms:GetRulesetInfo( ruleset )
        local button = CreateFrame( "Button", nil, container )
        button:SetSize( 24, 24 )
        button:SetPoint(
            "LEFT",
            container,
            "LEFT",
            ( index - 1 ) * 29,
            0
        )
        button.ruleset = ruleset
        button:SetScript( "OnClick", function()
            if PLRDB.rulesets[ ruleset ] == false then
                return
            end
            if Roster.filterRuleset == ruleset then
                Roster.filterRuleset = nil
            else
                Roster.filterRuleset = ruleset
            end
            Roster:RefreshCharacters( Roster.page )
        end )
        button.icon = button:CreateTexture( nil, "ARTWORK" )
        button.icon:SetAllPoints()
        button.icon:SetTexture( rulesetInfo.icon )
        button.border = button:CreateTexture( nil, "OVERLAY" )
        button.border:SetTexture( "Interface\\Buttons\\UI-ActionButton-Border" )
        button.border:SetBlendMode( "ADD" )
        button.border:SetPoint( "CENTER", button, "CENTER", 0, 0 )
        button.border:SetSize( 36, 36 )
        button.border:Hide()
        button:SetScript( "OnEnter", function()
            GameTooltip:SetOwner( button, "ANCHOR_RIGHT" )
            GameTooltip:SetText( rulesetInfo.name, 1, 0.82, 0 )
            GameTooltip:Show()
        end )
        button:SetScript( "OnLeave", function()
            GameTooltip:Hide()
        end )
        container.buttons[ ruleset ] = button
    end
    page.rulesetFilters = container
end

local function RefreshRulesetFilters( page )
    if not page.rulesetFilters then
        return
    end
    for ruleset, button in pairs( page.rulesetFilters.buttons ) do
        local enabled = PLRDB.rulesets[ ruleset ] ~= false
        if enabled then
            button.icon:SetDesaturated( false )
            button:SetAlpha( 1 )
            button:Enable()
        else
            button.icon:SetDesaturated( true )
            button:SetAlpha( 0.30 )
            button:Disable()
        end
        if enabled and Roster.filterRuleset == ruleset then
            button.border:Show()
        else
            button.border:Hide()
        end
    end
end

local function AddProfessionIcon( section, profession, index )

    local icon = ns.Components:CreateProfessionIcon(
        section,
        22
    )
    icon.selectionBorder = icon:CreateTexture( nil, "OVERLAY" )
    icon.selectionBorder:SetTexture( "Interface\\Buttons\\UI-ActionButton-Border" )
    icon.selectionBorder:SetBlendMode( "ADD" )
    icon.selectionBorder:SetPoint( "CENTER", icon, "CENTER", 0, 0 )
    icon.selectionBorder:SetSize( 38, 38 )
    icon.selectionBorder:Hide()
    icon:SetPoint( "TOPLEFT", section, "TOPLEFT", ( index - 1 ) * 27, -25 )
    icon.professionName = profession.name
    local texture =
        ns.Professions:GetTexture( profession.skillLineID )
    if texture then
        icon.icon:SetTexture( texture )
    end
    SetProfessionTooltipData( icon, profession.skillLineID )
    icon:SetScript( "OnClick", function()
        if icon:GetAlpha() < 1 then
            return
        end
        if Roster.filterFaction == section.factionName and
        Roster.filterSkillLineID == profession.skillLineID then
            Roster.filterFaction = nil
            Roster.filterSkillLineID = nil
            Roster.filterProfessionName = nil
        else
            Roster.filterFaction = section.factionName
            Roster.filterSkillLineID = profession.skillLineID
            Roster.filterProfessionName = profession.name
        end
        Roster:RefreshCharacters( Roster.page )
    end )
    return icon
    
end

local function PopulateFactionProfessions( section, faction )
    section.professionIcons = {}
    local knownProfessions = {}
    for _, character in pairs( ns.Characters:_SmashNGrab() ) do
        if IsRulesetEnabled( character ) and
        character.faction == faction then
            for skillLineID in pairs( character.professions ) do
                knownProfessions[ skillLineID ] = true
            end
        end
    end
    for index, profession in ipairs( ns.Professions.list ) do
        local icon = AddProfessionIcon(
            section,
            profession,
            index
        )
        if knownProfessions[ profession.skillLineID ] then
            icon.icon:SetDesaturated( false )
            icon.icon:SetVertexColor( 1, 1, 1 )
            icon:SetAlpha( 1 )
        else
            icon.icon:SetDesaturated( true )
            icon.icon:SetVertexColor( 1, 1, 1 )
            icon:SetAlpha( 0.30 )
        end
        if Roster.filterFaction == faction and
           Roster.filterSkillLineID == profession.skillLineID then
            icon.selectionBorder:Show()
        else
            icon.selectionBorder:Hide()
        end
        table.insert( section.professionIcons, icon )
    end
end

local function RefreshFactionProfessions( page )
    for _, icon in ipairs( page.hordeSection.professionIcons or {} ) do
        icon:Hide()
        icon:SetParent( nil )
    end
    for _, icon in ipairs( page.allianceSection.professionIcons or {} ) do
        icon:Hide()
        icon:SetParent( nil )
    end
    PopulateFactionProfessions( page.hordeSection, "Horde" )
    PopulateFactionProfessions( page.allianceSection, "Alliance" )
end

local function CreateCharacterList( page )

    local title = page:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormalLarge"
    )
    title:SetPoint( "TOPLEFT", page, "TOPLEFT", 15, -85 )
    title:SetText( "Characters" )

    local panel = ns.Components:CreatePanel( page )
    panel:SetPoint( "TOPLEFT", title, "BOTTOMLEFT", 0, -8 )
    panel:SetPoint( "BOTTOMRIGHT", page, "BOTTOMRIGHT", -10, 10 )

    local scrollFrame = CreateFrame(
        "ScrollFrame",
        nil,
        panel,
        "UIPanelScrollFrameTemplate"
    )
    scrollFrame:SetPoint( "TOPLEFT", panel, "TOPLEFT", 8, -8 )
    scrollFrame:SetPoint( "BOTTOMRIGHT", panel, "BOTTOMRIGHT", -28, 8 )

    local scrollChild = CreateFrame(
        "Frame",
        nil,
        scrollFrame
    )
    scrollChild:SetSize( 1, 1 )
    scrollFrame:SetScrollChild( scrollChild )

    local function UpdateScrollChildWidth()

        local width = scrollFrame:GetWidth()
        if width and width > 1 then
            scrollChild:SetWidth( width )
        end
    end
    scrollFrame:SetScript( "OnSizeChanged", function() 
        UpdateScrollChildWidth() 
    end )
    scrollFrame:SetScript( "OnShow", function()
        UpdateScrollChildWidth()
    end )
    panel.scrollFrame = scrollFrame
    panel.scrollChild = scrollChild
    return title, panel
end

-- Creates a tempalte for each character to have Profession 1/Profession 2 (default until picked)
-- and then Cooking/First Aid/Fishing since every class can learn it
local function CreateCharacterRow( parent, character, previousRow )

    local row = ns.Components:CreatePanel( parent )
    row:SetHeight( 82 )
    row:SetPoint( "LEFT", parent, "LEFT", 0, 0 )
    row:SetPoint( "RIGHT", parent, "RIGHT", 0, 0 )
    if previousRow then
        row:SetPoint( "TOP", previousRow, "BOTTOM", 0, -8 )
    else
        row:SetPoint( "TOP", parent, "TOP", 0, 0 )
    end
    row.name = row:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    row.name:SetPoint( "TOPLEFT", row, "TOPLEFT", 10, -8 )
    row.name:SetText( character.name )
    row.details = row:CreateFontString( nil, "OVERLAY", "GameFontHighlightSmall" )
    row.details:SetPoint( "LEFT", row.name, "RIGHT", 8, 0 )
    row.details:SetText( character.faction .. "  |  Level " .. character.level )

    local primaryProfessions = {}

    for _, skillLineID in ipairs( ns.Professions.primary ) do
        local profession =
            character.professions[ skillLineID ]
        if profession then
            table.insert( primaryProfessions, profession )
        end
    end

    local function CreateProfessionSlot( skillLineID, profession, previousSlot )

        local professionInfo = ns.Professions:GetBySkillLineID( skillLineID )
        if not professionInfo then
            return previousSlot
        end

        local slot = ns.Components:CreatePanel( row )
        slot:SetSize( 145, 36 )
        if previousSlot then
            slot:SetPoint( "TOPLEFT", previousSlot, "TOPRIGHT", 0, 0 )
        else
            slot:SetPoint( "TOPLEFT", row, "TOPLEFT", 10, -35 )
        end

        local icon =
            ns.Components:CreateProfessionIcon(
                slot,
                24
            )
        icon:SetPoint( "LEFT", slot, "LEFT", 6, 0 )

        local texture = ns.Professions:GetTexture( skillLineID )
        if texture then
            icon.icon:SetTexture( texture )
        end

        local text = slot:CreateFontString(
            nil,
            "OVERLAY",
            "GameFontHighlightSmall"
        )
        text:SetPoint( "LEFT", icon, "RIGHT", 6, 0 )
        text:SetPoint( "RIGHT", slot, "RIGHT", -6, 0 )
        text:SetJustifyH( "LEFT" )

        if profession then
            text:SetText(
                professionInfo.name ..
                "  |cffffd100" ..
                profession.skillLevel ..
                " / " ..
                profession.maxSkillLevel ..
                "|r"
            )
        else
            text:SetText(
                professionInfo.name ..
                "  |cff777777--|r"
            )
            icon.icon:SetDesaturated( true )
            icon:SetAlpha( 0.45 )
        end
        return slot
    end
    -- Dummy professions until picked because we all cant learn them instantly upon making a character
    local function CreatePrimaryPlaceholder( textureID, previousSlot )

        local slot = ns.Components:CreatePanel( row )
        slot:SetSize( 145, 36 )
        if previousSlot then
            slot:SetPoint( "TOPLEFT", previousSlot, "TOPRIGHT", 0, 0 )
        else
            slot:SetPoint( "TOPLEFT", row, "TOPLEFT", 10, -35 )
        end

        local icon = ns.Components:CreateProfessionIcon(
            slot,
            24
        )
        icon:SetPoint( "LEFT", slot, "LEFT", 6, 0 )
        icon.icon:SetTexture( textureID )
        icon.icon:SetDesaturated( true )
        icon:SetAlpha( 0.45 )

        local text = slot:CreateFontString( nil, "OVERLAY", "GameFontHighlightSmall" )
        text:SetPoint( "LEFT", icon, "RIGHT", 6, 0 )
        text:SetPoint( "RIGHT", slot, "RIGHT", -6, 0 )
        text:SetJustifyH( "LEFT" )
        text:SetText( "Profession  |cff777777--|r" )
        return slot
    end

    local previousSlot
    if primaryProfessions[ 1 ] then
        previousSlot = CreateProfessionSlot( primaryProfessions[ 1 ].skillLineID, primaryProfessions[ 1 ], previousSlot )
    else
        previousSlot = CreatePrimaryPlaceholder( 133738, previousSlot )
    end
    if primaryProfessions[ 2 ] then
        previousSlot = CreateProfessionSlot( primaryProfessions[ 2 ].skillLineID, primaryProfessions[ 2 ], previousSlot )
    else
        previousSlot = CreatePrimaryPlaceholder( 133737, previousSlot )
    end
    for _, skillLineID in ipairs( ns.Professions.secondary ) do

        local profession = character.professions[ skillLineID ]
        previousSlot = CreateProfessionSlot( skillLineID, profession, previousSlot )
    end
    return row
end

function Roster:Create( page )
    self.page = page
    local hordeSection = CreateFactionSection(
        page,
        "Horde",
        "LEFT"
    )

    local allianceSection = CreateFactionSection(
        page,
        "Alliance",
        "RIGHT"
    )
    CreateRulesetFilters( page )

    PopulateFactionProfessions(
        hordeSection,
        "Horde"
    )
    PopulateFactionProfessions(
        allianceSection,
        "Alliance"
    )
    local charactersTitle, characterList = CreateCharacterList(
        page
    )

    page.hordeSection = hordeSection
    page.allianceSection = allianceSection
    page.charactersTitle = charactersTitle
    page.characterList = characterList
    page.characterRows = {}
    self:RefreshCharacters( page )
end

function Roster:RefreshCharacters( page )
     if not page or not page.characterList then
        return
    end
    if Roster.filterRuleset and
       PLRDB.rulesets[ Roster.filterRuleset ] == false then
        Roster.filterRuleset = nil
    end
    for _, row in ipairs( page.characterRows ) do
        row:Hide()
        row:SetParent( nil )
    end
    if Roster.filterFaction and Roster.filterProfessionName then
        page.charactersTitle:SetText(
            "Characters - " ..
            Roster.filterFaction ..
            ": " ..
            Roster.filterProfessionName
        )
    else
        page.charactersTitle:SetText( "Characters" )
    end

    local previousRow
    local characters = {}

    for _, character in pairs( ns.Characters:_SmashNGrab() ) do
        local showCharacter = IsRulesetEnabled( character )
        if showCharacter and Roster.filterRuleset then
            showCharacter =
                character.realm.ruleset == Roster.filterRuleset
        end
        if showCharacter and
        Roster.filterFaction and
        Roster.filterSkillLineID then
            showCharacter =
                character.faction == Roster.filterFaction and
                character.professions[ Roster.filterSkillLineID ] ~= nil
        end
        if showCharacter then
            table.insert( characters, character )
        end
    end
    table.sort( characters, function( a, b )
        if a.faction ~= b.faction then
            return a.faction < b.faction
        end
        return a.name < b.name
    end )
    for _, character in ipairs( characters ) do
        local characterRow =
            CreateCharacterRow(
                page.characterList.scrollChild,
                character,
                previousRow
            )
        table.insert( page.characterRows, characterRow )
        previousRow = characterRow
    end
    local rowCount = #page.characterRows
    local rowHeight = 82
    local rowSpacing = 8

    local contentHeight =
        ( rowCount * rowHeight ) +
        ( math.max( rowCount - 1, 0 ) * rowSpacing )
    page.characterList.scrollChild:SetHeight( math.max( contentHeight, 1 ) )
    RefreshFactionProfessions( page )
    RefreshRulesetFilters( page )
end
