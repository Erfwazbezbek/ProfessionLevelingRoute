--Planner.lua
local ADDON, ns = ...
local Planner = {}
ns.Planner = Planner

function Planner:Create( page )

    page.title = page:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormalLarge"
    )
    page.title:SetPoint( "CENTER" )
    page.title:SetText( "Here be dragons!" )
end
