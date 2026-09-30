-- Professions.lua

local ADDON, ns = ...
local Professions = {}
ns.Professions = Professions

Professions.list = {
    { skillLineID = 171, name = "Alchemy" },
    { skillLineID = 164, name = "Blacksmithing" },
    { skillLineID = 185, name = "Cooking" },
    { skillLineID = 333, name = "Enchanting" },
    { skillLineID = 202, name = "Engineering" },
    { skillLineID = 356, name = "Fishing" },
    { skillLineID = 129, name = "First Aid" },
    { skillLineID = 182, name = "Herbalism" },
    { skillLineID = 165, name = "Leatherworking" },
    { skillLineID = 186, name = "Mining" },
    { skillLineID = 393, name = "Skinning" },
    { skillLineID = 197, name = "Tailoring" },
}

Professions.primary = {
    171, -- Alchemy
    164, -- Blacksmithing
    333, -- Enchanting
    202, -- Engineering
    182, -- Herbalism
    165, -- Leatherworking
    186, -- Mining
    393, -- Skinning
    197, -- Tailoring
}

Professions.secondary = {
    185, -- Cooking
    129, -- First Aid
    356, -- Fishing
}

function Professions:GetBySkillLineID( skillLineID )
    for _, profession in ipairs( self.list ) do
        if profession.skillLineID == skillLineID then
            return profession
        end
    end
end

function Professions:GetTexture( skillLineID )
    return C_TradeSkillUI.GetTradeSkillTexture(
        skillLineID
    )
end
