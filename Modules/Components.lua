-- Components.lua

local ADDON, ns = ...
local Components = {}
ns.Components = Components

function Components:CreatePanel( parent )

    local panel = CreateFrame(
        "Frame",
        nil,
        parent,
        "BackdropTemplate"
    )

    panel:SetBackdrop(
        {
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile = true,
            tileSize = 16,
            edgeSize = 16,
            insets =
            {
                left = 4,
                right = 4,
                top = 4,
                bottom = 4,
            },
        }
    )
    panel:SetBackdropColor( 0.02, 0.02, 0.02, 0.88 )
    panel:SetBackdropBorderColor( 0.35, 0.35, 0.35, 1 )

    return panel
end
