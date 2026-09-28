-- Minimap Button 
local ADDON, ns = ...

local ProfessionLevelingRouteLDB = LibStub("LibDataBroker-1.1"):NewDataObject(ADDON, {
    type = "data_source",
    text = "Profession Leveling Route",
    icon = "Interface\\AddOns\\ProfessionLevelingRoute\\Media\\Minimap.tga",
    OnClick = function(self, button)
        if button == "LeftButton" then
            print("Left-clicked minimap button!")
        elseif button == "RightButton" then
            if ns.isMenuOpen then
                if Settings and Settings.CloseSettingsPage then
                    Settings.CloseSettingsPage()
                else
                    HideUIPanel(SettingsPanel)
                end
                print("|cff00ff00Profession Leveling Route:|r Your fate is sealed...")
            else
                print("|cff00ff00Profession Leveling Route:|r Choose wisely...")
                if ns.categoryID and Settings and Settings.OpenToCategory then
                    Settings.OpenToCategory(ns.categoryID)
                else
                    Settings.OpenToCategory("Profession Leveling Route")
                end
            end
        end
    end,
    OnTooltipShow = function(tooltip)
        if not tooltip or not tooltip.AddLine then return end
        tooltip:AddLine("Profession Leveling Route")
        tooltip:AddLine("Left-click to toggle.", 0.2, 1.0, 0.2)
    end,
})

ProfessionLevelingRouteDB = ProfessionLevelingRouteDB or {}

local icon = LibStub("LibDBIcon-1.0")

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", function(self, event, loadedAddonName)
    if loadedAddonName == ADDON then
        ProfessionLevelingRouteDB.minimap = ProfessionLevelingRouteDB.minimap or {}
        icon:Register(ADDON, ProfessionLevelingRouteLDB, ProfessionLevelingRouteDB.minimap)
        self:UnregisterEvent("ADDON_LOADED")
    end
end)
