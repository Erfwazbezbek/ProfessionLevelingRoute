-- Recipes.lua
local ADDON, ns = ...
local Recipes = {}
ns.Recipes = Recipes

Recipes.selectedCharacter = nil
Recipes.selectedProfession = nil
Recipes.selectedProfessionName = nil
Recipes.selectedSource = nil
Recipes.searchText = ""
Recipes.recipeIDs = {}
Recipes.filteredRecipeIDs = {}
Recipes.page = nil

local UpdateRecipeRow
local RefreshVisibleRecipeRows
local FilterRecipeIDs
local SortRecipeIDsByRank
local GetRecipeState
local GetRecipeMeta
local function SafeTradeSkillCall(method, ...)
    local api = C_TradeSkillUI
    local fn = api and api[method]
    if type(fn) ~= "function" then return nil end
    local ok, result = pcall(fn, ...)
    if ok then return result end
    return nil
end

local function SafeItemCall(method, ...)
    local api = C_Item
    local fn = api and api[method]
    if type(fn) ~= "function" then return nil end
    local ok, first, second = pcall(fn, ...)
    if ok then return first, second end
    return nil
end

local VISIBLE_RECIPE_ROWS = 15
local RECIPE_ROW_HEIGHT = 28

local function CreateRecipesPanel( page )
    local panel = ns.Components:CreatePanel( page )
    panel:SetPoint( "TOPLEFT", page, "TOPLEFT", 5, -5 )
    panel:SetPoint( "BOTTOMRIGHT", page, "BOTTOMRIGHT", -5, 5 )
    page.recipesPanel = panel
end

local function CreateKnownToggle( page )
    local toggle = CreateFrame(
        "CheckButton",
        nil,
        page,
        "UICheckButtonTemplate"
    )
    toggle:SetSize( 24, 24 )
    toggle:SetPoint( "TOPRIGHT", page.recipesPanel, "TOPRIGHT", -165, 32 )
    local text = toggle:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    text:SetPoint( "LEFT", toggle, "RIGHT", 2, 0 )
    text:SetText( "Known" )
    toggle:SetChecked( true )
    toggle:SetScript( "OnClick", function()
        Recipes.filteredRecipeIDs = FilterRecipeIDs()
        page.recipeScrollChild:SetHeight( math.max( #Recipes.filteredRecipeIDs * RECIPE_ROW_HEIGHT, 1 ) )
        page.recipeScrollFrame:SetVerticalScroll( 0 )
        RefreshVisibleRecipeRows( page )
    end )
    page.knownToggle = toggle
end

local function CreateMissingToggle( page )
    local toggle = CreateFrame(
        "CheckButton",
        nil,
        page,
        "UICheckButtonTemplate"
    )
    toggle:SetSize( 24, 24 )
    toggle:SetPoint( "LEFT", page.knownToggle, "RIGHT", 65, 0 )
    local text = toggle:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    text:SetPoint( "LEFT", toggle, "RIGHT", 2, 0 )
    text:SetText( "Missing" )
    toggle:SetChecked( true )
    toggle:SetScript( "OnClick", function()
        Recipes.filteredRecipeIDs = FilterRecipeIDs()
        page.recipeScrollChild:SetHeight( math.max( #Recipes.filteredRecipeIDs * RECIPE_ROW_HEIGHT, 1 ) )
        page.recipeScrollFrame:SetVerticalScroll( 0 )
        RefreshVisibleRecipeRows( page )
    end )
    page.missingToggle = toggle
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

local function ClearRecipeRows( page )
    if not page.recipeRows then
        return
    end
    for _, row in ipairs( page.recipeRows ) do
        row:Hide()
    end
    if page.recipeScrollChild then
        page.recipeScrollChild:SetHeight( 1 )
    end
    if page.recipeScrollFrame then
        page.recipeScrollFrame:SetVerticalScroll( 0 )
    end
end

local function CreateCharacterDropdown( page )

    local dropdown = CreateFrame(
        "DropdownButton",
        nil,
        page.recipesPanel,
        "WowStyle1DropdownTemplate"
    )
    dropdown:SetSize( 180, 30 )
    dropdown:SetPoint( "TOPLEFT", page.recipesPanel, "TOPLEFT", 10, -10 )
    dropdown:SetupMenu( function( dropdown, rootDescription )
        local characters = GetAvailableCharacters()
        for _, characterData in ipairs( characters ) do
            local character = characterData.character
            local characterKey = characterData.key
            local text = character.name
            rootDescription:CreateRadio(
                text,
                function()
                    return Recipes.selectedCharacter == characterKey
                end,
                function()
                    Recipes.selectedCharacter = characterKey
                    Recipes.selectedProfession = nil
                    Recipes.selectedProfessionName = nil
                    Recipes.recipeIDs = {}
                    Recipes.filteredRecipeIDs = {}
                    ClearRecipeRows( page )
                    dropdown:SetDefaultText( character.name )
                    if page.professionDropdown then
                        page.professionDropdown:SetDefaultText( "Profession" )
                        page.professionDropdown.Text:SetText( "Profession" )
                    end
                end
            )
        end
    end )
    dropdown:SetDefaultText( "Character" )
    page.characterDropdown = dropdown
end

local function LoadCachedProfessionRecipes( professionName )
    Recipes.recipeIDs = {}
    local professionData = ns.RecipeData[ professionName ]
    if not professionData then
        return
    end
    for recipeID in pairs( professionData ) do
        table.insert( Recipes.recipeIDs, recipeID )
    end
    SortRecipeIDsByRank( Recipes.recipeIDs )
    Recipes.filteredRecipeIDs = FilterRecipeIDs()
    if Recipes.page then
        Recipes.page.recipeScrollChild:SetHeight( math.max( #Recipes.filteredRecipeIDs * RECIPE_ROW_HEIGHT, 1 ) )
        Recipes.page.recipeScrollFrame:SetVerticalScroll( 0 )
        RefreshVisibleRecipeRows( Recipes.page )
    end
end

local function CreateProfessionDropdown( page )

    local dropdown = CreateFrame(
        "DropdownButton",
        nil,
        page.recipesPanel,
        "WowStyle1DropdownTemplate"
    )

    dropdown:SetSize( 180, 30 )
    dropdown:SetPoint( "LEFT", page.characterDropdown, "RIGHT", 10, 0 )
    dropdown:SetupMenu( function( dropdown, rootDescription )
        if not Recipes.selectedCharacter then
            return
        end
        local characters = ns.Characters:_SmashNGrab()
        local character = characters[ Recipes.selectedCharacter ]
        if not character or not character.professions then
            return
        end
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
                    return Recipes.selectedProfession == skillLineID
                end,
                function()
                    Recipes.selectedProfession = skillLineID
                    Recipes.selectedProfessionName = profession.name
                    dropdown:SetDefaultText( profession.name )
                    LoadCachedProfessionRecipes( profession.name )
                end
            )
        end
    end )
    dropdown:SetDefaultText( "Profession" )
    page.professionDropdown = dropdown
end

local function CreateSourceDropdown( page )
    local dropdown = CreateFrame(
        "DropdownButton",
        nil,
        page.recipesPanel,
        "WowStyle1DropdownTemplate"
    )
    dropdown:SetSize( 150, 30 )
    dropdown:SetPoint( "LEFT", page.professionDropdown, "RIGHT", 10, 0 )
    dropdown:SetupMenu( function( dropdown, rootDescription )
        rootDescription:CreateRadio(
            "All Sources",
            function()
                return Recipes.selectedSource == nil
            end,
            function()
                Recipes.selectedSource = nil
                Recipes.filteredRecipeIDs = FilterRecipeIDs()
                page.recipeScrollChild:SetHeight( math.max( #Recipes.filteredRecipeIDs * RECIPE_ROW_HEIGHT, 1 ) )
                page.recipeScrollFrame:SetVerticalScroll( 0 )
                RefreshVisibleRecipeRows( page )
                dropdown:SetDefaultText( "All Sources" )
            end
        )
        local sources = {
            { name = "Crafted", value = "crafted" },
            { name = "Drop", value = "drop" },
            { name = "Quest", value = "quest" },
            { name = "Vendor", value = "vendor" },
            { name = "Trainer", value = "trainer" },
            { name = "Unknown", value = "unknown" },
        }
        for _, source in ipairs( sources ) do
            rootDescription:CreateRadio(
                source.name,
                function()
                    return Recipes.selectedSource == source.value
                end,
                function()
                    Recipes.selectedSource = source.value
                    Recipes.filteredRecipeIDs = FilterRecipeIDs()
                    page.recipeScrollChild:SetHeight( math.max( #Recipes.filteredRecipeIDs * RECIPE_ROW_HEIGHT, 1 ) )
                    page.recipeScrollFrame:SetVerticalScroll( 0 )
                    RefreshVisibleRecipeRows( page )
                    dropdown:SetDefaultText( source.name )
                end
            )
        end
    end )
    dropdown:SetDefaultText( "Source" )
    page.sourceDropdown = dropdown
end

local function CreateSearchBox( page )
    local searchBox = CreateFrame(
        "EditBox",
        nil,
        page.recipesPanel,
        "SearchBoxTemplate"
    )
    searchBox:SetSize( 200, 30 )
    searchBox:SetPoint( "LEFT", page.sourceDropdown, "RIGHT", 10, 0 )
    searchBox:SetAutoFocus( false )
    searchBox:SetScript( "OnTextChanged", function( self )
        Recipes.searchText = self:GetText() or ""

        if self.Instructions then
            self.Instructions:SetShown( Recipes.searchText == "" )
        end

        Recipes.filteredRecipeIDs = FilterRecipeIDs()
        page.recipeScrollChild:SetHeight( math.max( #Recipes.filteredRecipeIDs * RECIPE_ROW_HEIGHT, 1 ) )
        page.recipeScrollFrame:SetVerticalScroll( 0 )
        RefreshVisibleRecipeRows( page )
    end )
    page.searchBox = searchBox
end

local function CreateRecipeHeader( page )

    local header = CreateFrame(
        "Frame",
        nil,
        page.recipesPanel
    )
    header:SetPoint( "TOPLEFT", page.characterDropdown, "BOTTOMLEFT", 0, -10 )
    header:SetPoint( "RIGHT", page.recipesPanel, "RIGHT", -10, 0 )
    header:SetHeight( 24 )

    local status = header:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    status:SetPoint( "LEFT", header, "LEFT", 5, 0 )
    status:SetWidth( 30 )
    status:SetText( "" )

    local rank = header:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    rank:SetPoint( "LEFT", header, "LEFT", 35, 0 )
    rank:SetWidth( 50 )
    rank:SetJustifyH( "LEFT" )
    rank:SetText( "Rank" )

    local recipe = header:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    recipe:SetPoint( "LEFT", header, "LEFT", 105, 0 )
    recipe:SetWidth( 240 )
    recipe:SetJustifyH( "LEFT" )
    recipe:SetText( "Recipe" )

    local creates = header:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    creates:SetPoint( "LEFT", header, "LEFT", 355, 0 )
    creates:SetWidth( 200 )
    creates:SetJustifyH( "LEFT" )
    creates:SetText( "Creates" )

    local source = header:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    source:SetPoint( "LEFT", header, "LEFT", 625, 0 )
    source:SetWidth( 170 )
    source:SetJustifyH( "LEFT" )
    source:SetText( "Source" )
    page.recipeHeader = header
end

local function CreateRecipeScrollFrame( page )
    local scrollFrame = CreateFrame(
        "ScrollFrame",
        nil,
        page.recipesPanel,
        "UIPanelScrollFrameTemplate"
    )
    scrollFrame:SetPoint( "TOPLEFT", page.recipeHeader, "BOTTOMLEFT", 0, -2 )
    scrollFrame:SetPoint( "BOTTOMRIGHT", page.recipesPanel, "BOTTOMRIGHT", -30, 10 )

    local scrollChild = CreateFrame(
        "Frame",
        nil,
        scrollFrame
    )
    scrollChild:SetWidth( scrollFrame:GetWidth() )
    scrollChild:SetHeight( 56 )

    scrollFrame:SetScrollChild( scrollChild )

    scrollFrame:SetScript( "OnVerticalScroll", function()
        RefreshVisibleRecipeRows( page )
    end )

    page.recipeScrollFrame = scrollFrame
    page.recipeScrollChild = scrollChild
end

local function CreateRecipeRow( page, index, known, rankText, recipeText, createsText, sourceText )

    local row = CreateFrame(
        "Frame",
        nil,
        page.recipeScrollChild
    )
    row:SetPoint( "TOPLEFT", page.recipeScrollChild, "TOPLEFT", 0, -( ( index - 1 ) * 28 ) )
    row:SetPoint( "RIGHT", page.recipeScrollChild, "RIGHT", 0, 0 )
    row:SetHeight( 28 )

    local status = row:CreateTexture( nil, "ARTWORK" )
    status:SetSize( 16, 16 )
    status:SetPoint( "LEFT", row, "LEFT", 5, 0 )
    if known then
        status:SetTexture( "Interface\\RaidFrame\\ReadyCheck-Ready" )
    else
        status:SetTexture( "Interface\\RaidFrame\\ReadyCheck-NotReady" )
    end
    row.status = status

    local rank = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    rank:SetPoint( "LEFT", row, "LEFT", 35, 0 )
    rank:SetWidth( 50 )
    rank:SetJustifyH( "LEFT" )
    rank:SetText( rankText )
    row.rank = rank

    local recipe = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    recipe:SetPoint( "LEFT", row, "LEFT", 105, 0 )
    recipe:SetWidth( 240 )
    recipe:SetJustifyH( "LEFT" )
    recipe:SetText( recipeText )
    row.recipe = recipe

    local recipeButton = CreateFrame( "Button", nil, row )
    recipeButton:SetPoint( "TOPLEFT", recipe, "TOPLEFT", 0, 0 )
    recipeButton:SetPoint( "BOTTOMRIGHT", recipe, "BOTTOMRIGHT", 0, 0 )

    row.recipeButton = recipeButton

    local creates = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    creates:SetPoint( "LEFT", row, "LEFT", 355, 0 )
    creates:SetWidth( 200 )
    creates:SetJustifyH( "LEFT" )
    creates:SetText( createsText )
    row.creates = creates

    local createsButton = CreateFrame( "Button", nil, row )
    createsButton:SetPoint( "TOPLEFT", creates, "TOPLEFT", 0, 0 )
    createsButton:SetPoint( "BOTTOMRIGHT", creates, "BOTTOMRIGHT", 0, 0 )
    row.createsButton = createsButton

    local source = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    source:SetPoint( "LEFT", row, "LEFT", 625, 0 )
    source:SetWidth( 170 )
    source:SetJustifyH( "LEFT" )
    source:SetText( sourceText )
    row.source = source

    local sourceButton = CreateFrame( "Button", nil, row )
    sourceButton:SetPoint( "TOPLEFT", source, "TOPLEFT", 0, 0 )
    sourceButton:SetPoint( "BOTTOMRIGHT", source, "BOTTOMRIGHT", 0, 0 )
    row.sourceButton = sourceButton

    return row
end

local function GetRecipeSourceText( recipeData )
    if not recipeData or not recipeData.sources then
        return "Drop"
    end

    local sourceNames = {
        crafted = "Crafted", drop = "Drop", quest = "Quest",
        vendor = "Vendor", trainer = "Trainer", unknown = "Drop",
    }
    local sources, seen = {}, {}
    for _, sourceData in ipairs(recipeData.sources) do
        local sourceType = type(sourceData.type) == "string" and sourceData.type:lower() or ""
        local name = sourceNames[sourceType]
        if not name then
            name = (sourceType == "" or sourceType:match("^unknown")) and "Drop"
                or (sourceType:sub(1, 1):upper() .. sourceType:sub(2))
        end
        if not seen[name] then
            sources[#sources + 1] = name
            seen[name] = true
        end
    end
    return #sources > 0 and table.concat(sources, " / ") or "Drop"
end

UpdateRecipeRow = function( page, index, recipeMeta )
    if not recipeMeta then
        return
    end

    page.recipeRows = page.recipeRows or {}

    if index > VISIBLE_RECIPE_ROWS then
        return
    end

    local row = page.recipeRows[ index ]

    if not row then
        row = CreateRecipeRow( page, index, false, "", "", "", "" )
        page.recipeRows[ index ] = row
    end

    row:Show()

    local recipeState = GetRecipeState( recipeMeta.recipeID  )
    local recipeKnown = false

    if type( recipeState ) == "boolean" then
        recipeKnown = recipeState
    elseif type( recipeState ) == "table" then
        recipeKnown = recipeState.learned == true
    end

    if recipeKnown then
        row.status:SetTexture( "Interface\\RaidFrame\\ReadyCheck-Ready" )
    else
        row.status:SetTexture( "Interface\\RaidFrame\\ReadyCheck-NotReady" )
    end

    if recipeMeta.difficulty then
        row.rank:SetText( recipeMeta.difficulty.learnedAt or "" )
    else
        row.rank:SetText( "" )
    end

    if type( recipeState ) == "table" and recipeState.relativeDifficulty ~= nil then
        if Enum and Enum.TradeskillRelativeDifficulty and recipeState.relativeDifficulty == Enum.TradeskillRelativeDifficulty.Optimal then
            row.rank:SetTextColor( DIFFICULT_DIFFICULTY_COLOR:GetRGB() )
        elseif recipeState.relativeDifficulty == Enum.TradeskillRelativeDifficulty.Medium then
            row.rank:SetTextColor( FAIR_DIFFICULTY_COLOR:GetRGB() )
        elseif recipeState.relativeDifficulty == Enum.TradeskillRelativeDifficulty.Easy then
            row.rank:SetTextColor( EASY_DIFFICULTY_COLOR:GetRGB() )
        elseif recipeState.relativeDifficulty == Enum.TradeskillRelativeDifficulty.Trivial then
            row.rank:SetTextColor( TRIVIAL_DIFFICULTY_COLOR:GetRGB() )
        end
    else
        row.rank:SetTextColor( HIGHLIGHT_FONT_COLOR:GetRGB() )
    end

    local recipeItemID = nil

    if recipeMeta.recipeItems and recipeMeta.recipeItems[ 1 ] then
        recipeItemID = recipeMeta.recipeItems[ 1 ].itemID
    end

    if recipeItemID then
        local recipeItemName, recipeItemLink = SafeItemCall( "GetItemInfo", recipeItemID )
        row.recipe:SetText( recipeItemLink or recipeItemName or recipeMeta.name or "Unknown Recipe" )
        row.recipeButton:SetScript( "OnEnter", function()
            GameTooltip:SetOwner( row.recipeButton, "ANCHOR_RIGHT" )
            GameTooltip:SetItemByID( recipeItemID )

            if recipeMeta.reagents and #recipeMeta.reagents > 0 then
                GameTooltip:AddLine( " " )
                GameTooltip:AddDoubleLine(
                    "Craftable",
                    recipeMeta.craftableCount or 0
                )
                GameTooltip:AddLine( "Reagents" )

                for _, reagent in ipairs( recipeMeta.reagents ) do
                    local reagentName = SafeItemCall( "GetItemNameByID", reagent.itemID )
                    local quantityText =
                        reagent.quantityOwned ..
                        " / " ..
                        reagent.quantityRequired

                    local quantityColor = NORMAL_FONT_COLOR

                    if reagent.quantityOwned < reagent.quantityRequired then
                        quantityColor = RED_FONT_COLOR
                    end

                    GameTooltip:AddDoubleLine(
                        reagentName or "Unknown Item",
                        quantityText,
                        NORMAL_FONT_COLOR.r,
                        NORMAL_FONT_COLOR.g,
                        NORMAL_FONT_COLOR.b,
                        quantityColor.r,
                        quantityColor.g,
                        quantityColor.b
                    )
                end

                if recipeMeta.requirements and #recipeMeta.requirements > 0 then
                    GameTooltip:AddLine( " " )
                    GameTooltip:AddLine( "Requirements" )

                    for _, requirement in ipairs( recipeMeta.requirements ) do
                        local requirementText = requirement.met and "Met" or "Not Met"
                        local requirementColor = NORMAL_FONT_COLOR

                        if not requirement.met then
                            requirementColor = RED_FONT_COLOR
                        end

                        GameTooltip:AddDoubleLine(
                            requirement.name or "Unknown Requirement",
                            requirementText,
                            NORMAL_FONT_COLOR.r,
                            NORMAL_FONT_COLOR.g,
                            NORMAL_FONT_COLOR.b,
                            requirementColor.r,
                            requirementColor.g,
                            requirementColor.b
                        )
                    end
                end
            end

            GameTooltip:Show()
        end )
        row.recipeButton:SetScript( "OnLeave", function()
            GameTooltip:Hide()
        end )
        row.recipeButton:RegisterForClicks( "LeftButtonUp" )

        row.recipeButton:SetScript( "OnClick", function()
            if IsShiftKeyDown() and recipeItemLink then
                ChatEdit_InsertLink( recipeItemLink )
            end
        end )
    else
        row.recipe:SetText( recipeMeta.name or "Unknown Recipe" )
        row.recipeButton:SetScript( "OnEnter", nil )
        row.recipeButton:SetScript( "OnLeave", nil )
        row.recipeButton:SetScript( "OnClick", nil )
    end
    if recipeMeta.outputItemID then
        local outputItemName, outputItemLink = SafeItemCall( "GetItemInfo", recipeMeta.outputItemID )
        row.creates:SetText( outputItemLink or outputItemName or "Unknown Item" )
        row.createsButton:SetScript( "OnEnter", function()
            GameTooltip:SetOwner( row.createsButton, "ANCHOR_RIGHT" )
            GameTooltip:SetItemByID( recipeMeta.outputItemID )
            GameTooltip:Show()
        end )
        row.createsButton:SetScript( "OnLeave", function()
            GameTooltip:Hide()
        end )
        row.createsButton:RegisterForClicks( "LeftButtonUp" )
        row.createsButton:SetScript( "OnClick", function()
            if IsShiftKeyDown() and outputItemLink then
                ChatEdit_InsertLink( outputItemLink )
            end
        end )
    else
        row.creates:SetText( "" )
        row.createsButton:SetScript( "OnEnter", nil )
        row.createsButton:SetScript( "OnLeave", nil )
        row.createsButton:SetScript( "OnClick", nil )
    end
    local sourceText = GetRecipeSourceText( recipeMeta )
    local entries = recipeMeta.recipeItemSources or {}
    local playerFaction = UnitFactionGroup("player")

    local function SourceFaction(entry)
        local faction = entry.faction
        if type(faction) == "string" then
            faction = faction:lower()
            if faction == "horde" then return "Horde" end
            if faction == "alliance" then return "Alliance" end
            if faction == "neutral" or faction == "both" then return "Neutral" end
        end
        if entry.wowheadZoneID == 1519 then return "Alliance" end -- Stormwind
        if entry.wowheadZoneID == 1637 then return "Horde" end -- Orgrimmar
        return "Unspecified"
    end

    local preferred
    for _, entry in ipairs(entries) do
        if entry.type == "vendor" and entry.npcName then
            if not preferred then preferred = entry end
            if SourceFaction(entry) == playerFaction then
                preferred = entry
                break
            end
        end
    end
    if preferred then
        sourceText = "Vendor - " .. preferred.npcName
    end
    row.source:SetText(sourceText)

    if #entries > 0 then
        row.sourceButton:SetScript("OnEnter", function()
            GameTooltip:SetOwner(row.sourceButton, "ANCHOR_RIGHT")
            GameTooltip:AddLine("Recipe acquisition sources", 1, 0.82, 0)
            local order = { playerFaction, playerFaction == "Horde" and "Alliance" or "Horde", "Neutral", "Unspecified" }
            local any = false
            local seen = {}
            for _, group in ipairs(order) do
                local groupShown = false
                for _, entry in ipairs(entries) do
                    if SourceFaction(entry) == group then
                        local key = tostring(entry.type) .. ":" .. tostring(entry.npcID or entry.npcName or entry.questID or "")
                        if not seen[key] then
                            seen[key] = true
                            if not groupShown then
                                GameTooltip:AddLine(" ")
                                GameTooltip:AddLine(group == "Unspecified" and "Faction not specified" or group,
                                    group == playerFaction and 0.4 or 1,
                                    group == playerFaction and 1 or 0.82,
                                    group == playerFaction and 0.4 or 0)
                                groupShown = true
                            end
                            local kind = entry.type or "Source"
                            kind = kind:sub(1,1):upper() .. kind:sub(2)
                            local npc = entry.npcName or entry.questName
                            GameTooltip:AddLine(npc and (kind .. ": " .. npc) or kind, 1, 1, 1, true)
                            if entry.wowheadZoneID then
                                local zone = C_Map and C_Map.GetAreaInfo and C_Map.GetAreaInfo(entry.wowheadZoneID)
                                GameTooltip:AddDoubleLine("Zone", tostring(zone or entry.wowheadZoneID), 0.8, 0.8, 0.8, 1, 1, 1)
                            end
                            any = true
                        end
                    end
                end
            end
            if not any then GameTooltip:AddLine("No detailed sources available", 0.8, 0.8, 0.8) end
            local hasOwnFaction = false
            for _, entry in ipairs(entries) do
                if SourceFaction(entry) == playerFaction or SourceFaction(entry) == "Neutral" then
                    hasOwnFaction = true
                    break
                end
            end
            if not hasOwnFaction then
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine("No verified " .. tostring(playerFaction) .. " source in imported data", 1, 0.55, 0.3, true)
            end
            GameTooltip:Show()
        end)
        row.sourceButton:SetScript("OnLeave", function() GameTooltip:Hide() end)
    else
        row.sourceButton:SetScript("OnEnter", nil)
        row.sourceButton:SetScript("OnLeave", nil)
    end
end

SortRecipeIDsByRank = function( recipeIDs )
    local professionData = ns.RecipeData and ns.RecipeData[ Recipes.selectedProfessionName ]
    table.sort( recipeIDs, function( recipeIDA, recipeIDB )
        local recipeDataA = professionData and professionData[ recipeIDA ]
        local recipeDataB = professionData and professionData[ recipeIDB ]
        local rankA =
            recipeDataA and
            recipeDataA.difficulty and
            recipeDataA.difficulty.learnedAt
        local rankB =
            recipeDataB and
            recipeDataB.difficulty and
            recipeDataB.difficulty.learnedAt
        if rankA and rankB then
            if rankA ~= rankB then
                return rankA < rankB
            end
            return recipeIDA < recipeIDB
        end
        if rankA then
            return true
        end
        if rankB then
            return false
        end
        return recipeIDA < recipeIDB
    end )
end

GetRecipeState = function( recipeID )
    if not Recipes.selectedCharacter or not Recipes.selectedProfession then
        return
    end
    local characters = ns.Characters:_SmashNGrab()
    local character = characters[ Recipes.selectedCharacter ]
    if not character or not character.recipeKnowledge then
        return
    end
    local professionRecipes = character.recipeKnowledge[ Recipes.selectedProfession ]
    if not professionRecipes then
        return
    end
    return professionRecipes[ recipeID ]
end

GetRecipeMeta = function( recipeID )
    if not recipeID then
        return
    end

    local recipeInfo = SafeTradeSkillCall( "GetRecipeInfo", recipeID )
    if not recipeInfo then
        return
    end

    local schematic = SafeTradeSkillCall( "GetRecipeSchematic", recipeID, false )
    local craftableCount = SafeTradeSkillCall( "GetCraftableCount", recipeID )
    local recipeRequirements = SafeTradeSkillCall( "GetRecipeRequirements", recipeID )
    local professionData = ns.RecipeData and ns.RecipeData[ Recipes.selectedProfessionName ]
    local recipeData = professionData and professionData[ recipeID ]
    local requirements = {}
    local reagents = {}

    if schematic and schematic.reagentSlotSchematics then
        for _, reagentSlot in ipairs( schematic.reagentSlotSchematics ) do
            local reagent = reagentSlot.reagents and reagentSlot.reagents[ 1 ]

            if reagent and reagent.itemID then
                local quantityOwned = SafeItemCall( "GetItemCount",
                    reagent.itemID,
                    true,
                    false,
                    true,
                    true
                )

                table.insert( reagents, {
                    itemID = reagent.itemID,
                    quantityRequired = reagentSlot.quantityRequired,
                    quantityOwned = quantityOwned or 0,
                    required = reagentSlot.required,
                } )
            end
        end
    end
    if recipeRequirements then
        for _, requirement in ipairs( recipeRequirements ) do
            table.insert( requirements, {
                name = requirement.name,
                type = requirement.type,
                met = requirement.met,
            } )
        end
    end
    return {
        recipeID = recipeID,
        name = recipeInfo.name,
        maxTrivialLevel = recipeInfo.maxTrivialLevel,
        outputItemID = schematic and schematic.outputItemID,
        craftableCount = craftableCount,
        requirements = requirements,
        reagents = reagents,
        sources = recipeData and recipeData.sources,
        recipeItems = recipeData and recipeData.recipeItems,
        recipeItemSources =
            recipeData and
            recipeData.recipeItems and
            recipeData.recipeItems[ 1 ] and
            recipeData.recipeItems[ 1 ].sources,
        difficulty = recipeData and recipeData.difficulty,
    }
end

local function IsRecipeKnown( recipeID )
    local recipeState = GetRecipeState( recipeID )
    if type( recipeState ) == "boolean" then
        return recipeState
    end
    if type( recipeState ) ~= "table" then
        return false
    end
    return recipeState.learned == true
end

FilterRecipeIDs = function()
    local filteredRecipeIDs = {}
    if not Recipes.page then
        return filteredRecipeIDs
    end
    local showKnown = Recipes.page.knownToggle:GetChecked()
    local showMissing = Recipes.page.missingToggle:GetChecked()
    local professionData = ns.RecipeData and ns.RecipeData[ Recipes.selectedProfessionName ]
    local searchText = string.lower( Recipes.searchText or "" )
    for _, recipeID in ipairs( Recipes.recipeIDs ) do
        local recipeInfo = SafeTradeSkillCall( "GetRecipeInfo", recipeID )
        local recipeData = professionData and professionData[ recipeID ]
        local knownMatches = false
        local sourceMatches = Recipes.selectedSource == nil
        local searchMatches = searchText == ""
        if recipeInfo then
            if searchText ~= "" then
                local recipeName = string.lower( recipeInfo.name or "" )

                if string.find( recipeName, searchText, 1, true ) then
                    searchMatches = true
                end

                if not searchMatches then
                    local schematic = SafeTradeSkillCall( "GetRecipeSchematic", recipeID, false )

                    if schematic and schematic.outputItemID then
                        local outputItemName = SafeItemCall( "GetItemNameByID", schematic.outputItemID )

                        if outputItemName and
                           string.find( string.lower( outputItemName ), searchText, 1, true ) then
                            searchMatches = true
                        end
                    end
                end

                if not searchMatches and recipeData and recipeData.sources then
                    for _, sourceData in ipairs( recipeData.sources ) do
                        local sourceType = string.lower( sourceData.type or "" )

                        if string.find( sourceType, searchText, 1, true ) then
                            searchMatches = true
                            break
                        end
                    end
                end
            end
            local recipeKnown = IsRecipeKnown( recipeID )
            if recipeKnown and showKnown then
                knownMatches = true
            elseif not recipeKnown and showMissing then
                knownMatches = true
            end
            if Recipes.selectedSource then
                if recipeData and recipeData.sources then
                    for _, sourceData in ipairs( recipeData.sources ) do
                        if sourceData.type == Recipes.selectedSource then
                            sourceMatches = true
                            break
                        end
                    end
                end
                if Recipes.selectedSource == "unknown" and
                   ( not recipeData or
                     not recipeData.sources or
                     #recipeData.sources == 0 ) then
                    sourceMatches = true
                end
            end
            if knownMatches and sourceMatches and searchMatches then
                table.insert( filteredRecipeIDs, recipeID )
            end
        end
    end
    return filteredRecipeIDs
end

RefreshVisibleRecipeRows = function( page )
    if not page or not Recipes.recipeIDs then
        return
    end

    local scrollOffset = page.recipeScrollFrame:GetVerticalScroll()
    local firstRecipeIndex = math.floor( scrollOffset / RECIPE_ROW_HEIGHT ) + 1
    local recipeIDs = Recipes.filteredRecipeIDs
    local rowOffset = ( firstRecipeIndex - 1 ) * RECIPE_ROW_HEIGHT

    for rowIndex = 1, VISIBLE_RECIPE_ROWS do
        local recipeIndex = firstRecipeIndex + rowIndex - 1
        local recipeID = recipeIDs[ recipeIndex ]
        local row = page.recipeRows[ rowIndex ]
        if row then
            row:ClearAllPoints()
            row:SetPoint(
                "TOPLEFT",
                page.recipeScrollChild,
                "TOPLEFT",
                0,
                -( rowOffset + ( ( rowIndex - 1 ) * RECIPE_ROW_HEIGHT ) )
            )
            row:SetPoint( "RIGHT", page.recipeScrollChild, "RIGHT", 0, 0 )
        end
        if recipeID then
            local recipeMeta = GetRecipeMeta( recipeID )
            if recipeMeta then
                UpdateRecipeRow(
                    page,
                    rowIndex,
                    recipeMeta
                )
            elseif row then
                row:Hide()
            end
        elseif row then
            row:Hide()
        end
    end
end

-- Recipes, may I recommend a Coq au Vin?? 
--[[ 
4 Chicken Thighs (Make sure skin is on) 
4 Chicken Drumsticks (Again dont forget the skin, op for 8 things if you like dat dark meat instead)
1 1/2 Cups of Red Wine (Plus 1 bottle for your self)
    I fully recommend a Merlot for this recipe
    Rule of thumb, If you refuse to drink the wine... DONT COOK WITH IT
1 Cup of Chicken Stock (Dont be lazy... make your own!) 
    (Especially if you're doing 4x4 Thighs:Drumbsticks you got A LOT of extra chicekn to make a stock with)
1/4 Cup of Brandy (Rest for you! :D )
3 Chonky strips of thick cut bacon (Dont cheap out, you want the good stuff)
1 Teaspoon of Salt-n-Pepa (push it real good!)
1 Medium Onion (Use your REALLY SHARP AND NOT DULL KNIFE to thinly slice them long)
4 Medium carrots (Big enough to put on a fork/spoon without choking size)
4 Cloves of garlic minced (Lets be honest... if you're not using multiple heads of garlic you got issues)
2 Tablespoons of Tomato Paste 
2 Teaspoons FRESH Thyme (Dont got any, go to the store)
8 Mushrooms (Anything but shitake mushrooms work here) Thick sliced
8 Pearl Onions (peel them or they will be chewy)
Beurre Manie (Equal parts soft butter and flour) 
DO NOT LIQUIFY THE BUTTER, just fold it softly in your fingers like a child found dirt for the first time

1. Place Chicken in a bowl big enough for the wine, stock & brandy while you cut the rest of the stuff

2. Add bacon to a large HIGH sided pan or braiser over medium to high heat (dont burn or super heat this
    and cause the fire alarms to go off and scare your cats)
    Cook until its crispy and remove with a slotted spoon leaving that fatty goodness in there

3. Remove chicken from marinade !!! DO NOT THROW OUT THE LIQUID !!! 
    Pat dry the chicken with paper towels and season with half of the Salt-n-Pepa

4. Working in batches (Dont crowd the pan) place them in the pot skin side down
    LET THE COOK DO NOT MOVE THEM UNTIL THEY COME FREE THEM SELVES OR YOU WILL RUIN THE SKIN
    if you can move the chicken with the skin down easily its time to flip it and sear the non-skin side
    Once both sides cooked removed and set a side

5. Add those thiny sliced onions and carrorts to the pan, cook till onion is starting to caramlize 
    Add in that garlic and dont burn it 

6. Add tomato paste and cook till it becomes fragrant and starts to brown (you'll notice when it does)
    Once brown add in the wine marinade I know you didnt throw away from earlier
    Deglaze and bring to a boil

7. Bring Chicken back to their wine brandy stock bath and add in that Fresh Thyme.
    Cover and reduce to a simmer for about 20 mins 

8. On a SEPERATE PAN saute the mushrooms until brown 

9. Add the peeled pearl onions to the pot after the 20 min simmer has concluded, cook for another 10 mins  

10. Make the Beurre Manie and do one of two things (which ever is easier for you)
    Option 1: Add Beurre Manie to pot with chicken and bring to your desired thickness of liquid
    Option 2: Remove chicken and add Beurre Manie and bring to your desired thickness of liquid.


11. Add back bacon (and chicken if you did option 2) and sprinkle with some fresh thyme 

12. Plate and devour 

]]

function Recipes:Create( page )

    CreateRecipesPanel( page )
    CreateKnownToggle( page )
    CreateMissingToggle( page )
    CreateCharacterDropdown( page )
    CreateProfessionDropdown( page )
    CreateSourceDropdown( page )    
    CreateSearchBox( page )
    CreateRecipeHeader( page )
    CreateRecipeScrollFrame( page )

    page.recipeRows = {}
    Recipes.page = page

    page:HookScript( "OnShow", function()
        C_Timer.After( 0, function()
            if not page:IsShown() or Recipes.page ~= page then
                return
            end

            Recipes.filteredRecipeIDs = FilterRecipeIDs()
            page.recipeScrollChild:SetHeight( math.max( #Recipes.filteredRecipeIDs * RECIPE_ROW_HEIGHT, 1 ) )
            RefreshVisibleRecipeRows( page )
        end )
    end )
end
