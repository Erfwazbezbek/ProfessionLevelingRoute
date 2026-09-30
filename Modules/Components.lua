-- Components.lua

local ADDON, ns = ...
local Components = {}
ns.Components = Components

local function ShowProfessionTooltip( icon )
    if not icon.professionName then
        return
    end
    GameTooltip:SetOwner( icon, "ANCHOR_RIGHT" )
    GameTooltip:SetText( icon.professionName, 1, 0.82, 0 )
    if icon.skillLevel and icon.maxSkillLevel then
        GameTooltip:AddLine( "Skill: " .. icon.skillLevel .. " / " .. icon.maxSkillLevel, 1, 1, 1 )
    end
    GameTooltip:AddLine( " " )
    GameTooltip:AddDoubleLine( "Horde:", icon.hordeKnown and "Yes" or "No", 1, 1, 1, 1, 1, 1 )
    GameTooltip:AddDoubleLine( "Alliance:", icon.allianceKnown and "Yes" or "No", 1, 1, 1, 1, 1, 1 )
    if icon.knownCharacters and #icon.knownCharacters > 0 then
        GameTooltip:AddLine( " " )
        GameTooltip:AddLine( "Characters Known:", 1, 0.82, 0 )
        local maxCharacters = math.min( #icon.knownCharacters, 4 )
        for index = 1, maxCharacters do
            GameTooltip:AddLine( icon.knownCharacters[ index ], 1, 1, 1 )
        end
        local remaining = #icon.knownCharacters - maxCharacters
        if remaining > 0 then
            GameTooltip:AddLine( "+" .. remaining .. " more", 0.7, 0.7, 0.7 )
        end
    end
    GameTooltip:Show()
end

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
    button:SetScript( "OnEnter", function( self ) ShowProfessionTooltip( self ) end )
    button:SetScript( "OnLeave", function() GameTooltip:Hide() end )
    return button
end
