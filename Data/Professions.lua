-- Professions.lua

local ADDON, ns = ...
local Professions = {}
ns.Professions = Professions

Professions.list = {
    { skillLineID = 171, name = "Alchemy", icon = 136240 },
    { skillLineID = 164, name = "Blacksmithing", icon = 136241 },
    { skillLineID = 185, name = "Cooking", icon = 133971 },
    { skillLineID = 333, name = "Enchanting", icon = 136244 },
    { skillLineID = 202, name = "Engineering", icon = 136243 },
    { skillLineID = 356, name = "Fishing", icon = 136245 },
    { skillLineID = 129, name = "First Aid", icon = 135966 },
    { skillLineID = 182, name = "Herbalism", icon = 136246 },
    { skillLineID = 165, name = "Leatherworking", icon = 136247 },
    { skillLineID = 186, name = "Mining", icon = 136248 },
    { skillLineID = 393, name = "Skinning", icon = 134366 },
    { skillLineID = 197, name = "Tailoring", icon = 136249 },
}

function Professions:GetBySkillLineID( skillLineID )
    for _, profession in ipairs( self.list ) do
        if profession.skillLineID == skillLineID then
            return profession
        end
    end
end
