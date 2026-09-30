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
    panel:SetBackdropColor( 0.20, 0.20, 0.20, 0.25 )
    panel:SetBackdropBorderColor( 0.35, 0.35, 0.35, 1 )

    return panel
end

function Components:CreateProfessionIcon( parent, size )

    local button = CreateFrame(
        "Button",
        nil,
        parent
    )
    button:SetSize( size or 24, size or 24 )
    button.icon = button:CreateTexture( nil, "ARTWORK" )
    button.icon:SetAllPoints()
    button.icon:SetTexCoord( 0.07, 0.93, 0.07, 0.93 )
    button:SetScript( "OnEnter", function( self )
        if not self.professionName then
            return
        end
            GameTooltip:SetOwner( self, "ANCHOR_RIGHT" )
            GameTooltip:SetText( self.professionName, 1, 0.82, 0 )
            GameTooltip:Show()
        end
    )

    button:SetScript( "OnLeave", function()
            GameTooltip:Hide()
        end
    )
    return button
end
