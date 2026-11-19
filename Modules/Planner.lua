-- Planner.lua

local ADDON, ns = ...

local Planner = {}
ns.Planner = Planner
Planner.selectedCharacter = nil
Planner.selectedProfession = nil
Planner.selectedProfessionName = nil
Planner.fromRank = nil
Planner.toRank = nil

local GetSelectedRecipeIDs
local GetRouteRecipeIDs
local GetCraftQuantity
local BuildLevelingRoute
local CreateRouteRow
local RefreshRouteRows
local RefreshShoppingList
local RefreshRecipeSelectionMenu
local GetDisplayedRouteSteps
local GetStepSelection

local function PlannerSettings()
    PLRDB = PLRDB or {}
    PLRDB.plannerSettings = PLRDB.plannerSettings or {}
    return PLRDB.plannerSettings
end

local function SavePlannerSettings()
    local settings = PlannerSettings()
    settings.character = Planner.selectedCharacter
    settings.profession = Planner.selectedProfession
    settings.fromRank = Planner.fromRank
    settings.toRank = Planner.toRank
end

local reagentCache = {}
local function ClearReagentCache()
    wipe(reagentCache)
end

-- Selection is per character and profession; unselected recipes are excluded
-- from route construction, but remain available in the recipe picker.
local function GetSelectionTable()
    PLRDB = PLRDB or {}
    PLRDB.plannerRecipeSelections = PLRDB.plannerRecipeSelections or {}
    local characterKey = Planner.selectedCharacter
    local professionKey = Planner.selectedProfession
    if not characterKey or not professionKey then return nil end
    local byCharacter = PLRDB.plannerRecipeSelections[ characterKey ]
    if not byCharacter then
        byCharacter = {}
        PLRDB.plannerRecipeSelections[ characterKey ] = byCharacter
    end
    local byProfession = byCharacter[ professionKey ]
    if not byProfession then
        byProfession = {}
        byCharacter[ professionKey ] = byProfession
    end
    return byProfession
end

local function IsRecipeIncluded( recipeID )
    local selections = GetSelectionTable()
    return not selections or selections[ recipeID ] ~= false
end

local function SetRecipeIncluded( recipeID, included )
    local selections = GetSelectionTable()
    if selections then
        if included then
            selections[ recipeID ] = nil
        else
            selections[ recipeID ] = false 
        end
    end
end


local RouteColumns = {
    track = 10,
    rank = 52,
    quantity = 157,
    cost = 185,
    recipe = 290,
    source = 515,
}

-- Vendor-supplied reagents verified for the initial Classic profession set.
-- This is an item-ID whitelist, NOT a list of NPCs or vendor-sold recipes.
-- Extend only with confirmed vendor inventory.
local VendorReagents = {
    [2320] = true,  -- Coarse Thread
    [2321] = true,  -- Fine Thread
    [4291] = true,  -- Silken Thread
    [8343] = true,  -- Heavy Silken Thread
    [14341] = true, -- Rune Thread
    [4340] = true,  -- Gray Dye
    [4341] = true,  -- Yellow Dye
    [2325] = true,  -- Black Dye
    [2604] = true,  -- Red Dye
    [6260] = true,  -- Blue Dye
    [6261] = true,  -- Orange Dye
}

local function CreateShoppingSection( parent, titleText )
    local title = parent:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    title:SetPoint( "TOPLEFT", parent, "TOPLEFT", 8, -8 )
    title:SetText( titleText )

    local scroll = CreateFrame( "ScrollFrame", nil, parent, "UIPanelScrollFrameTemplate" )
    -- Two-column layout: the amount column is wide enough for 999/999.
    local itemHeader = parent:CreateFontString( nil, "OVERLAY", "GameFontHighlightSmall" )
    itemHeader:SetPoint( "TOPLEFT", parent, "TOPLEFT", 8, -26 )
    itemHeader:SetText( "Item" )

    local amountHeader = parent:CreateFontString( nil, "OVERLAY", "GameFontHighlightSmall" )
    amountHeader:SetPoint( "TOPRIGHT", parent, "TOPRIGHT", -24, -26 )
    amountHeader:SetWidth( 70 )
    amountHeader:SetJustifyH( "RIGHT" )
    amountHeader:SetText( "Amount" )

    scroll:SetPoint( "TOPLEFT", parent, "TOPLEFT", 8, -45 )
    scroll:SetPoint( "BOTTOMRIGHT", parent, "BOTTOMRIGHT", -24, 5 )

    local content = CreateFrame( "Frame", nil, scroll )
    content:SetSize( 208, 1 )
    scroll:SetScrollChild( content )

    return { scroll = scroll, content = content, lines = {} }
end

local function CreateShoppingPanel( page )
    local panel = ns.Components:CreatePanel( UIParent )
    panel:SetSize( 255, 540 )
    panel:SetFrameStrata( "DIALOG" )
    panel:SetClampedToScreen( true )
    panel:SetMovable( true )
    panel:EnableMouse( true )
    panel:RegisterForDrag( "LeftButton" )
    panel:SetScript( "OnDragStart", panel.StartMoving )
    panel:SetScript( "OnDragStop", panel.StopMovingOrSizing )
    panel:SetPoint( "TOPRIGHT", page:GetParent(), "TOPLEFT", -8, -55 )
    panel:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 },
    })
    panel:SetBackdropColor( 0.15, 0.15, 0.15, 0.95 )
    panel.userClosed = false

    local close = CreateFrame( "Button", nil, panel, "UIPanelCloseButton" )
    close:SetPoint( "TOPRIGHT", panel, "TOPRIGHT", 2, 2 )
    close:SetScript( "OnClick", function()
        panel.userClosed = true
        panel:Hide()
    end )

    page:HookScript( "OnShow", function()
        if not panel.userClosed then panel:Show() end
    end )
    page:HookScript( "OnHide", function() panel:Hide() end )
    panel:Hide()

    local title = panel:CreateFontString( nil, "OVERLAY", "GameFontNormalLarge" )
    title:SetPoint( "TOPLEFT", panel, "TOPLEFT", 10, -10 )
    title:SetText( "Shopping List" )

    local vendorPanel = ns.Components:CreatePanel( panel )
    vendorPanel:SetPoint( "TOPLEFT", panel, "TOPLEFT", 5, -35 )
    vendorPanel:SetPoint( "TOPRIGHT", panel, "TOPRIGHT", -5, -35 )

    local gatherPanel = ns.Components:CreatePanel( panel )
    gatherPanel:SetPoint( "TOPLEFT", vendorPanel, "BOTTOMLEFT", 0, -5 )
    gatherPanel:SetPoint( "TOPRIGHT", vendorPanel, "BOTTOMRIGHT", 0, -5 )

    local craftPanel = ns.Components:CreatePanel( panel )
    craftPanel:SetPoint( "TOPLEFT", gatherPanel, "BOTTOMLEFT", 0, -5 )
    craftPanel:SetPoint( "TOPRIGHT", gatherPanel, "BOTTOMRIGHT", 0, -5 )

    local function ResizeShoppingSections( _, width, height )
        local available = math.max( ( height or panel:GetHeight() ) - 50, 3 )
        local third = available / 3
        vendorPanel:SetHeight( third )
        gatherPanel:SetHeight( third )
        craftPanel:SetHeight( third )
    end
    panel:HookScript( "OnSizeChanged", ResizeShoppingSections )
    ResizeShoppingSections( panel, panel:GetWidth(), panel:GetHeight() )

    page.shoppingPanel = panel
    page.vendorPanel = vendorPanel
    page.gatherPanel = gatherPanel
    page.craftPanel = craftPanel
    page.vendorShopping = CreateShoppingSection( vendorPanel, "Vendor" )
    page.gatherShopping = CreateShoppingSection( gatherPanel, "Auction / Gather" )
    page.craftShopping = CreateShoppingSection( craftPanel, "Craftable" )
end

local function CurrentCharacterKey()
    if ns.Characters and type(ns.Characters._Char) == "function"
        and type(ns.Characters._CharKey) == "function" then
        local ok, character = pcall(ns.Characters._Char, ns.Characters)
        if ok and character then
            local keyOK, key = pcall(ns.Characters._CharKey, ns.Characters, character)
            if keyOK then return key end
        end
    end
    local name = UnitName("player")
    local realmID = GetRealmID and GetRealmID()
    if name and realmID then return name .. "-" .. tostring(realmID) end
end

local function InventoryStore()
    PLRDB = PLRDB or {}
    PLRDB.plannerInventory = PLRDB.plannerInventory or {}
    return PLRDB.plannerInventory
end

local function ScanCurrentInventory()
    local key = CurrentCharacterKey()
    if not key then return end
    local totals = {}
    local scanned = false
    if C_Container and type(C_Container.GetContainerNumSlots) == "function"
        and type(C_Container.GetContainerItemInfo) == "function" then
        for bag = 0, (NUM_BAG_SLOTS or 4) do
            local slots = C_Container.GetContainerNumSlots(bag) or 0
            for slot = 1, slots do
                local info = C_Container.GetContainerItemInfo(bag, slot)
                if info and type(info.itemID) == "number" then
                    totals[info.itemID] = (totals[info.itemID] or 0) + (info.stackCount or 1)
                end
            end
        end
        scanned = true
    elseif type(GetContainerNumSlots) == "function"
        and type(GetContainerItemID) == "function"
        and type(GetContainerItemInfo) == "function" then
        for bag = 0, (NUM_BAG_SLOTS or 4) do
            for slot = 1, (GetContainerNumSlots(bag) or 0) do
                local itemID = GetContainerItemID(bag, slot)
                if itemID then
                    local _, count = GetContainerItemInfo(bag, slot)
                    totals[itemID] = (totals[itemID] or 0) + (count or 1)
                end
            end
        end
        scanned = true
    end
    if scanned then InventoryStore()[key] = totals end
end

local function GetOwnedItemCount(itemID)
    if ns.Inventory then
        return ns.Inventory:GetOwned(itemID, Planner.selectedCharacter)
    end
    local selected = Planner.selectedCharacter
    local saved = selected and InventoryStore()[selected]
    return saved and (saved[itemID] or 0) or 0
end

local function GetRecipeReagents( recipeID )
    if not C_TradeSkillUI or not C_TradeSkillUI.GetRecipeSchematic then
        return nil
    end
    if reagentCache[recipeID] then return reagentCache[recipeID] end
    local ok, schematic = pcall( C_TradeSkillUI.GetRecipeSchematic, recipeID, false )
    if not ok or type( schematic ) ~= "table" then
        return nil
    end

    local slots = schematic.reagentSlotSchematics
    if type( slots ) ~= "table" then
        return nil
    end

    local reagents = {}
    for _, slot in ipairs( slots ) do
        local candidates = slot.reagents
        local required = slot.quantityRequired or 0
        local optional = Enum and Enum.CraftingReagentType and slot.reagentType == Enum.CraftingReagentType.Optional
        if not optional and required > 0 then
            if type( candidates ) ~= "table" or #candidates ~= 1 then
                return nil
            end
            local reagent = candidates[ 1 ]
            local itemID = reagent.itemID
            if not itemID and reagent.item then
                itemID = reagent.item.itemID
            end
            if not itemID then
                return nil
            end
            reagents[ itemID ] = ( reagents[ itemID ] or 0 ) + required
        end
    end
    reagentCache[recipeID] = reagents
    return reagents
end

-- Auctionator integration: last scanned prices, expressed in copper.
-- No auction-house window is needed to read its existing price database.
local AUCTIONATOR_CALLER = "ProfessionLevelingRoute"
local function GetAuctionatorAPI()
    local addon = _G.Auctionator
    local api = addon and addon.API and addon.API.v1
    if api and type(api.GetAuctionPriceByItemID) == "function" then
        return api
    end
end

local function GetReagentUnitPrice(itemID)
    local api = GetAuctionatorAPI()
    if not api then return nil end
    local ok, price = pcall(api.GetAuctionPriceByItemID, AUCTIONATOR_CALLER, itemID)
    if ok and type(price) == "number" and price >= 0 then
        return price
    end
    return nil
end

local function GetRouteCraftCost(recipeID, crafts)
    local reagents = GetRecipeReagents(recipeID)
    if not reagents or not next(reagents) then return nil, nil, "reagents" end
    local total, breakdown, missing = 0, {}, false
    for itemID, perCraft in pairs(reagents) do
        local count = perCraft * (tonumber(crafts) or 0)
        local price = GetReagentUnitPrice(itemID)
        breakdown[#breakdown + 1] = {itemID = itemID, count = count, price = price}
        if price == nil then
            missing = true
        else
            total = total + price * count
        end
    end
    table.sort(breakdown, function(a, b) return a.itemID < b.itemID end)
    return missing and nil or total, breakdown, missing and "prices" or nil
end

local function FormatRouteCost(copper)
    if copper == nil then return "—" end
    if copper >= 1000000 then return string.format("%.1fg", copper / 10000) end
    if copper >= 10000 then return string.format("%.2fg", copper / 10000) end
    if copper >= 100 then return string.format("%.1fs", copper / 100) end
    return tostring(math.floor(copper + 0.5)) .. "c"
end

local function GetSafeItemName( itemID )
    local name
    if C_Item and type( C_Item.GetItemNameByID ) == "function" then
        name = C_Item.GetItemNameByID( itemID )
    end
    if not name and C_Item and type( C_Item.GetItemInfo ) == "function" then
        name = C_Item.GetItemInfo( itemID )
    end
    if not name and type( GetItemInfo ) == "function" then
        name = GetItemInfo( itemID )
    end
    if type( name ) == "string" and name ~= "" then
        return name
    end
    return "Item " .. tostring( itemID )
end

local function SetShoppingLines( section, items, category )
    for _, row in ipairs( section.lines ) do
        row:Hide()
    end

    local function FormatAmount(value)
        value = math.max(0, math.floor(tonumber(value) or 0))
        return tostring(math.min(value, 999))
    end

    local function AddRow(index, itemName, amountText, color, item)
        local row = section.lines[index]
        if not row then
            row = CreateFrame("Button", nil, section.content)
            row:EnableMouse(true)
            row.nameText = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            row.nameText:SetPoint("LEFT", row, "LEFT", 0, 0)
            row.nameText:SetWidth(128)
            row.nameText:SetJustifyH("LEFT")
            row.nameText:SetWordWrap(false)

            row.amountText = row:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            row.amountText:SetPoint("RIGHT", row, "RIGHT", 0, 0)
            row.amountText:SetWidth(70)
            row.amountText:SetJustifyH("RIGHT")
            row.amountText:SetWordWrap(false)
            section.lines[index] = row
        end

        row:ClearAllPoints()
        row:SetPoint("TOPLEFT", section.content, "TOPLEFT", 0, -(index - 1) * 22)
        row:SetSize(208, 21)
        row.nameText:SetText(itemName)
        row.amountText:SetText(amountText or "")

        local r, g, b = 1, 0.82, 0
        if color == "green" then r, g, b = 0.3, 1, 0.3 end
        row.nameText:SetTextColor(r, g, b)
        row.amountText:SetTextColor(r, g, b)

        row:SetScript("OnEnter", nil)
        row:SetScript("OnLeave", nil)
        row:SetScript("OnClick", nil)
        if item and ns.Acquisition then
            row:SetScript("OnEnter", function(self)
                ns.Acquisition:ShowMaterialTooltip(
                    self, item.id, category, item.owned, item.required)
            end)
            row:SetScript("OnLeave", function() GameTooltip:Hide() end)
            row:SetScript("OnClick", function()
                ns.Acquisition:LinkItem(item.id)
            end)
        end
        row:Show()
    end

    if #items == 0 then
        AddRow(1, "No materials listed", "", "normal")
    else
        for index, item in ipairs(items) do
            local owned = GetOwnedItemCount(item.id) or 0
            local required = item.required or 0
            local color = owned >= required and "green" or "normal"
            AddRow(index, GetSafeItemName(item.id),
                FormatAmount(owned) .. "/" .. FormatAmount(required),
                color, {id = item.id, owned = owned, required = required})
        end
    end
    section.content:SetHeight(math.max(#items, 1) * 22)
end

RefreshShoppingList = function()
    if not Planner.page or not Planner.page.vendorShopping then
        return
    end
    local totals = {}
    for _, step in ipairs(GetDisplayedRouteSteps()) do
        if GetStepSelection(step.groupKey) == step.recipeID then
            local reagents = GetRecipeReagents(step.recipeID)
            if reagents then
                for itemID, amount in pairs(reagents) do
                    totals[itemID] = (totals[itemID] or 0) + amount * step.quantity
                end
            end
        end
    end
    local vendor, gather, craftItems = {}, {}, {}
    local shopping = totals
    if ns.CraftingDependencies then
        local recipes = Planner.selectedProfessionName and ns.RecipeData
            and ns.RecipeData[Planner.selectedProfessionName]
        local index = ns.CraftingDependencies:BuildIndex(recipes, IsRecipeIncluded)
        local missing, crafts = ns.CraftingDependencies:Resolve(totals, index, GetOwnedItemCount)
        shopping = {}
        for itemID, required in pairs(totals) do
            if not crafts[itemID] then shopping[itemID] = required end
        end
        for itemID, remaining in pairs(missing) do
            if not shopping[itemID] then
                shopping[itemID] = GetOwnedItemCount(itemID) + remaining
            elseif shopping[itemID] < GetOwnedItemCount(itemID) + remaining then
                shopping[itemID] = GetOwnedItemCount(itemID) + remaining
            end
        end
        for itemID, produced in pairs(crafts) do
            craftItems[#craftItems + 1] = { id = itemID, required = (totals[itemID] or 0) > 0
                and totals[itemID] or produced }
        end
    end
    for itemID, required in pairs( shopping ) do
        if itemID ~= 2934 then -- Ruined Leather Scraps: never suggest shopping for these
        local item = { id = itemID, required = required, unknown = false }
        if VendorReagents[ itemID ] then
            table.insert( vendor, item )
        else
            item.unknown = true
            table.insert( gather, item )
        end
        end
    end
    local function SortItems( a, b )
        local nameA = GetSafeItemName( a.id )
        local nameB = GetSafeItemName( b.id )
        if nameA == nameB then
            return a.id < b.id
        end
        return nameA < nameB
    end
    table.sort( vendor, SortItems )
    table.sort( gather, SortItems )
    table.sort( craftItems, SortItems )
    if Planner.page.craftShopping then SetShoppingLines( Planner.page.craftShopping, craftItems, "craft" ) end
    SetShoppingLines( Planner.page.vendorShopping, vendor, "vendor" )
    SetShoppingLines( Planner.page.gatherShopping, gather, "gather" )
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
    if Planner.page.routeRows then
        for _, row in ipairs( Planner.page.routeRows ) do
            row:Hide()
                row:SetParent( nil )
            end
        Planner.page.routeRows = {}
    end
    if Planner.page.routeTitle then
        Planner.page.routeTitle:SetText( "Select a Profession" )
    end
    RefreshShoppingList()
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
                character.name
            rootDescription:CreateRadio(
                text,
                function()
                    return Planner.selectedCharacter == characterKey
                end,
                function()
                    Planner.selectedCharacter = characterKey
                    Planner.selectedProfession = nil
                    Planner.selectedProfessionName = nil
                    Planner.fromRank = nil
                    Planner.toRank = nil
                    dropdown:SetDefaultText( character.name )
                    ResetProfessionSelection()
                    SavePlannerSettings()
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
    local recipeIDs = GetSelectedRecipeIDs()
    local route = BuildLevelingRoute()

    Planner.page.routeTitle:SetText(
        profession.name ..
        " (" ..
        #route ..
        " / " ..
        #recipeIDs ..
        " Recipes)"
    )
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
                    Planner.selectedProfessionName = profession.name
                    dropdown:SetDefaultText( profession.name )
                    SavePlannerSettings()
                    UpdateFromRankSlider()
                    UpdateToRankSlider()
                    UpdateRouteTitle()
                    RefreshRouteRows()
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
        if Planner.selectedProfession then SavePlannerSettings() end

        if Planner.selectedProfession then
            UpdateRouteTitle()
            RefreshRouteRows()
        end
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
        if Planner.selectedProfession then SavePlannerSettings() end

        if Planner.selectedProfession then
            UpdateRouteTitle()
            RefreshRouteRows()
        end
    end )
    slider.valueText = valueText
    return slider
end

local function CreateControlsPanel( page )

    local panel = ns.Components:CreatePanel( page )
    panel:SetPoint( "TOPLEFT", page, "TOPLEFT", 10, -10 )
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

local function GetSelectedProfessionRecipes()
    if not Planner.selectedProfessionName then
        return
    end
    if not ns.RecipeData then
        return
    end
    return ns.RecipeData[ Planner.selectedProfessionName ]
end

GetSelectedRecipeIDs = function()
    local professionRecipes = GetSelectedProfessionRecipes()
    if not professionRecipes then
        return {}
    end
    local recipeIDs = {}
    for recipeID in pairs( professionRecipes ) do
        table.insert( recipeIDs, recipeID )
    end
    table.sort( recipeIDs, function( a, b )
        local recipeA = professionRecipes[ a ]
        local recipeB = professionRecipes[ b ]

        local rankA =
            recipeA and
            recipeA.difficulty and
            recipeA.difficulty.learnedAt or 0

        local rankB =
            recipeB and
            recipeB.difficulty and
            recipeB.difficulty.learnedAt or 0

        if rankA ~= rankB then
            return rankA < rankB
        end

        return a < b
    end )
    return recipeIDs
end

RefreshRecipeSelectionMenu = function()
    if not Planner.page or not Planner.page.recipeSelectionDropdown then return end
    local dropdown = Planner.page.recipeSelectionDropdown
    local recipes = GetSelectedProfessionRecipes()
    if not recipes then
        dropdown:SetDefaultText( "Choose recipes" )
        return
    end
    local ids = GetSelectedRecipeIDs()
    local included = 0
    for _, recipeID in ipairs( ids ) do
        if IsRecipeIncluded( recipeID ) then included = included + 1 end
    end
    dropdown:SetDefaultText( "Recipes " .. included .. "/" .. #ids )
end

local function CreateRecipeSelectionDropdown( parent )
    local dropdown = CreateFrame( "DropdownButton", nil, parent, "WowStyle1DropdownTemplate" )
    dropdown:SetAllPoints( parent )
    dropdown:SetupMenu( function( _, root )
        local recipes = GetSelectedProfessionRecipes()
        if not recipes then
            root:CreateTitle( "Select a profession first" )
            return
        end
        local ids = GetSelectedRecipeIDs()
        root:CreateTitle( "Route recipe eligibility (all recipes by default)" )
        local function ApplyBulkSelection( included )
            for _, id in ipairs( ids ) do
                SetRecipeIncluded( id, included )
            end
            if C_Timer and C_Timer.After then
                C_Timer.After( 0, function()
                    if not Planner.page then return end
                    RefreshRecipeSelectionMenu()
                    RefreshRouteRows()
                end )
            else
                RefreshRecipeSelectionMenu()
                RefreshRouteRows()
            end
        end
        root:CreateButton( "Select all", function()
            ApplyBulkSelection( true )
        end )
        root:CreateButton( "Select none", function()
            ApplyBulkSelection( false )
        end )
        local bands = {}
        for _, recipeID in ipairs( ids ) do
            local recipe = recipes[ recipeID ]
            local learnedAt = recipe and recipe.difficulty and recipe.difficulty.learnedAt or 0
            local bandStart = math.floor( math.max( 1, learnedAt ) / 50 ) * 50
            if learnedAt > 0 and learnedAt % 50 == 0 then bandStart = learnedAt end
            if bandStart == 0 then bandStart = 1 end
            local group = bands[ bandStart ]
            if not group then group = {}; bands[ bandStart ] = group end
            table.insert( group, recipeID )
        end
        local starts = {}
        for start in pairs( bands ) do table.insert( starts, start ) end
        table.sort( starts )
        for _, start in ipairs( starts ) do
            local group = bands[ start ]
            local sub = root:CreateButton( "Rank " .. start .. "+ (" .. #group .. ")" )
            for _, recipeID in ipairs( group ) do
                local id = recipeID
                local name = "Recipe " .. id
                if C_TradeSkillUI and C_TradeSkillUI.GetRecipeInfo then
                    local ok, info = pcall( C_TradeSkillUI.GetRecipeInfo, id )
                    if ok and info and info.name then name = info.name end
                end
                sub:CreateCheckbox( name .. " (" .. id .. ")",
                    function() return IsRecipeIncluded( id ) end,
                    function()
                        SetRecipeIncluded( id, not IsRecipeIncluded( id ) )
                        if C_Timer and C_Timer.After then
                            C_Timer.After( 0, function()
                                if not Planner.page then return end
                                RefreshRecipeSelectionMenu()
                                RefreshRouteRows()
                            end )
                        else
                            RefreshRecipeSelectionMenu()
                            RefreshRouteRows()
                        end
                    end )
            end
        end
    end )
    dropdown:SetDefaultText( "Choose recipes" )
    return dropdown
end

local function GetRecipeRouteRange( recipe )
    if not recipe or not recipe.difficulty then
        return
    end
    local learnedAt = recipe.difficulty.learnedAt
    local green = recipe.difficulty.green
    if not learnedAt or not green then
        return
    end
    local startRank = math.max(
        learnedAt,
        Planner.fromRank or learnedAt
    )
    local endRank = math.min(
        green,
        Planner.toRank or green
    )
    if startRank >= endRank then
        return
    end
    return startRank, endRank
end

local function GetRecipesForRank( rank )
    local professionRecipes = GetSelectedProfessionRecipes()
    local recipeIDs = GetRouteRecipeIDs()
    local availableRecipes = {}
    if not professionRecipes then
        return availableRecipes
    end
    for _, recipeID in ipairs( recipeIDs ) do
        local recipe = professionRecipes[ recipeID ]
        local startRank, endRank = GetRecipeRouteRange( recipe )
        if startRank and endRank and rank >= startRank and rank < endRank then
            table.insert( availableRecipes, recipeID )
        end
    end
    return availableRecipes
end

local function GetRecipeDifficultyScore( recipe, rank )
    if not recipe or not recipe.difficulty then
        return 0
    end
    local orange = recipe.difficulty.orange
    local yellow = recipe.difficulty.yellow
    local green = recipe.difficulty.green
    if not orange or not yellow or not green then
        return 0
    end
    if rank < orange then
        return 3
    end
    if rank < yellow then
        return 2
    end
    if rank < green then
        return 1
    end
    return 0
end

local function GetBestRecipeForRank( rank )
    local professionRecipes = GetSelectedProfessionRecipes()
    if not professionRecipes then return nil end
    local candidates = {}
    for _, recipeID in ipairs(GetRecipesForRank(rank)) do
        local recipe = professionRecipes[recipeID]
        local _, endRank = GetRecipeRouteRange(recipe)
        if endRank and endRank > rank then
            local quantity = GetCraftQuantity(recipe, rank, endRank)
            if quantity and quantity > 0 then
                candidates[#candidates + 1] = {
                    id = recipeID, recipe = recipe, endRank = endRank,
                    quantity = quantity,
                    difficulty = GetRecipeDifficultyScore(recipe, rank),
                }
            end
        end
    end
    if #candidates == 0 then return nil end
    if ns.RouteOptimizer then
        return ns.RouteOptimizer:Choose(candidates, {
            rank = rank, character = Planner.selectedCharacter,
            profession = Planner.selectedProfession,
            owned = GetOwnedItemCount, reagents = GetRecipeReagents,
        })
    end
    -- Compatibility fallback if the optimizer module is missing.
    table.sort(candidates, function(a,b)
        if a.difficulty ~= b.difficulty then return a.difficulty > b.difficulty end
        if a.quantity ~= b.quantity then return a.quantity < b.quantity end
        return a.id < b.id
    end)
    return candidates[1].id
end

GetCraftQuantity = function( recipe, fromRank, toRank )
    local difficulty = recipe and recipe.difficulty
    if not difficulty or not fromRank or not toRank then return 0 end

    local orange = tonumber(difficulty.orange)
    local yellow = tonumber(difficulty.yellow)
    local green = tonumber(difficulty.green)
    if not orange or not yellow or not green then return 0 end

    local quantity = 0
    for rank = fromRank, toRank - 1 do
        if rank < orange then
            quantity = quantity + 1
        elseif rank < yellow then
            quantity = quantity + 2
        elseif rank < green then
            quantity = quantity + 4
        else
            return nil
        end
    end
    return quantity
end

BuildLevelingRoute = function()
    local professionRecipes = GetSelectedProfessionRecipes()
    local route = {}
    if not professionRecipes then
        return route
    end
    local currentRank = Planner.fromRank
    local targetRank = Planner.toRank
    if not currentRank or not targetRank or currentRank >= targetRank then
        return route
    end
    while currentRank < targetRank do
        local recipeID = GetBestRecipeForRank( currentRank )
        if not recipeID then
            break
        end
        local recipe = professionRecipes[ recipeID ]
        local _, endRank = GetRecipeRouteRange( recipe )

        if not endRank or endRank <= currentRank then
            break
        end

        for _, candidateRecipeID in ipairs( GetRouteRecipeIDs() ) do
            local candidateRecipe = professionRecipes[ candidateRecipeID ]
            local learnedAt =
                candidateRecipe and
                candidateRecipe.difficulty and
                candidateRecipe.difficulty.learnedAt

            if
                learnedAt and
                learnedAt > currentRank and
                learnedAt < endRank
            then
                endRank = learnedAt
            end
        end
        local previousStep = route[ #route ]

        if previousStep and previousStep.recipeID == recipeID then
            previousStep.toRank = endRank
            previousStep.skillGains =
                previousStep.toRank - previousStep.fromRank
            previousStep.quantity = GetCraftQuantity(
                recipe,
                previousStep.fromRank,
                previousStep.toRank
            )
        else
            table.insert( route, {
                recipeID = recipeID,
                fromRank = currentRank,
                toRank = endRank,
                skillGains = endRank - currentRank,
                quantity = GetCraftQuantity(
                    recipe,
                    currentRank,
                    endRank
                ),
            } )
        end

        currentRank = endRank
    end
    return route
end

GetRouteRecipeIDs = function()
    local professionRecipes = GetSelectedProfessionRecipes()
    local recipeIDs = GetSelectedRecipeIDs()
    if not professionRecipes then
        return {}
    end
    local fromRank = Planner.fromRank or 1
    local toRank = Planner.toRank or fromRank
    local routeRecipeIDs = {}
    for _, recipeID in ipairs( recipeIDs ) do
        local recipe = professionRecipes[ recipeID ]
        local difficulty = recipe and recipe.difficulty
        local learnedAt = difficulty and difficulty.learnedAt
        local green = difficulty and difficulty.green

        if IsRecipeIncluded( recipeID ) and learnedAt and green then
            local startsBeforeEnd = learnedAt <= toRank
            local remainsUseful = green > fromRank

            if startsBeforeEnd and remainsUseful then
                table.insert( routeRecipeIDs, recipeID )
            end
        end
    end
    return routeRecipeIDs
end

local function GetSelectedRecipeKnown( recipeID )
    if not Planner.selectedCharacter or not Planner.selectedProfession then
        return nil
    end

    local character = ns.Characters:_SmashNGrab()[ Planner.selectedCharacter ]
    local knowledge = character and character.recipeKnowledge
    local professionKnowledge = knowledge and knowledge[ Planner.selectedProfession ]
    local recipeState = professionKnowledge and professionKnowledge[ recipeID ]

    if type( recipeState ) == "table" then
        return recipeState.learned == true
    elseif type( recipeState ) == "boolean" then
        return recipeState
    end

    if professionKnowledge then
        return false
    end

    return nil
end

local function GetRecipeAcquisitionText( recipe )
    local sources = {}
    local seen = {}
    local function AddSource( text )
        if text and text ~= "" and not seen[ text ] then
            seen[ text ] = true
            table.insert( sources, text )
        end
    end

    for _, sourceData in ipairs( recipe.sources or {} ) do
        local sourceType = sourceData.type
        if sourceType then
            local normalized = type(sourceType) == "string" and sourceType:lower() or ""
            AddSource( normalized:match("^unknown") and "Drop"
                or (normalized:sub(1, 1):upper() .. normalized:sub(2)) )
        end
    end

    for _, recipeItem in ipairs( recipe.recipeItems or {} ) do
        for _, itemSource in ipairs( recipeItem.sources or {} ) do
            if itemSource.type == "vendor" and itemSource.npcName then
                AddSource( "Vendor: " .. itemSource.npcName )
            end
        end
    end

    return #sources > 0 and table.concat( sources, " / " ) or "Drop"
end

local function StepSelections()
    PLRDB = PLRDB or {}
    PLRDB.plannerStepSelections = PLRDB.plannerStepSelections or {}
    return PLRDB.plannerStepSelections
end

local function StepKey(step)
    return table.concat({tostring(Planner.selectedCharacter),
        tostring(Planner.selectedProfession), tostring(Planner.fromRank),
        tostring(Planner.toRank), tostring(step.fromRank),
        tostring(step.toRank), tostring(step.recipeID)}, ":")
end

GetStepSelection = function(key)
    local value = StepSelections()[key]
    if value == false then return false end
    return tonumber(value)
end

GetDisplayedRouteSteps = function()
    local route = BuildLevelingRoute()
    local recipes = GetSelectedProfessionRecipes()
    local displayed = {}
    if not recipes then return displayed, route end
    local ids = GetRouteRecipeIDs()
    for _, original in ipairs(route) do
        local key = StepKey(original)
        local choices = {}
        local function AddChoice(id, alternative)
            local recipe = recipes[id]
            local qty = GetCraftQuantity(recipe, original.fromRank, original.toRank)
            if not qty or qty <= 0 then return end
            choices[#choices + 1] = {
                recipeID = id, fromRank = original.fromRank,
                toRank = original.toRank, quantity = qty,
                groupKey = key, alternative = alternative,
                known = GetSelectedRecipeKnown(id),
            }
        end
        AddChoice(original.recipeID, false)
        if GetSelectedRecipeKnown(original.recipeID) ~= true then
            local bestID, bestQty
            for _, id in ipairs(ids) do
                if id ~= original.recipeID and GetSelectedRecipeKnown(id) == true then
                    local recipe = recipes[id]
                    local difficulty = recipe and recipe.difficulty
                    if difficulty and difficulty.learnedAt
                        and difficulty.learnedAt <= original.fromRank
                        and difficulty.green and difficulty.green >= original.toRank then
                        local qty = GetCraftQuantity(recipe, original.fromRank, original.toRank)
                        if qty and qty > 0 and
                            (not bestQty or qty < bestQty or
                            (qty == bestQty and id < bestID)) then
                            bestID, bestQty = id, qty
                        end
                    end
                end
            end
            if bestID then AddChoice(bestID, true) end
        end
        table.sort(choices, function(a,b)
            if a.alternative ~= b.alternative then return not a.alternative end
            if a.quantity ~= b.quantity then return a.quantity < b.quantity end
            return a.recipeID < b.recipeID
        end)
        local selected = GetStepSelection(key)
        if selected == nil then
            if choices[1] and choices[1].known == true then
                selected = choices[1].recipeID
            else
                for _, choice in ipairs(choices) do
                    if choice.known == true then selected = choice.recipeID; break end
                end
            end
        end
        local valid = false
        for _, choice in ipairs(choices) do
            if choice.recipeID == selected then valid = true end
        end
        if not valid then selected = false end
        for _, choice in ipairs(choices) do
            choice.selected = selected == choice.recipeID
            displayed[#displayed + 1] = choice
        end
    end
    return displayed, route
end

local function ClearRouteRows()
    if not Planner.page or not Planner.page.routeRows then
        return
    end
    for _, row in ipairs( Planner.page.routeRows ) do
        row:Hide()
        row:SetParent( nil )
    end
    Planner.page.routeRows = {}
end

RefreshRouteRows = function()
    if not Planner.page or not Planner.page.routePanel then
        return
    end
    ClearRouteRows()
    RefreshRecipeSelectionMenu()

    local previousScroll = Planner.page.routeScrollFrame:GetVerticalScroll()

    local professionRecipes = GetSelectedProfessionRecipes()
    local displayed, route = GetDisplayedRouteSteps()
    local signatureParts = {}
    for i, step in ipairs(displayed) do
        signatureParts[i] = table.concat({step.recipeID, step.fromRank,
            step.toRank, step.quantity, tostring(step.selected)}, ":")
    end
    Planner.inventoryRouteSignature = table.concat(signatureParts, "|")

    if not professionRecipes then
        RefreshShoppingList()
        return
    end

    Planner.page.routeScrollChild:SetHeight(math.max(#displayed * 28, 1))
    if Planner.page.routeTitle then
        Planner.page.routeTitle:SetText(Planner.selectedProfessionName .. " (" .. #route .. " route steps)")
    end

    for index, step in ipairs(displayed) do
        local row = CreateRouteRow(Planner.page.routeScrollChild,
            step.recipeID, professionRecipes[step.recipeID], index, step)
        table.insert(Planner.page.routeRows, row)
    end
    Planner.page.routeScrollFrame:SetVerticalScroll(previousScroll or 0)
    RefreshShoppingList()
end

CreateRouteRow = function( parent, recipeID, recipe, index, routeStep )

    local row = CreateFrame( "Frame", nil, parent )
    row:SetPoint( "TOPLEFT", parent, "TOPLEFT", 0, -( ( index - 1 ) * 28 ) )
    row:SetPoint( "TOPRIGHT", parent, "TOPRIGHT", -5, -( ( index - 1 ) * 28 ) )
    row:SetHeight( 26 )

    local track = CreateFrame( "CheckButton", nil, row, "UICheckButtonTemplate" )
    track:SetPoint( "LEFT", row, "LEFT", RouteColumns.track, 0 )
    track:SetSize( 24, 24 )

    track:SetChecked(routeStep and routeStep.selected or false)
    track:SetScript("OnClick", function(self)
        if not routeStep then return end
        StepSelections()[routeStep.groupKey] = self:GetChecked() and recipeID or false
        RefreshRouteRows()
    end)

    local rank = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    rank:SetPoint( "LEFT", row, "LEFT", RouteColumns.rank, 0 )

    if routeStep then
        rank:SetText(
            routeStep.fromRank ..
            " - " ..
            routeStep.toRank
        )
    else
        rank:SetText( "-" )
    end

    local quantity = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    quantity:SetPoint( "LEFT", row, "LEFT", RouteColumns.quantity, 0 )

    if routeStep then
        quantity:SetText( routeStep.quantity )
    else
        quantity:SetText( "-" )
    end

    local cost = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    cost:SetPoint( "LEFT", row, "LEFT", RouteColumns.cost, 0 )
    local totalCost, costBreakdown, missingCostReason = GetRouteCraftCost(
        recipeID, routeStep and routeStep.quantity or 0)
    cost:SetText(FormatRouteCost(totalCost))
    cost:SetWidth(RouteColumns.recipe - RouteColumns.cost - 18)
    cost:SetJustifyH("LEFT")
    local costHover = CreateFrame("Frame", nil, row)
    costHover:SetPoint("TOPLEFT", cost, "TOPLEFT", -2, 4)
    costHover:SetPoint("BOTTOMRIGHT", cost, "BOTTOMRIGHT", 2, -4)
    costHover:EnableMouse(true)
    costHover:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine("Estimated reagent cost", 1, .82, 0)
        if not GetAuctionatorAPI() then
            GameTooltip:AddLine("Auctionator is not available", 1, .5, .5)
        elseif missingCostReason == "reagents" then
            GameTooltip:AddLine("Recipe reagent data unavailable", 1, .5, .5)
        else
            for _, item in ipairs(costBreakdown or {}) do
                local itemPrice = item.price and FormatRouteCost(item.price * item.count) or "No scanned price"
                GameTooltip:AddDoubleLine(
                    tostring(item.count) .. "x " .. GetSafeItemName(item.itemID),
                    itemPrice, 1, 1, 1, 1, .82, 0)
            end
            if missingCostReason == "prices" then
                GameTooltip:AddLine("Scan missing items with Auctionator for a complete total", 1, .5, .5, true)
            else
                GameTooltip:AddDoubleLine("Total", FormatRouteCost(totalCost), 1, .82, 0, 1, 1, 1)
            end
            GameTooltip:AddLine("Uses last scanned auction prices; ignores owned stock", .7, .7, .7, true)
        end
        GameTooltip:Show()
    end)
    costHover:SetScript("OnLeave", function() GameTooltip:Hide() end)

    local recipeInfo
    if C_TradeSkillUI and type( C_TradeSkillUI.GetRecipeInfo ) == "function" then
        local ok, result = pcall( C_TradeSkillUI.GetRecipeInfo, recipeID )
        if ok then recipeInfo = result end
    end
    local recipeName = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    recipeName:SetPoint( "LEFT", row, "LEFT", RouteColumns.recipe, 0 )

    if recipeInfo and recipeInfo.name then
        recipeName:SetText( recipeInfo.name )
    else
        recipeName:SetText( "Recipe " .. recipeID )
    end

    local recipeHover = CreateFrame("Frame", nil, row)
    recipeHover:SetPoint("TOPLEFT", recipeName, "TOPLEFT")
    recipeHover:SetPoint("BOTTOMRIGHT", recipeName, "BOTTOMRIGHT")
    recipeHover:EnableMouse(true)
    recipeHover:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:AddLine(recipeName:GetText() or ("Recipe " .. recipeID), 1, .82, 0)
        if routeStep then
            GameTooltip:AddLine("Estimated crafts: " .. tostring(routeStep.quantity), 1, 1, 1)
            GameTooltip:AddLine("Skill range: " .. tostring(routeStep.fromRank) .. " - " .. tostring(routeStep.toRank), .8, .8, .8)
        end
        if ns.Acquisition then
            for _, sourceLine in ipairs(ns.Acquisition:GetRecipeSources(recipe)) do
                GameTooltip:AddLine(sourceLine, 1, 1, 1, true)
            end
        end
        GameTooltip:Show()
    end)
    recipeHover:SetScript("OnLeave", function() GameTooltip:Hide() end)

    local recipeKnown = GetSelectedRecipeKnown( recipeID )
    if routeStep and routeStep.alternative then
        recipeName:SetPoint("LEFT", row, "LEFT", RouteColumns.recipe + 30, 0)
        recipeName:SetText("  " .. (recipeName:GetText() or ""))
    elseif recipeKnown == false then
        recipeName:SetPoint("LEFT", row, "LEFT", RouteColumns.recipe + 18, 0)
    end
    if recipeKnown == false then
        recipeName:SetTextColor(0.67, 0.55, 0.40)
        recipeName:SetAlpha(0.60)
    elseif routeStep and routeStep.alternative then
        recipeName:SetTextColor(0.95, 0.82, 0.42)
    else
        recipeName:SetTextColor(HIGHLIGHT_FONT_COLOR:GetRGB())
    end

    local acquisitionStatus = CreateFrame( "Frame", nil, row )
    acquisitionStatus:SetSize( 16, 16 )
    acquisitionStatus:SetPoint( "LEFT", row, "LEFT", RouteColumns.recipe, 0 )
    acquisitionStatus:EnableMouse( true )
    local statusIcon = acquisitionStatus:CreateTexture( nil, "ARTWORK" )
    statusIcon:SetAllPoints()
    if recipeKnown == false then
        statusIcon:SetTexture( "Interface\\RaidFrame\\ReadyCheck-NotReady" )
    elseif recipeKnown == nil then
        acquisitionStatus:Hide() -- No misleading question mark when knowledge is unavailable
    else
        acquisitionStatus:Hide()
    end
    acquisitionStatus:SetScript( "OnEnter", function( self )
        if ns.Acquisition then
            ns.Acquisition:ShowRecipeTooltip(self, recipe, recipeKnown == false)
        else
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:AddLine(GetRecipeAcquisitionText(recipe), 1, 1, 1, true)
            GameTooltip:Show()
        end
    end )
    acquisitionStatus:SetScript( "OnLeave", function() GameTooltip:Hide() end )

    local source = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    source:SetPoint( "LEFT", row, "LEFT", RouteColumns.source, 0 )
    source:SetWidth( 110 )
    local sourceData = recipe.sources and recipe.sources[ 1 ]
    local sourceText = "Drop"

    if sourceData and type(sourceData.type) == "string" then
        local sourceType = sourceData.type:lower()
        if not sourceType:match("^unknown") and sourceType ~= "" then
            sourceText = sourceType:sub(1, 1):upper() .. sourceType:sub(2)
        end
    end

    if sourceData and sourceData.type == "vendor" and recipe.recipeItems then
        for _, recipeItem in ipairs( recipe.recipeItems ) do
            for _, itemSource in ipairs( recipeItem.sources or {} ) do
                if itemSource.type == "vendor" and itemSource.npcName then
                    sourceText = "Vendor: " .. itemSource.npcName
                    break
                end
            end

            if string.sub( sourceText, 1, 8 ) == "Vendor: " then
                break
            end
        end
    end
    source:SetText( sourceText )
    source:EnableMouse( false )
    local sourceTooltip = CreateFrame( "Frame", nil, row )
    sourceTooltip:SetPoint( "TOPLEFT", source, "TOPLEFT" )
    sourceTooltip:SetPoint( "BOTTOMRIGHT", source, "BOTTOMRIGHT" )
    sourceTooltip:EnableMouse( true )
    sourceTooltip:SetScript( "OnEnter", function( self )
        if ns.Acquisition then
            ns.Acquisition:ShowRecipeTooltip(self, recipe, recipeKnown == false)
        else
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:AddLine(GetRecipeAcquisitionText(recipe), 1, 1, 1, true)
            GameTooltip:Show()
        end
    end )
    sourceTooltip:SetScript( "OnLeave", function() GameTooltip:Hide() end )
    row.recipeID = recipeID
    row.recipe = recipe
    row.track = track
    return row
end

local function CreateRoutePanel( page )
    local title = page:CreateFontString( nil, "OVERLAY", "GameFontNormalLarge" )
    title:SetPoint( "TOPLEFT", page.plannerControls, "BOTTOMLEFT", 0, -10 )
    title:SetText( "Select a Profession" )
    title:SetWidth( 290 )
    title:SetJustifyH( "LEFT" )
    local pickerHost = CreateFrame( "Frame", nil, page )
    pickerHost:SetSize( 190, 27 )
    pickerHost:SetPoint( "TOPRIGHT", page.plannerControls, "BOTTOMRIGHT", 0, -5 )
    page.recipeSelectionDropdown = CreateRecipeSelectionDropdown( pickerHost )
    local shoppingToggle = CreateFrame( "Button", nil, page, "UIPanelButtonTemplate" )
    shoppingToggle:SetSize( 110, 25 )
    shoppingToggle:SetPoint( "RIGHT", pickerHost, "LEFT", -8, 0 )
    shoppingToggle:SetText( "Shopping List" )
    shoppingToggle:SetScript( "OnClick", function()
        local shopping = page.shoppingPanel
        if not shopping then return end
        if shopping:IsShown() then
            shopping.userClosed = true
            shopping:Hide()
        else
            shopping.userClosed = false
            shopping:Show()
        end
    end )
    page.shoppingToggle = shoppingToggle


    local panel = ns.Components:CreatePanel( page )
    panel:SetPoint( "TOPLEFT", title, "BOTTOMLEFT", 0, -8 )
    panel:SetPoint( "BOTTOMRIGHT", page, "BOTTOMRIGHT", -10, 10 )

    local scrollFrame = CreateFrame( "ScrollFrame", nil, panel, "UIPanelScrollFrameTemplate" )
    scrollFrame:SetPoint( "TOPLEFT", panel, "TOPLEFT", 5, -30 )
    scrollFrame:SetPoint( "BOTTOMRIGHT", panel, "BOTTOMRIGHT", -25, 5 )

    local scrollChild = CreateFrame( "Frame", nil, scrollFrame )
    scrollChild:SetSize( 1, 1 )

    scrollFrame:SetScrollChild( scrollChild )

    local track = panel:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    track:SetPoint( "TOPLEFT", panel, "TOPLEFT", RouteColumns.track, -10 )
    track:SetText( "Shop" )

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
    source:SetWidth( 110 )
    source:SetText( "Source" )
    page.routeRows = {}

    local professionRecipes = GetSelectedProfessionRecipes()
    local routeRecipeIDs = GetRouteRecipeIDs()
    scrollChild:SetHeight(
    math.max( #routeRecipeIDs * 28, 1 )
    )
    if professionRecipes then
        for index, recipeID in ipairs( routeRecipeIDs ) do
            local recipe = professionRecipes[ recipeID ]
            local row = CreateRouteRow( scrollChild, recipeID, recipe, index )
            table.insert( page.routeRows, row )
        end
    end
    page.routeTitle = title
    page.routePanel = panel
    page.routeScrollFrame = scrollFrame
    page.routeScrollChild = scrollChild
end

function Planner:Create( page )
    self.page = page
    CreateShoppingPanel( page )
    CreateControlsPanel( page )
    CreateRoutePanel( page )
    local schematicEvents = CreateFrame("Frame")
    schematicEvents:RegisterEvent("TRADE_SKILL_LIST_UPDATE")
    schematicEvents:SetScript("OnEvent", ClearReagentCache)
    page.plannerSchematicEvents = schematicEvents
    local settings = PlannerSettings()
    local savedFromRank, savedToRank = settings.fromRank, settings.toRank
    local allCharacters = ns.Characters and ns.Characters:_SmashNGrab() or {}
    local character = settings.character and allCharacters[settings.character]
    if character then
        Planner.selectedCharacter = settings.character
        page.characterDropdown:SetDefaultText(character.name)
        local profession = character.professions and character.professions[settings.profession]
        if profession then
            Planner.selectedProfession = settings.profession
            Planner.selectedProfessionName = profession.name
            page.professionDropdown:SetDefaultText(profession.name)
            UpdateFromRankSlider()
            UpdateToRankSlider()
            local maximum = profession.maxSkillLevel or 1
            local fromRank = math.max(1, math.min(maximum, tonumber(savedFromRank) or Planner.fromRank or 1))
            local toRank = math.max(fromRank, math.min(maximum, tonumber(savedToRank) or Planner.toRank or maximum))
            page.fromRankSlider:SetValue(fromRank)
            page.toRankSlider:SetValue(toRank)
            Planner.fromRank, Planner.toRank = fromRank, toRank
            SavePlannerSettings()
            RefreshRouteRows()
        end
    end
    local auctionatorAPI = GetAuctionatorAPI()
    if auctionatorAPI and type(auctionatorAPI.RegisterForDBUpdate) == "function" then
        pcall(auctionatorAPI.RegisterForDBUpdate, AUCTIONATOR_CALLER, function()
            if page:IsShown() then RefreshRouteRows() end
        end)
    end
    page:HookScript( "OnShow", function()
        if ns.Inventory then ns.Inventory:ScanBags() else ScanCurrentInventory() end
        -- Also refresh prices if Auctionator loaded after this Planner page.
        RefreshRouteRows()
        RefreshShoppingList()
    end )
    if ns.Inventory then
        ns.Inventory:Initialize(function()
            if not page:IsShown() then return end
            if not Planner.selectedProfession then
                RefreshShoppingList()
                return
            end
            -- Update the route only if its selected recipes/ranges/quantities change.
            local route = BuildLevelingRoute()
            local parts = {}
            for i, step in ipairs(route) do
                parts[i] = table.concat({step.recipeID, step.fromRank,
                    step.toRank, step.quantity}, ":")
            end
            local signature = table.concat(parts, "|")
            if signature ~= Planner.inventoryRouteSignature then
                Planner.inventoryRouteSignature = signature
                RefreshRouteRows()
            else
                RefreshShoppingList()
            end
        end)
        return
    end
    local inventoryEvents = CreateFrame( "Frame" )
    inventoryEvents:RegisterEvent( "BAG_UPDATE" )
    inventoryEvents:RegisterEvent( "BAG_UPDATE_DELAYED" )
    inventoryEvents:RegisterEvent( "PLAYERBANKSLOTS_CHANGED" )
    inventoryEvents:RegisterEvent( "PLAYER_ENTERING_WORLD" )
    inventoryEvents:SetScript( "OnEvent", function()
        ScanCurrentInventory()
        if page:IsShown() then RefreshShoppingList() end
    end )
    ScanCurrentInventory()
    page.shoppingInventoryEvents = inventoryEvents
end

function Planner:RefreshTrackedRecipes()
    if self.page then RefreshRouteRows() end
end
