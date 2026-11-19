-- Acquisition.lua

local ADDON, ns = ...
local Acquisition = {}
ns.Acquisition = Acquisition

local sourceNames = {
    trainer = "Trainer", vendor = "Vendor", drop = "Drop",
    quest = "Quest", crafted = "Crafted", craft = "Crafted",
    auction = "Auction House", ah = "Auction House",
    reputation = "Reputation", discovery = "Discovery",
}

local function AddUnique(lines, seen, value)
    if type(value) == "string" and value ~= "" and not seen[value] then
        seen[value] = true
        lines[#lines + 1] = value
    end
end

function Acquisition:GetRecipeSources(recipe)
    local lines, seen = {}, {}
    if type(recipe) ~= "table" then return lines end
    for _, source in ipairs(recipe.sources or {}) do
        if type(source) == "table" then
            local kind = sourceNames[source.type] or source.type
            if type(kind) == "string" then
                if kind:lower():match("^unknown") then kind = "Drop" end
                local npc = source.npcName or source.vendorName or source.trainerName
                local zone = source.zoneName or source.zone
                local detail = kind
                if type(npc) == "string" and npc ~= "" then detail = detail .. ": " .. npc end
                if type(zone) == "string" and zone ~= "" then detail = detail .. " (" .. zone .. ")" end
                AddUnique(lines, seen, detail)
            end
        end
    end
    for _, recipeItem in ipairs(recipe.recipeItems or {}) do
        for _, source in ipairs(recipeItem.sources or {}) do
            if type(source) == "table" then
                local kind = sourceNames[source.type] or source.type
                if type(kind) == "string" then
                if kind:lower():match("^unknown") then kind = "Drop" end
                    local detail = kind
                    if type(source.npcName) == "string" then detail = detail .. ": " .. source.npcName end
                    if type(source.zoneName) == "string" then detail = detail .. " (" .. source.zoneName .. ")" end
                    AddUnique(lines, seen, detail)
                end
            end
        end
    end
    return lines
end

function Acquisition:ShowRecipeTooltip(owner, recipe, missing)
    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
    GameTooltip:AddLine(missing and "Recipe not learned" or "Recipe acquisition", 1, 0.82, 0)
    local lines = self:GetRecipeSources(recipe)
    if #lines == 0 then GameTooltip:AddLine("Acquisition details unavailable", .8, .8, .8)
    else for _, line in ipairs(lines) do GameTooltip:AddLine(line, 1, 1, 1, true) end end
    GameTooltip:Show()
end

function Acquisition:ShowMaterialTooltip(owner, itemID, category, owned, required)
    GameTooltip:SetOwner(owner, "ANCHOR_RIGHT")
    local shown = false
    if type(itemID) == "number" and GameTooltip.SetItemByID then
        shown = pcall(GameTooltip.SetItemByID, GameTooltip, itemID)
    end
    if not shown then GameTooltip:AddLine("Item " .. tostring(itemID), 1, .82, 0) end
    GameTooltip:AddLine("Owned / Required: " .. tostring(owned) .. "/" .. tostring(required), 1, 1, 1)
    if ns.Inventory then ns.Inventory:ShowBreakdown(GameTooltip, itemID) end
    if category == "vendor" then
        GameTooltip:AddLine("Vendor material", .8, .8, .8)
    elseif category == "craft" then
        GameTooltip:AddLine("Craftable intermediate material", .8, .8, .8)
    else
        GameTooltip:AddLine("Acquire through available game sources", .8, .8, .8)
    end
    GameTooltip:Show()
end

function Acquisition:LinkItem(itemID)
    local link
    if C_Item and type(C_Item.GetItemInfo) == "function" then
        local _, itemLink = C_Item.GetItemInfo(itemID)
        link = itemLink
    end
    if not link and type(GetItemInfo) == "function" then
        local _, itemLink = GetItemInfo(itemID)
        link = itemLink
    end
    if not link then link = "item:" .. tostring(itemID) end
    if type(ChatEdit_InsertLink) == "function" and ChatEdit_InsertLink(link) then return end
    if type(ChatFrame_OpenChat) == "function" then ChatFrame_OpenChat(link) end
end
