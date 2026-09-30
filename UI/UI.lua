local ADDON, ns = ...
local PLR = ns.Addon

-- Bigus chungus frame
local function CreateMainFrame()

    local frame = CreateFrame(
        "Frame",
        nil,
        UIParent,
        "BackdropTemplate"
    )

    frame:SetSize( 750, 500 )
    frame:SetPoint( "CENTER" )
    frame:SetResizable( true )
    frame:SetResizeBounds(
        600, -- minimum width
        400, -- minimum height
        1200, -- maximum width
        900   -- maximum height
    )
    frame:SetMovable( true )
    frame:EnableMouse( true )
    frame:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true,
        tileSize = 32,
        edgeSize = 32,
        insets = 
            {
                left = 8,
                right = 8,
                top = 8,
                bottom = 8,
            },
        }
    )
    frame:SetBackdropColor( 0.15, 0.15, 0.15, 0.95 )

    return frame
end

--Frame behaviour 
local function leftBIGsmallright( frame )

    -- Drag the frame around like its '95 and windows froze
    frame:RegisterForDrag( "LeftButton" )
    frame:SetScript( "OnDragStart", function(self)
        self:StartMoving()
        end 
    )
    frame:SetScript( "OnDragStop", function(self)
        self:StopMovingOrSizing()
        end 
    )

    -- Customize the size to your liking
    local resizeButton = CreateFrame( 
        "Button",
        nil,
        frame
    )

    resizeButton:SetSize( 16, 16 )
    resizeButton:SetPoint( "BOTTOMRIGHT", -2, 2 )
    resizeButton:SetNormalTexture( "Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up" )
    resizeButton:SetHighlightTexture( "Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight" )
    resizeButton:SetPushedTexture( "Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down" )
    resizeButton:SetScript( "OnMouseDown", function()
        frame:StartSizing( "BOTTOMRIGHT" )
        end 
    )
    resizeButton:SetScript( "OnMouseUp", function()
        frame:StopMovingOrSizing()
        end 
    )

    frame.resizeButton = resizeButton
end

-- Top Title because it needs to be handled on its own
local function CreateHeader( frame )

    local header = CreateFrame(
        "Frame",
        nil,
        frame,
        "BackdropTemplate"
    )

    header:SetSize( 300, 42 )
    header:SetPoint( "TOP", frame, "TOP", 0, 15 )
    header.background = header:CreateTexture( nil, "BACKGROUND" )
    header.background:SetAllPoints()
    header.background:SetColorTexture( 0.15, 0.15, 0.15, 0.95  )
    header:SetBackdrop(
        {
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            edgeSize = 32,
            insets = 
                {
                    left = 8,
                    right = 8,
                    top = 8,
                    bottom = 8,
                },
        }
    )
    header.title = header:CreateFontString( nil, "OVERLAY", "GameFontNormalLarge" )
    header.title:SetPoint( "CENTER" )
    header.title:SetText( "Profession Leveling Route" )

    return header
end

-- Close button because it needs to be handled on its own
local function CreateCloseButton(frame)

    local closeButton = CreateFrame(
        "Button",
        nil,
        frame,
        "UIPanelCloseButton"
    )

    closeButton:SetPoint( "TOPRIGHT", -5, -5 )
    closeButton:SetScript( "OnClick", function()
        frame:Hide()
        end
    )

    return closeButton
end

-- Little pages within the frame
local function CreatePageFrames( frame )

    local pages = {}

    local function CreatePage()

        local page = ns.Components:CreatePanel( frame )
        page:SetPoint( "TOPLEFT", frame, "TOPLEFT", 20, -105 )
        page:SetPoint( "BOTTOMRIGHT", frame, "BOTTOMRIGHT", -20, 45 )

        return page
    end

    pages.roster = CreatePage()
    pages.planner = CreatePage()
    pages.recipes = CreatePage()

    return pages
end

-- Alt + Tab
local function SetupPageController( pages )

    local function ShowPage( page )

        pages.roster:Hide()
        pages.planner:Hide()
        pages.recipes:Hide()

        page:Show()
    end

    return ShowPage
end

-- Main Tabs (Theres only 3)
local function CreateTabs( frame, pages, ShowPage )

    local tabs = {}

    local function SetTabSelected( tab, selected )
        if selected then
            tab:SetBackdropColor( 0.03, 0.03, 0.03, 1 )
            tab:SetBackdropBorderColor( 0.75, 0.75, 0.75, 1 )
            tab.text:SetTextColor( 1, 1, 1 )
        else
            tab:SetBackdropColor( 0.015, 0.015, 0.015, 1 )
            tab:SetBackdropBorderColor( 0.35, 0.35, 0.35, 1 )
            tab.text:SetTextColor( 1, 0.82, 0 )
        end
    end

    local function SelectTab( selectedTab )
        for _, tab in ipairs( tabs ) do
            SetTabSelected( tab, tab == selectedTab )
        end
    end

    local function CreateTab( text, page )

        local tab = CreateFrame(
            "Button",
            nil,
            frame,
            "BackdropTemplate"
        )

        tab:SetSize( 75, 28 )
        tab:SetBackdrop(
            {
                bgFile = "Interface\\Buttons\\WHITE8X8",
                edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
                tile = true,
                tileSize = 16,
                edgeSize = 12,
                insets = 
                {
                    left = 3,
                    right = 3,
                    top = 3,
                    bottom = 3,
                },
            }
        )

        tab.text = tab:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
        tab.text:SetPoint( "CENTER", 0, 1 )
        tab.text:SetText( text )
        tab:SetScript( "OnClick", function( self )
            SelectTab( self )
            ShowPage( page )
            end
        )
        table.insert( tabs, tab )
        return tab

    end

    local rosterTab = CreateTab(
        "Roster",
        pages.roster
    )
    rosterTab:SetPoint( "BOTTOMLEFT", pages.roster, "TOPLEFT", 5, -1 )

    local plannerTab = CreateTab(
        "Planner",
        pages.planner
    )
    plannerTab:SetPoint( "LEFT", rosterTab, "RIGHT", 5, 0 )

    local recipesTab = CreateTab(
        "Recipes",
        pages.recipes
    )

    recipesTab:SetPoint( "LEFT", plannerTab, "RIGHT", 5, 0 )
    SelectTab(rosterTab)
    ShowPage( pages.roster )

    return tabs
end

-- Pages
local function CreatePageContent( pages )

    ns.Roster:Create( pages.roster )
    ns.Planner:Create( pages.planner )
    ns.Recipes:Create( pages.recipes )

end

-- Bottom frame because it needs some loving too
local function CreateFooter( frame )

    local footer = frame:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )

    footer:SetPoint( "BOTTOMLEFT", 15, 15 )
    footer:SetText( "Cross-Character Profession Leveling Route Planner" )

    return footer
end

-- Alright its all coming together now
local function CreateUI()

    local frame = CreateMainFrame()

    leftBIGsmallright( frame )

    local header = CreateHeader( frame )

    local closeButton = CreateCloseButton( frame )

    local pages = CreatePageFrames( frame )

    local ShowPage = SetupPageController( pages )

    local tabs = CreateTabs(
        frame,
        pages,
        ShowPage
    )

    CreatePageContent( pages )

    local footer = CreateFooter( frame )

    frame:Hide()

    return 
    {
        frame = frame,
        header = header,
        closeButton = closeButton,
        pages = pages,
        tabs = tabs,
        footer = footer,
        ShowPage = ShowPage,
    }
end

local UI = CreateUI()
-- Freddie is coming for you (not that Freddie)
SLASH_PROFESSIONLEVELINGROUTE1 = "/plr"

SlashCmdList.PROFESSIONLEVELINGROUTE = function()
    if UI.frame:IsShown() then
        UI.frame:Hide()
    else
        UI.frame:Show()
    end

end
