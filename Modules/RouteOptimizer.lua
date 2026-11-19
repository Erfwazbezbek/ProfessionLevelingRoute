-- RouteOptimizer.lua

local ADDON, ns = ...

local Optimizer = {}
ns.RouteOptimizer = Optimizer

local function KnownRecipe(characterKey, professionID, recipeID)
    if not (ns.Characters and ns.Characters._SmashNGrab) then return nil end
    local character = ns.Characters:_SmashNGrab()[characterKey]
    local knowledge = character and character.recipeKnowledge
    local entries = knowledge and knowledge[professionID]
    local state = entries and entries[recipeID]
    if type(state) == "table" then return state.learned == true end
    if type(state) == "boolean" then return state end
    return nil
end

function Optimizer:Choose(candidates, context)
    local bestID, bestScore, bestEnd
    local owned = context.owned
    local reagentLookup = context.reagents
    local cache = {}
    for _, candidate in ipairs(candidates) do
        local id, recipe, endRank = candidate.id, candidate.recipe, candidate.endRank
        local difficulty = candidate.difficulty
        local gains = math.max(1, endRank - context.rank)
        local crafts = math.max(1, candidate.quantity)
        local reagents = cache[id]
        if reagents == nil then
            reagents = reagentLookup(id)
            cache[id] = reagents or false
        end
        local coverage, types = 0, 0
        if type(reagents) == "table" then
            local required, available = 0, 0
            for itemID, perCraft in pairs(reagents) do
                local amount = perCraft * crafts
                if amount > 0 then
                    required = required + amount
                    available = available + math.min(amount, math.max(0, owned(itemID) or 0))
                    types = types + 1
                end
            end
            if required > 0 then coverage = available / required end
        end
        local score = difficulty * 100 + coverage * 28
            + math.min(gains, 20) * 0.5
            - (crafts / gains) * 2
            - (reagents == false and 8 or 0)
        local known = KnownRecipe(context.character, context.profession, id)
        if known == true then score = score + 9 end
        if bestScore == nil or score > bestScore + 0.00001
            or (math.abs(score - bestScore) <= 0.00001
                and (endRank > bestEnd or (endRank == bestEnd and id < bestID))) then
            bestID, bestScore, bestEnd = id, score, endRank
        end
    end
    return bestID
end
