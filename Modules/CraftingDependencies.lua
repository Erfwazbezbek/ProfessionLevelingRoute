-- CraftingDependencies.lua

local ADDON, ns = ...
local Dependencies = {}
ns.CraftingDependencies = Dependencies

local function GetSchematic(recipeID)
    if not C_TradeSkillUI or type(C_TradeSkillUI.GetRecipeSchematic) ~= "function" then return nil end
    local ok, schematic = pcall(C_TradeSkillUI.GetRecipeSchematic, recipeID, false)
    if ok and type(schematic) == "table" then return schematic end
end

local function GetReagents(schematic)
    local result = {}
    if type(schematic.reagentSlotSchematics) ~= "table" then return nil end
    for _, slot in ipairs(schematic.reagentSlotSchematics) do
        local required = slot.quantityRequired or 0
        local optional = Enum and Enum.CraftingReagentType and slot.reagentType == Enum.CraftingReagentType.Optional
        if not optional and required > 0 then
            local choices = slot.reagents
            if type(choices) ~= "table" or #choices ~= 1 then return nil end
            local entry = choices[1]
            local id = entry.itemID or (entry.item and entry.item.itemID)
            if type(id) ~= "number" then return nil end
            result[id] = (result[id] or 0) + required
        end
    end
    return result
end

function Dependencies:BuildIndex(professionRecipes, isIncluded)
    local index, ambiguous = {}, {}
    for recipeID in pairs(professionRecipes or {}) do
        if not isIncluded or isIncluded(recipeID) then
            local schematic = GetSchematic(recipeID)
            if schematic then
                local outputID = schematic.outputItemID
                if outputID == 2318 or outputID == 2319 or outputID == 2934 then
                    outputID = nil
                end
                local yield = schematic.quantityMin or schematic.quantity or 1
                if type(outputID) == "number" and type(yield) == "number" and yield > 0 then
                    local reagents = GetReagents(schematic)
                    if reagents and next(reagents) then
                        if index[outputID] then ambiguous[outputID] = true end
                        index[outputID] = { recipeID = recipeID, reagents = reagents, yield = yield }
                    end
                end
            end
        end
    end
    for id in pairs(ambiguous) do index[id] = nil end
    return index
end

function Dependencies:Resolve(requirements, index, getOwned)
    local shopping, craft, stock, active = {}, {}, {}, {}
    local function available(id)
        if stock[id] == nil then stock[id] = math.max(0, (getOwned and getOwned(id)) or 0) end
        return stock[id]
    end
    local function expand(id, amount, depth)
        if amount <= 0 then return end
        local owned = available(id)
        local used = math.min(owned, amount)
        stock[id] = owned - used
        local missing = amount - used
        if missing <= 0 then return end
        local recipe = index[id]
        if recipe and depth < 12 and not active[id] then
            active[id] = true
            local crafts = math.ceil(missing / recipe.yield)
            craft[id] = (craft[id] or 0) + crafts * recipe.yield
            for reagentID, perCraft in pairs(recipe.reagents) do
                expand(reagentID, perCraft * crafts, depth + 1)
            end
            active[id] = nil
        else
            shopping[id] = (shopping[id] or 0) + missing
        end
    end
    local ids = {}
    for id in pairs(requirements or {}) do ids[#ids + 1] = id end
    table.sort(ids)
    for _, id in ipairs(ids) do expand(id, requirements[id], 0) end
    return shopping, craft
end
