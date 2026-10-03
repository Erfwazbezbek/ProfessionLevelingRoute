-- Planner.lua

local ADDON, ns = ...

local Planner = {}
ns.Planner = Planner
Planner.selectedCharacter = nil
Planner.selectedProfession = nil
Planner.fromRank = nil
Planner.toRank = nil

local SampleRecipes = {
    {
        id = 2538,
        name = "Embroidered Belt of the Archmage",
        learnedAt = 0,
        yellow = 45,
        green = 65,
        grey = 85,
        reagents = { [2672] = 1 },
        creates = 2679,
    },
    {
        id = 2540,
        name = "Roasted Boar Meat",
        learnedAt = 0,
        yellow = 45,
        green = 65,
        grey = 85,
        reagents = { [769] = 1 },
        creates = 2681,
    },
    {
        id = 7751,
        name = "Brilliant Smallfish",
        learnedAt = 1,
        yellow = 45,
        green = 65,
        grey = 85,
        reagents = { [6291] = 1 },
        creates = 6290,
        source = {
            type = "vendor",
            itemID = 6325,
            reqLevel = 5,
        },
    },
    {
        id = 7752,
        name = "Slitherskin Mackerel",
        learnedAt = 1,
        yellow = 45,
        green = 65,
        grey = 85,
        reagents = { [6303] = 1 },
        creates = 787,
        source = {
            type = "vendor",
            itemID = 6326,
            reqLevel = 5,
        },
    },
}
local RouteColumns = {
    track = 10,
    rank = 52,
    quantity = 157,
    cost = 185,
    recipe = 290,
    source = 500,
}

local function CreateShoppingPanel( page )
    local panel = ns.Components:CreatePanel( page )
    panel:SetPoint( "TOPLEFT", page, "TOPLEFT", 10, -10 )
    panel:SetPoint( "BOTTOMLEFT", page, "BOTTOMLEFT", 10, 10 )
    panel:SetWidth( 210 )
    local title = panel:CreateFontString( nil, "OVERLAY", "GameFontNormalLarge" )
    title:SetPoint( "TOPLEFT", panel, "TOPLEFT", 10, -10 )
    title:SetText( "Shopping List" )
    local vendorPanel = ns.Components:CreatePanel( panel )
    vendorPanel:SetPoint( "TOPLEFT", panel, "TOPLEFT", 5, -35 )
    vendorPanel:SetPoint( "TOPRIGHT", panel, "TOPRIGHT", -5, -35 )
    vendorPanel:SetHeight( 140 )
    local vendorTitle = vendorPanel:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    vendorTitle:SetPoint( "TOPLEFT", vendorPanel, "TOPLEFT", 8, -8 )
    vendorTitle:SetText( "Vendor" )
    local gatherPanel = ns.Components:CreatePanel( panel )
    gatherPanel:SetPoint( "TOPLEFT", vendorPanel, "BOTTOMLEFT", 0, -5 )
    gatherPanel:SetPoint( "BOTTOMRIGHT", panel, "BOTTOMRIGHT", -5, 5 )
    local gatherTitle = gatherPanel:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    gatherTitle:SetPoint( "TOPLEFT", gatherPanel, "TOPLEFT", 8, -8 )
    gatherTitle:SetText( "Auction / Gather" )
    page.shoppingPanel = panel
    page.vendorPanel = vendorPanel
    page.gatherPanel = gatherPanel
end

local function GetAvailableCharacters()
    local characters = {}
    for characterKey, character in pairs( ns.Characters:_SmashNGrab() ) do
        local rulesetEnabled =
            character.realm and
            character.realm.ruleset and
            PLRDB.rulesets[ character.realm.ruleset ] ~= false
        if rulesetEnabled then
            table.insert(
                characters,
                {
                    key = characterKey,
                    character = character,
                }
            )
        end
    end
    table.sort( characters, function( a, b )
        if a.character.name ~= b.character.name then
            return a.character.name < b.character.name
        end
        return a.character.realm.name < b.character.realm.name
    end )
    return characters
end

local function ResetProfessionSelection()
    Planner.selectedProfession = nil
    Planner.fromRank = nil
    Planner.toRank = nil
    if not Planner.page then
        return
    end
    if Planner.page.professionDropdown then
    local dropdown = Planner.page.professionDropdown
        dropdown:SetDefaultText( "Profession" )
        dropdown.Text:SetText( "Profession" )
    end
    if Planner.page.fromRankSlider then
        local slider = Planner.page.fromRankSlider
        slider:SetMinMaxValues( 1, 1 )
        slider:SetValue( 1 )
        slider.Low:SetText( "1" )
        slider.High:SetText( "1" )
        slider.valueText:SetText( "1" )
    end
    if Planner.page.toRankSlider then
        local slider = Planner.page.toRankSlider
        slider:SetMinMaxValues( 1, 1 )
        slider:SetValue( 1 )
        slider.Low:SetText( "1" )
        slider.High:SetText( "1" )
        slider.valueText:SetText( "1" )
    end
    if Planner.page.routeTitle then
        Planner.page.routeTitle:SetText( "Select a Profession" )
    end
end

local function CreateCharacterDropdown( parent )
    local dropdown = CreateFrame(
        "DropdownButton",
        nil,
        parent,
        "WowStyle1DropdownTemplate"
    )
    dropdown:SetPoint( "TOPLEFT", parent, "TOPLEFT", 0, 0 )
    dropdown:SetPoint( "BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 0 )
    dropdown:SetupMenu( function( dropdown, rootDescription )
        local characters = GetAvailableCharacters()
        for _, characterData in ipairs( characters ) do
            local character = characterData.character
            local characterKey = characterData.key
            local text =
                character.name ..
                " - " ..
                character.realm.name
            rootDescription:CreateRadio(
                text,
                function()
                    return Planner.selectedCharacter == characterKey
                end,
                function()
                    Planner.selectedCharacter = characterKey
                    Planner.selectedProfession = nil
                    Planner.fromRank = nil
                    Planner.toRank = nil
                    dropdown:SetDefaultText( character.name )
                    ResetProfessionSelection()
                end )
        end
    end )
    dropdown:SetDefaultText( "Character" )
    return dropdown
end

local function UpdateFromRankSlider()
    if not Planner.selectedCharacter or not Planner.selectedProfession then
        return
    end
    if not Planner.page or not Planner.page.fromRankSlider then
        return
    end
    local characters = ns.Characters:_SmashNGrab()
    local character = characters[ Planner.selectedCharacter ]
    if not character then
        return
    end
    local profession = character.professions[ Planner.selectedProfession ]
    if not profession then
        return
    end
    local slider = Planner.page.fromRankSlider
    local currentSkill = profession.skillLevel or 1
    local maxSkill = profession.maxSkillLevel or 1
    Planner.fromRank = currentSkill
    slider:SetMinMaxValues( 1, maxSkill )
    slider:SetValueStep( 1 )
    slider:SetObeyStepOnDrag( true )
    slider.Low:SetText( "1" )
    slider.High:SetText( maxSkill )
    slider:SetValue( 1 )
    slider:SetValue( currentSkill )
    slider.valueText:SetText( currentSkill )
end

local function UpdateToRankSlider()
    if not Planner.selectedCharacter or not Planner.selectedProfession then
        return
    end
    if not Planner.page or not Planner.page.toRankSlider then
        return
    end
    local characters = ns.Characters:_SmashNGrab()
    local character = characters[ Planner.selectedCharacter ]
    if not character then
        return
    end
    local profession = character.professions[ Planner.selectedProfession ]
    if not profession then
        return
    end
    local slider = Planner.page.toRankSlider
    local maxSkill = profession.maxSkillLevel or 1
    Planner.toRank = maxSkill
    slider:SetMinMaxValues( 1, maxSkill )
    slider:SetValueStep( 1 )
    slider:SetObeyStepOnDrag( true )
    slider.Low:SetText( "1" )
    slider.High:SetText( maxSkill )
    slider:SetValue( maxSkill )
    slider.valueText:SetText( maxSkill )
end

local function UpdateRouteTitle()
    if not Planner.page or not Planner.page.routeTitle then
        return
    end
    if not Planner.selectedCharacter or not Planner.selectedProfession then
        Planner.page.routeTitle:SetText( "Select a Profession" )
        return
    end
    local characters = ns.Characters:_SmashNGrab()
    local character = characters[ Planner.selectedCharacter ]
    if not character then
        Planner.page.routeTitle:SetText( "Select a Profession" )
        return
    end
    local profession = character.professions[ Planner.selectedProfession ]
    if not profession then
        Planner.page.routeTitle:SetText( "Select a Profession" )
        return
    end
    Planner.page.routeTitle:SetText( profession.name )
end


local function CreateProfessionDropdown( parent )

    local dropdown = CreateFrame(
        "DropdownButton",
        nil,
        parent,
        "WowStyle1DropdownTemplate"
    )
    dropdown:SetPoint( "TOPLEFT", parent, "TOPLEFT", 0, 0 )
    dropdown:SetPoint( "BOTTOMRIGHT", parent, "BOTTOMRIGHT", 0, 0 )
    dropdown:SetupMenu( function( dropdown, rootDescription )
        if not Planner.selectedCharacter then
            return
        end
        local characters = ns.Characters:_SmashNGrab()
        local character = characters[ Planner.selectedCharacter ]
        local professions = {}
        for skillLineID, profession in pairs( character.professions ) do
            table.insert(
                professions,
                {
                    skillLineID = skillLineID,
                    profession = profession,
                }
            )
        end
        table.sort( professions, function( a, b )
            return a.profession.name < b.profession.name
        end )
        for _, professionData in ipairs( professions ) do
            local profession = professionData.profession
            local skillLineID = professionData.skillLineID
            rootDescription:CreateRadio(
                profession.name,
                function()
                    return Planner.selectedProfession == skillLineID
                end,
                function()
                    Planner.selectedProfession = skillLineID
                    dropdown:SetDefaultText( profession.name )
                    UpdateFromRankSlider()
                    UpdateToRankSlider()
                    UpdateRouteTitle()
                end
            )
        end
    end )
    dropdown:SetDefaultText( "Profession" )
    return dropdown
end

local function CreateFromRankSlider( parent )
    local slider = CreateFrame(
        "Slider",
        nil,
        parent,
        "OptionsSliderTemplate"
    )
    slider:SetPoint( "LEFT", parent, "LEFT", 25, -10 )
    slider:SetPoint( "RIGHT", parent, "RIGHT", -25, -10 )
    slider:SetHeight( 16 )
    slider:SetMinMaxValues( 1, 1 )
    slider:SetValueStep( 1 )
    slider:SetObeyStepOnDrag( true )
    slider:SetValue( 1 )
    slider.Low:SetText( "1" )
    slider.High:SetText( "1" )
    slider.Text:SetText( "" )
    local valueText = parent:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    valueText:SetPoint( "TOP", slider, "BOTTOM", 0, 2 )
    valueText:SetText( "1" )
    slider:SetScript( "OnValueChanged", function( self, value )
    value = math.floor( value + 0.5 )
    local maximum = Planner.toRank
    if maximum and value > maximum then
        value = maximum
        self:SetValue( value )
    end
    Planner.fromRank = value
    valueText:SetText( value )
    end )
    slider.valueText = valueText
    return slider
end

local function CreateToRankSlider( parent )
    local slider = CreateFrame(
        "Slider",
        nil,
        parent,
        "OptionsSliderTemplate"
    )
    slider:SetPoint( "LEFT", parent, "LEFT", 25, -10 )
    slider:SetPoint( "RIGHT", parent, "RIGHT", -25, -10 )
    slider:SetHeight( 16 )
    slider:SetMinMaxValues( 1, 1 )
    slider:SetValueStep( 1 )
    slider:SetObeyStepOnDrag( true )
    slider:SetValue( 1 )
    slider.Low:SetText( "1" )
    slider.High:SetText( "1" )
    slider.Text:SetText( "" )
    local valueText = parent:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    valueText:SetPoint( "TOP", slider, "BOTTOM", 0, 2 )
    valueText:SetText( "1" )
    slider:SetScript( "OnValueChanged", function( self, value )
    value = math.floor( value + 0.5 )
    local minimum = Planner.fromRank or 1
    if value < minimum then
        value = minimum
        self:SetValue( value )
    end
    Planner.toRank = value
    valueText:SetText( value )
    end )
    slider.valueText = valueText
    return slider
end

local function CreateControlsPanel( page )

    local panel = ns.Components:CreatePanel( page )
    panel:SetPoint( "TOPLEFT", page.shoppingPanel, "TOPRIGHT", 5, 0 )
    panel:SetPoint( "TOPRIGHT", page, "TOPRIGHT", -10, -10 )
    panel:SetHeight( 70 )

    local character = ns.Components:CreatePanel( panel )
    character:SetPoint( "TOPLEFT", panel, "TOPLEFT", 5, -5 )
    character:SetSize( 175, 27 )

    local characterDropdown = CreateCharacterDropdown( character )

    local profession = ns.Components:CreatePanel( panel )
    profession:SetPoint( "TOPLEFT", character, "BOTTOMLEFT", 0, -3 )
    profession:SetSize( 175, 27 )

    local professionDropdown = CreateProfessionDropdown( profession )

    local rankArea = CreateFrame( "Frame", nil, panel )
    rankArea:SetPoint( "TOPLEFT", character, "TOPRIGHT", 15, 0 )
    rankArea:SetPoint( "BOTTOMRIGHT", panel, "BOTTOMRIGHT", -5, 5 )

    local fromRank = CreateFrame( "Frame", nil, rankArea )
    fromRank:SetPoint( "TOPLEFT", rankArea, "TOPLEFT", 0, 0 )
    fromRank:SetPoint( "BOTTOMRIGHT", rankArea, "BOTTOM", -5, 0 )

    local fromRankText = fromRank:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    fromRankText:SetPoint( "TOP", fromRank, "TOP", 0, -3 )
    fromRankText:SetText( "From Rank" )

    local fromRankSlider = CreateFromRankSlider( fromRank )

    local toRank = CreateFrame( "Frame", nil, rankArea )
    toRank:SetPoint( "TOPLEFT", rankArea, "TOP", 5, 0 )
    toRank:SetPoint( "BOTTOMRIGHT", rankArea, "BOTTOMRIGHT", 0, 0 )

    local toRankText = toRank:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    toRankText:SetPoint( "TOP", toRank, "TOP", 0, -3 )
    toRankText:SetText( "To Rank" )

    local toRankSlider = CreateToRankSlider( toRank )

    page.plannerControls = panel
    page.characterControl = character
    page.characterDropdown = characterDropdown
    page.professionControl = profession
    page.professionDropdown = professionDropdown
    page.fromRankControl = fromRank
    page.fromRankSlider = fromRankSlider
    page.toRankControl = toRank
    page.toRankSlider = toRankSlider
end

local function CreateRouteRow( parent, recipe, index )

    local row = CreateFrame( "Frame", nil, parent )
    row:SetPoint( "TOPLEFT", parent, "TOPLEFT", 0, -30 - ( ( index - 1 ) * 28 ) )
    row:SetPoint( "TOPRIGHT", parent, "TOPRIGHT", -5, -30 - ( ( index - 1 ) * 28 ) )
    row:SetHeight( 26 )

    local track = CreateFrame( "CheckButton", nil, row, "UICheckButtonTemplate" )
    track:SetPoint( "LEFT", row, "LEFT", RouteColumns.track, 0 )
    track:SetSize( 24, 24 )

    local isTracked = PLRDB.trackedRecipes[ recipe.id ]
    if isTracked == nil then
        isTracked = true
    end
    track:SetChecked( isTracked )
    track:SetScript( "OnClick", function( self )
        PLRDB.trackedRecipes[ recipe.id ] = self:GetChecked()
    end )

    local rank = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    rank:SetPoint( "LEFT", row, "LEFT", RouteColumns.rank, 0 )
    rank:SetText(
        recipe.learnedAt ..
        " | " ..
        recipe.yellow ..
        " | " ..
        recipe.green ..
        " | " ..
        recipe.grey
    )

    local quantity = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    quantity:SetPoint( "LEFT", row, "LEFT", RouteColumns.quantity, 0 )
    quantity:SetText( "99" )

    local cost = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    cost:SetPoint( "LEFT", row, "LEFT", RouteColumns.cost, 0 )
    cost:SetText( "9999g 99s 99c" )

    local recipeName = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    recipeName:SetPoint( "LEFT", row, "LEFT", RouteColumns.recipe, 0 )
    recipeName:SetText( recipe.name )

    local source = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    source:SetPoint( "LEFT", row, "LEFT", RouteColumns.source, 0 )
    source:SetWidth( 65 )

    if recipe.source then
        source:SetText(
            string.upper( string.sub( recipe.source.type, 1, 1 ) ) ..
            string.sub( recipe.source.type, 2 )
        )
    else
        source:SetText( "Trainer" )
    end
    row.recipe = recipe
    row.track = track

    return row
end

local function CreateRoutePanel( page )
    local title = page:CreateFontString( nil, "OVERLAY", "GameFontNormalLarge" )
    title:SetPoint( "TOPLEFT", page.plannerControls, "BOTTOMLEFT", 0, -10 )
    title:SetText( "Select a Profession" )

    local panel = ns.Components:CreatePanel( page )
    panel:SetPoint( "TOPLEFT", title, "BOTTOMLEFT", 0, -8 )
    panel:SetPoint( "BOTTOMRIGHT", page, "BOTTOMRIGHT", -10, 10 )

    local track = panel:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    track:SetPoint( "TOPLEFT", panel, "TOPLEFT", RouteColumns.track, -10 )
    track:SetText( "Track" )

    local rank = panel:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    rank:SetPoint( "TOPLEFT", panel, "TOPLEFT", RouteColumns.rank, -10 )
    rank:SetText( "Rank" )

    local quantity = panel:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    quantity:SetPoint( "TOPLEFT", panel, "TOPLEFT", RouteColumns.quantity, -10 )
    quantity:SetText( "Qty" )

    local cost = panel:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    cost:SetPoint( "TOPLEFT", panel, "TOPLEFT", RouteColumns.cost, -10 )
    cost:SetText( "Cost" )

    local recipe = panel:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    recipe:SetPoint( "TOPLEFT", panel, "TOPLEFT", RouteColumns.recipe, -10 )
    recipe:SetText( "Recipe" )

    local source = panel:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    source:SetPoint( "TOPLEFT", panel, "TOPLEFT", RouteColumns.source, -10 )
    source:SetWidth( 65 )
    source:SetText( "Source" )
    page.routeRows = {}
    for index, recipe in ipairs( SampleRecipes ) do
        local row = CreateRouteRow(
            panel,
            recipe,
            index
        )

        table.insert( page.routeRows, row )
    end
    page.routeTitle = title
    page.routePanel = panel

end

function Planner:Create( page )
    self.page = page
    CreateShoppingPanel( page )
    CreateControlsPanel( page )
    CreateRoutePanel( page )
end

function Planner:RefreshTrackedRecipes()
    if not self.page or not self.page.routeRows then
        return
    end
    for _, row in ipairs( self.page.routeRows ) do
        local recipeID = row.recipe.id
        local isTracked = PLRDB.trackedRecipes[ recipeID ]
        if isTracked == nil then
            isTracked = true
        end
        row.track:SetChecked( isTracked )
    end
end
