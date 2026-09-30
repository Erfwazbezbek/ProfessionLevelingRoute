-- Roster.lua

local ADDON, ns = ...
local Roster = {}
ns.Roster = Roster

local function CreateFactionSection( page, anchor, faction )

    local section = CreateFrame(
        "Frame",
        nil,
        page
    )
    if anchor then
        section:SetPoint( "TOPLEFT", anchor, "BOTTOMLEFT", 0, -8 )
    else
        section:SetPoint( "TOPLEFT", page, "TOPLEFT", 15, -15 )
    end
    section:SetPoint( "TOPRIGHT", page, "TOPRIGHT", -15, 0 )
    section:SetHeight( 65 )
    section.faction = section:CreateFontString( nil, "OVERLAY", "GameFontNormalLarge" )
    section.faction:SetPoint( "TOPLEFT", 0, 0 )
    section.faction:SetText( faction )
    section.missing = section:CreateFontString( nil, "OVERLAY", "GameFontHighlightSmall" )
    section.missing:SetPoint( "TOPLEFT", section.faction, "BOTTOMLEFT", 10, -3 )
    section.missing:SetText( "Missing: None" )

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

local function AddProfessionIcon( section, profession, index )

    local icon = ns.Components:CreateProfessionIcon(
        section,
        22
    )

    icon:SetPoint( "TOPLEFT", section.missing, "BOTTOMLEFT", ( index - 1 ) * 27, -5 )
    icon.professionName = profession.name
    local texture =
    ns.Professions:GetTexture( profession.skillLineID )
    if texture then
        icon.icon:SetTexture( texture )
    end
    SetProfessionTooltipData( icon, profession.skillLineID )
    return icon
end

local function PopulateMissingProfessions( section, faction )
    section.professionIcons = {}
    local knownProfessions = {}
    for _, character in pairs( ns.Characters:_SmashNGrab() ) do
        if character.faction == faction then
            for skillLineID in pairs( character.professions ) do
                knownProfessions[ skillLineID ] = true
            end
        end
    end

    local missingCount = 0
    for _, profession in ipairs( ns.Professions.list ) do
        if not knownProfessions[ profession.skillLineID ] then
            missingCount = missingCount + 1
            local icon = AddProfessionIcon(
                section,
                profession,
                missingCount
            )
            table.insert( section.professionIcons, icon )
        end
    end
    if missingCount == 0 then
        section.missing:SetText( "Missing: None" )
    else
        section.missing:SetText( "Missing:" )
    end
end

local function RefreshMissingProfessions( page )
    for _, icon in ipairs( page.hordeSection.professionIcons or {} ) do
        icon:Hide()
        icon:SetParent( nil )
    end
    for _, icon in ipairs( page.allianceSection.professionIcons or {} ) do
        icon:Hide()
        icon:SetParent( nil )
    end
    PopulateMissingProfessions( page.hordeSection, "Horde" )
    PopulateMissingProfessions( page.allianceSection, "Alliance" )
end

local function CreateCharacterList( page, anchor )

    local title = page:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormalLarge"
    )
    title:SetPoint( "TOPLEFT", anchor, "BOTTOMLEFT", 0, -12 )
    title:SetText( "Characters" )

    local panel = ns.Components:CreatePanel( page )

    panel:SetPoint( "TOPLEFT", title, "BOTTOMLEFT", 0, -10 )
    panel:SetPoint( "BOTTOMRIGHT", page, "BOTTOMRIGHT", -15, 15 )

    return title, panel
end

local function CreateCharacterRow( parent, character, previousRow )

    local row = CreateFrame(
        "Frame",
        nil,
        parent
    )
    if previousRow then
        row:SetPoint( "TOPLEFT", previousRow, "BOTTOMLEFT", 0, -5 )
        row:SetPoint( "TOPRIGHT", previousRow, "BOTTOMRIGHT", 0, -5 )
    else
        row:SetPoint( "TOPLEFT", parent, "TOPLEFT", 10, -10 )
        row:SetPoint( "TOPRIGHT", parent, "TOPRIGHT", -10, -10 )
    end
    row:SetHeight( 45 )
    row.name = row:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    row.name:SetPoint( "TOPLEFT", 5, -5 )
    row.name:SetText( character.name )
    row.details = row:CreateFontString( nil, "OVERLAY", "GameFontHighlightSmall" )
    row.details:SetPoint( "TOPLEFT", row.name, "BOTTOMLEFT", 0, -4 )
    row.details:SetText(
    character.class.name ..
    "  -  Level " .. character.level ..
    "  -  " .. character.faction ..
    "  -  " .. character.realm
    )

    local previousIcon
    for _, professionInfo in ipairs( ns.Professions.list ) do
        local profession = character.professions[ professionInfo.skillLineID ]
        if profession then
            local icon =
                ns.Components:CreateProfessionIcon(
                    row,
                    24
                )
            icon.icon:SetTexture( ns.Professions:GetTexture( profession.skillLineID ) )
            icon.professionName = profession.name
            icon.skillLevel = profession.skillLevel
            icon.maxSkillLevel = profession.maxSkillLevel
            SetProfessionTooltipData( icon, profession.skillLineID )
            if previousIcon then
                icon:SetPoint( "RIGHT", previousIcon, "LEFT", -5, 0 )
            else
                icon:SetPoint( "RIGHT", row, "RIGHT", -5, 0 )
            end
            previousIcon = icon
        end
    end
    return row
end

function Roster:Create( page )
    self.page = page
    local hordeSection = CreateFactionSection(
        page,
        nil,
        "Horde"
    )

    local allianceSection = CreateFactionSection(
        page,
        hordeSection,
        "Alliance"
    )
    local charactersTitle, characterList = CreateCharacterList(
        page,
        allianceSection
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
    for _, row in ipairs( page.characterRows ) do
        row:Hide()
        row:SetParent( nil )
    end
    page.characterRows = {}

    local previousRow
    local characters = {}

    for _, character in pairs( ns.Characters:_SmashNGrab() ) do
        table.insert( characters, character )
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
                page.characterList,
                character,
                previousRow
            )
        table.insert( page.characterRows, characterRow )
        previousRow = characterRow
    end
    RefreshMissingProfessions( page )
end
