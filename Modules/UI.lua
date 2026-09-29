local ADDON, ns = ...
local PLR = ns.Addon

-- Bigus chungus frame
local function CreateMainFrame()

    local frame = CreateFrame(
        "Frame",
        "PLR_MainFrame",
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
    frame:SetBackdropColor( 0.05, 0.05, 0.05, 0.15 )

    return frame
end

--Frame behaviour 
local function leftBIGsmallright( frame )

    -- Drag the frame around like its '95 and windows froze
    frame:RegisterForDrag( "LeftButton" )
    frame:SetScript( "OnDragStart", function(self)
        self:StartMoving()
    end)
    frame:SetScript( "OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)

    -- Customize the size to your liking
    local resizeButton = CreateFrame(
        "Button",
        nil,
        frame
    )

    resizeButton:SetSize( 16, 16 )
    resizeButton:SetPoint(
        "BOTTOMRIGHT",
        -2,
        2
    )
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
    header.background = header:CreateTexture(
        nil,
        "BACKGROUND"
    )
    header.background:SetAllPoints()
    header.background:SetColorTexture( 0.03, 0.03, 0.03, 1 )
    header:SetBackdrop({
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
    header.title = header:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormalLarge"
    )
    header.title:SetPoint( "CENTER" )
    header.title:SetText( "Profession Leveling Suite" )

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
local function CreatePageFrames(frame)

    local pages = {}

    pages.roster = CreateFrame( "Frame", nil, frame )
    pages.roster:SetPoint( "TOPLEFT", 15, -90 )
    pages.roster:SetPoint( "BOTTOMRIGHT", -15, 45 )

    pages.planner = CreateFrame( "Frame", nil, frame )
    pages.planner:SetPoint( "TOPLEFT", 15, -90 )
    pages.planner:SetPoint( "BOTTOMRIGHT", -15, 45 )

    pages.recipes = CreateFrame( "Frame", nil, frame )
    pages.recipes:SetPoint( "TOPLEFT", 15, -90 )
    pages.recipes:SetPoint( "BOTTOMRIGHT", -15, 45 )

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

-- Alt + Tab Continued 
local function CreateTabs( frame, pages, ShowPage )

    local tabs = {}

    local function SelectTab( selectedTab )
        for _, tab in ipairs( tabs ) do
            if tab == selectedTab then
                tab:Disable()
            else
                tab:Enable()
            end
        end
    end

    local function CreateTab( text, xOffset, page )

        local tab = CreateFrame(
            "Button",
            nil,
            frame,
            "UIPanelButtonTemplate"
        )

        tab:SetSize( 110, 30 )
        tab:SetPoint( "TOPLEFT", xOffset, -55 )
        tab:SetText( text )
        tab:SetScript( "OnClick", function(self)
            SelectTab(self)
            ShowPage(page)
            end
        )
        table.insert( tabs, tab )

        return tab
    end

    local rosterTab = CreateTab(
        "Roster",
        20,
        pages.roster
    )

    local plannerTab = CreateTab(
        "Planner",
        135,
        pages.planner
    )

    local recipesTab = CreateTab(
        "Recipes",
        250,
        pages.recipes
    )

    SelectTab( rosterTab )
    ShowPage( pages.roster )

    return tabs
end


-- Pages
local function CreatePageContent( pages )

    -- Character Selection 
    pages.roster.title = pages.roster:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )
    pages.roster.title:SetPoint( "TOPLEFT", 10, -10 )
    pages.roster.title:SetText( "Here be alts" )

    -- Planner page
    pages.planner.title = pages.planner:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )
    pages.planner.title:SetPoint( "TOPLEFT", 10, -10 )
    pages.planner.title:SetText( "Here be dragons!" )

    -- Recipes, may I recommend a Coq au Vin?? 
    --[[ 
        4 Chicken Thighs (Make sure skin is on) 
        4 Chicken Drumsticks (Again dont forget the skin, op for 8 things if you like dat dark meat instead)
        1 1/2 Cups of Red Wine (Plus 1 bottle for your self)
            I fully recommend a Merlot for this recipe
            Rule of thumb, If you refuse to drink the wine... DONT COOK WITH IT
        1 Cup of Chicken Stock (Dont be lazy... make your own!) 
            (Especially if you're doing 4x4 Thighs:Drumbsticks you got A LOT of extra chicekn to make a stock with)
        1/4 Cup of Brandy (Rest for you! :D )
        3 Chonky strips of thick cut bacon (Dont cheap out, you want the good stuff)
        1 Teaspoon of Salt-n-Pepa (push it real good!)
        1 Medium Onion (Use your REALLY SHARP AND NOT DULL KNIFE to thinly slice them long)
        4 Medium carrots (Big enough to put on a fork/spoon without choking size)
        4 Cloves of garlic minced (Lets be honest... if you're not using multiple heads of garlic you got issues)
        2 Tablespoons of Tomato Paste 
        2 Teaspoons FRESH Thyme (Dont got any, go to the store)
        8 Mushrooms (Anything but shitake mushrooms work here) Thick sliced
        8 Pearl Onions (peel them or they will be chewy)
        Beurre Manie (Equal parts soft butter and flour) 
        DO NOT LIQUIFY THE BUTTER, just fold it softly in your fingers like a child found dirt for the first time

        1. Place Chicken in a bowl big enough for the wine, stock & brandy while you cut the rest of the stuff

        2. Add bacon to a large HIGH sided pan or braiser over medium to high heat (dont burn or super heat this
            and cause the fire alarms to go off and scare your cats)
            Cook until its crispy and remove with a slotted spoon leaving that fatty goodness in there

        3. Remove chicken from marinade !!! DO NOT THROW OUT THE LIQUID !!! 
            Pat dry the chicken with paper towels and season with half of the Salt-n-Pepa

        4. Working in batches (Dont crowd the pan) place them in the pot skin side down
            LET THE COOK DO NOT MOVE THEM UNTIL THEY COME FREE THEM SELVES OR YOU WILL RUIN THE SKIN
            if you can move the chicken with the skin down easily its time to flip it and sear the non-skin side
            Once both sides cooked removed and set a side

        5. Add those thiny sliced onions and carrorts to the pan, cook till onion is starting to caramlize 
            Add in that garlic and dont burn it 
        
        6. Add tomato paste and cook till it becomes fragrant and starts to brown (you'll notice when it does)
            Once brown add in the wine marinade I know you didnt throw away from earlier
            Deglaze and bring to a boil

        7. Bring Chicken back to their wine brandy stock bath and add in that Fresh Thyme.
            Cover and reduce to a simmer for about 20 mins 

        8. On a SEPERATE PAN saute the mushrooms until brown 

        9. Add the peeled pearl onions to the pot after the 20 min simmer has concluded, cook for another 10 mins  

        10. Make the Beurre Manie and do one of two things (which ever is easier for you)
            Option 1: Add Beurre Manie to pot with chicken and bring to your desired thickness of liquid
            Option 2: Remove chicken and add Beurre Manie and bring to your desired thickness of liquid.

        
        11. Add back bacon (and chicken if you did option 2) and sprinkle with some fresh thyme 

        12. Plate and devour 

    ]]
    pages.recipes.title = pages.recipes:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormal"
    )
    pages.recipes.title:SetPoint( "TOPLEFT", 10, -10 )
    pages.recipes.title:SetText( "Here be recipes! Soon(tm)" )

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