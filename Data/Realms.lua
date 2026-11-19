-- Realms.lua

local ADDON, ns = ...

local Realms = {}
ns.Realms = Realms

Realms.rulesets = {
    Normal = { name = "Normal", icon = 7808147, },
    PvP = { name = "PvP", icon = 236396, },
    RP = { name = "RP", icon = 132288, },
    RPPVP = { name = "RP-PvP", icon = 1582141, },
    HC = { name = "Hardcore", icon = 132293, },
}

function Realms:GetRuleset()
    local rules = Enum.GameRule
    local isActive = C_GameRules.IsGameRuleActive

    if isActive(rules.HardcoreRuleset) then
        return "HC"
    end

    local isRP = isActive(rules.RPRuleset)
    local isPvP = isActive(rules.PvPRuleset)

    if isRP and isPvP then
        return "RPPVP"
    elseif isRP then
        return "RP"
    elseif isPvP then
        return "PvP"
    end

    return "Normal"
end

function Realms:GetRulesetInfo( ruleset )
    return self.rulesets[ ruleset ]
end