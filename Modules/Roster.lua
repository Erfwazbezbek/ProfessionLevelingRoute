-- Roster.lua

local ADDON, ns = ...
local Roster = {}
ns.Roster = Roster

function Roster:Create( page )

    page.title = page:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormalLarge"
    )
    page.title:SetPoint( "CENTER" )
    page.title:SetText( "Here be alts" )
end
