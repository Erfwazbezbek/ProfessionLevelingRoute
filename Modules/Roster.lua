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

local function AddProfessionIcon( section, profession, index )

    local icon = ns.Components:CreateProfessionIcon(
        section,
        22
    )

    icon:SetPoint( "TOPLEFT", section.missing, "BOTTOMLEFT", ( index - 1 ) * 27, -5 )
    icon.professionName = profession.name
    if profession.icon then
        icon.icon:SetTexture(
            profession.icon
        )
    end
    return icon
end

local function PopulateMissingProfessions( section )

    section.professionIcons = {}

    for index, profession in ipairs( ns.Professions.list ) do

        local icon = AddProfessionIcon(
            section,
            profession,
            index
        )
        if icon then
            table.insert(
                section.professionIcons,
                icon
            )
        end
    end
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

local function CreateCharacterRow( parent, character )

    local row = CreateFrame(
        "Frame",
        nil,
        parent
    )

    row:SetPoint( "TOPLEFT", parent, "TOPLEFT", 10, -10 )
    row:SetPoint( "TOPRIGHT", parent, "TOPRIGHT", -10, -10 )
    row:SetHeight( 45 )
    row.name = row:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    row.name:SetPoint( "TOPLEFT", 5, -5 )
    row.name:SetText( character.name )
    row.details = row:CreateFontString( nil, "OVERLAY", "GameFontHighlightSmall" )
    row.details:SetPoint( "TOPLEFT", row.name, "BOTTOMLEFT", 0, -4 )
    row.details:SetText( character.class.name .. "  -  Level " .. character.level .. "  -  " .. character.faction )

    local previousIcon
    for _, profession in pairs( character.professions ) do

        local icon = ns.Components:CreateProfessionIcon( row, 24 )
        icon.icon:SetTexture( profession.icon )
        icon.professionName = profession.name
        if previousIcon then
            icon:SetPoint( "RIGHT", previousIcon, "LEFT", -5, 0 )
        else
            icon:SetPoint( "RIGHT", row, "RIGHT", -5, 0)
        end
        previousIcon = icon
    end
    return row
end

function Roster:Create( page )

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
    PopulateMissingProfessions( hordeSection )
    PopulateMissingProfessions( allianceSection )
    local charactersTitle, characterList = CreateCharacterList(
        page,
        allianceSection
    )

    page.hordeSection = hordeSection
    page.allianceSection = allianceSection
    page.charactersTitle = charactersTitle
    page.characterList = characterList
    
    local character =
    ns.Characters:GetCurrentCharacter()

    local characterRow =
        CreateCharacterRow(
            characterList,
            character
        )
    page.characterRow = characterRow

end
