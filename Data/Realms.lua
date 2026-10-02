-- Realms.lua

local ADDON, ns = ...

local Realms = {}
ns.Realms = Realms

Realms.rulesets = {
    Normal = { name = "Normal", icon = 7808147, },
    PvP = { name = "PvP", icon = 236396, },
    RP = { name = "RP", icon = 132288, },
    HC = { name = "Hardcore", icon = 132293, },
}

function Realms:GetRuleset()
    if C_GameRules.IsGameRuleActive( Enum.GameRule.HardcoreRuleset ) then
        return "HC"
    elseif C_GameRules.IsGameRuleActive( Enum.GameRule.RPRuleset ) then
        return "RP"
    elseif C_GameRules.IsGameRuleActive( Enum.GameRule.PvPRuleset ) then
        return "PvP"
    else
        return "Normal"
    end
end
function Realms:GetRulesetInfo( ruleset )
    return self.rulesets[ ruleset ]
end
