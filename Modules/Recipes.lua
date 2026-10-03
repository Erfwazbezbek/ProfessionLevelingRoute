-- Recipes.lua
local ADDON, ns = ...
local Recipes = {}
ns.Recipes = Recipes
Recipes.selectedCharacter = nil
Recipes.selectedProfession = nil
Recipes.selectedSource = nil

local function CreateRecipesPanel( page )
    local panel = ns.Components:CreatePanel( page )
    panel:SetPoint( "TOPLEFT", page, "TOPLEFT", 5, -5 )
    panel:SetPoint( "BOTTOMRIGHT", page, "BOTTOMRIGHT", -5, 5 )
    page.recipesPanel = panel
end

local function RefreshTestRecipeSearch( page )

    local searchText = string.lower( Recipes.searchText or "" )

    local knownMatches =
        searchText == "" or
        string.find( string.lower( "Test Known Recipe" ), searchText, 1, true ) or
        string.find( string.lower( "Test Crafted Item" ), searchText, 1, true ) or
        string.find( string.lower( "Trainer" ), searchText, 1, true )

    local missingMatches =
        searchText == "" or
        string.find( string.lower( "Test Missing Recipe" ), searchText, 1, true ) or
        string.find( string.lower( "Another Crafted Item" ), searchText, 1, true ) or
        string.find( string.lower( "Vendor (Test NPC)" ), searchText, 1, true )

    if page.testKnownRecipe then
        page.testKnownRecipe:SetShown(
            page.knownToggle:GetChecked() and knownMatches
        )
    end

    if page.testMissingRecipe then
        page.testMissingRecipe:SetShown(
            page.missingToggle:GetChecked() and missingMatches
        )
    end
end

local function CreateKnownToggle( page )
    local toggle = CreateFrame(
        "CheckButton",
        nil,
        page,
        "UICheckButtonTemplate"
    )
    toggle:SetSize( 24, 24 )
    toggle:SetPoint( "TOPRIGHT", page.recipesPanel, "TOPRIGHT", -165, 32 )
    local text = toggle:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    text:SetPoint( "LEFT", toggle, "RIGHT", 2, 0 )
    text:SetText( "Known" )
    toggle:SetChecked( true )
        toggle:SetScript( "OnClick", function()
        RefreshTestRecipeSearch( page )
    end )
    page.knownToggle = toggle
end



local function CreateMissingToggle( page )
    local toggle = CreateFrame(
        "CheckButton",
        nil,
        page,
        "UICheckButtonTemplate"
    )
    toggle:SetSize( 24, 24 )
    toggle:SetPoint( "LEFT", page.knownToggle, "RIGHT", 65, 0 )
    local text = toggle:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    text:SetPoint( "LEFT", toggle, "RIGHT", 2, 0 )
    text:SetText( "Missing" )
    toggle:SetChecked( true )
    toggle:SetScript( "OnClick", function()
        RefreshTestRecipeSearch( page )
    end )

    page.missingToggle = toggle
end

local function GetAvailableCharacters()
    local characters = {}
    for characterKey, character in pairs( ns.Characters:_SmashNGrab() ) do
        local rulesetEnabled =
            character.realm and
            character.realm.ruleset and
            PLRDB.rulesets[ character.realm.ruleset ] ~= false
        if rulesetEnabled then
            table.insert(
                characters,
                {
                    key = characterKey,
                    character = character,
                }
            )
        end
    end
    table.sort( characters, function( a, b )
        if a.character.name ~= b.character.name then
            return a.character.name < b.character.name
        end
        return a.character.realm.name < b.character.realm.name
    end )
    return characters
end

local function CreateCharacterDropdown( page )
    local dropdown = CreateFrame(
        "DropdownButton",
        nil,
        page.recipesPanel,
        "WowStyle1DropdownTemplate"
    )
    dropdown:SetSize( 180, 30 )
    dropdown:SetPoint( "TOPLEFT", page.recipesPanel, "TOPLEFT", 10, -10 )
    dropdown:SetupMenu( function( dropdown, rootDescription )
        local characters = GetAvailableCharacters()
        for _, characterData in ipairs( characters ) do
            local character = characterData.character
            local characterKey = characterData.key
            local text =
                character.name ..
                " - " ..
                character.realm.name
            rootDescription:CreateRadio(
                text,
                function()
                    return Recipes.selectedCharacter == characterKey
                end,
                function()
                    Recipes.selectedCharacter = characterKey
                    Recipes.selectedProfession = nil

                    dropdown:SetDefaultText( character.name )

                    if page.professionDropdown then
                        page.professionDropdown:SetDefaultText( "Profession" )
                        page.professionDropdown.Text:SetText( "Profession" )
                    end
                end
            )
        end
    end )
    dropdown:SetDefaultText( "Character" )
    page.characterDropdown = dropdown
end

local function CreateProfessionDropdown( page )

    local dropdown = CreateFrame(
        "DropdownButton",
        nil,
        page.recipesPanel,
        "WowStyle1DropdownTemplate"
    )
    dropdown:SetSize( 180, 30 )
    dropdown:SetPoint( "LEFT", page.characterDropdown, "RIGHT", 10, 0 )
    dropdown:SetupMenu( function( dropdown, rootDescription )
        if not Recipes.selectedCharacter then
            return
        end
        local characters = ns.Characters:_SmashNGrab()
        local character = characters[ Recipes.selectedCharacter ]
        if not character or not character.professions then
            return
        end
        local professions = {}
        for skillLineID, profession in pairs( character.professions ) do
            table.insert(
                professions,
                {
                    skillLineID = skillLineID,
                    profession = profession,
                }
            )
        end
        table.sort( professions, function( a, b )
            return a.profession.name < b.profession.name
        end )
        for _, professionData in ipairs( professions ) do
            local profession = professionData.profession
            local skillLineID = professionData.skillLineID
            rootDescription:CreateRadio(
                profession.name,
                function()
                    return Recipes.selectedProfession == skillLineID
                end,
                function()
                    Recipes.selectedProfession = skillLineID
                    dropdown:SetDefaultText( profession.name )
                end
            )
        end
    end )
    dropdown:SetDefaultText( "Profession" )
    page.professionDropdown = dropdown
end

local function CreateSourceDropdown( page )

    local dropdown = CreateFrame(
        "DropdownButton",
        nil,
        page.recipesPanel,
        "WowStyle1DropdownTemplate"
    )
    dropdown:SetSize( 150, 30 )
    dropdown:SetPoint( "LEFT", page.professionDropdown, "RIGHT", 10, 0 )
    dropdown:SetupMenu( function( dropdown, rootDescription )
        rootDescription:CreateRadio(
            "All Sources",
            function()
                return Recipes.selectedSource == nil
            end,
            function()
                Recipes.selectedSource = nil
                dropdown:SetDefaultText( "All Sources" )
            end
        )
        local sources = {
            { name = "Crafted", value = "crafted" },
            { name = "Drop", value = "drop" },
            { name = "Quest", value = "quest" },
            { name = "Vendor", value = "vendor" },
            { name = "Trainer", value = "trainer" },
            { name = "Unknown", value = "unknown" },
        }
        for _, source in ipairs( sources ) do
            rootDescription:CreateRadio(
                source.name,
                function()
                    return Recipes.selectedSource == source.value
                end,
                function()

                    Recipes.selectedSource = source.value
                    dropdown:SetDefaultText( source.name )
                end
            )
        end
    end )
    dropdown:SetDefaultText( "Source" )
    page.sourceDropdown = dropdown
end

local function CreateSearchBox( page )

    local searchBox = CreateFrame(
        "EditBox",
        nil,
        page.recipesPanel,
        "SearchBoxTemplate"
    )
    searchBox:SetSize( 200, 30 )
    searchBox:SetPoint( "LEFT", page.sourceDropdown, "RIGHT", 10, 0 )
    searchBox:SetAutoFocus( false )
    searchBox:SetScript( "OnTextChanged", function( self )
    Recipes.searchText = self:GetText() or ""
        if self.Instructions then
            self.Instructions:SetShown( Recipes.searchText == "" )
        end
        RefreshTestRecipeSearch( page )
    end )
    page.searchBox = searchBox
end

local function CreateRecipeHeader( page )

    local header = CreateFrame(
        "Frame",
        nil,
        page.recipesPanel
    )

    header:SetPoint( "TOPLEFT", page.characterDropdown, "BOTTOMLEFT", 0, -10 )
    header:SetPoint( "RIGHT", page.recipesPanel, "RIGHT", -10, 0 )
    header:SetHeight( 24 )

    local status = header:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    status:SetPoint( "LEFT", header, "LEFT", 5, 0 )
    status:SetWidth( 30 )
    status:SetText( "" )

    local rank = header:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    rank:SetPoint( "LEFT", header, "LEFT", 35, 0 )
    rank:SetWidth( 50 )
    rank:SetJustifyH( "LEFT" )
    rank:SetText( "Rank" )

    local recipe = header:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    recipe:SetPoint( "LEFT", header, "LEFT", 105, 0 )
    recipe:SetWidth( 240 )
    recipe:SetJustifyH( "LEFT" )
    recipe:SetText( "Recipe" )

    local creates = header:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    creates:SetPoint( "LEFT", header, "LEFT", 355, 0 )
    creates:SetWidth( 200 )
    creates:SetJustifyH( "LEFT" )
    creates:SetText( "Creates" )

    local source = header:CreateFontString( nil, "OVERLAY", "GameFontNormal" )
    source:SetPoint( "LEFT", header, "LEFT", 625, 0 )
    source:SetWidth( 170 )
    source:SetJustifyH( "LEFT" )
    source:SetText( "Source" )

    page.recipeHeader = header
end

local function CreateTestRecipeRow( page, index, known, rankText, recipeText, createsText, sourceText )

    local row = CreateFrame(
        "Frame",
        nil,
        page.recipesPanel
    )

    row:SetPoint( "TOPLEFT", page.recipeHeader, "BOTTOMLEFT", 0, -2 - ( ( index - 1 ) * 28 ) )
    row:SetPoint( "RIGHT", page.recipeHeader, "RIGHT", 0, 0 )
    row:SetHeight( 28 )

    local status = row:CreateTexture( nil, "ARTWORK" )
    status:SetSize( 16, 16 )
    status:SetPoint( "LEFT", row, "LEFT", 5, 0 )

    if known then
        status:SetTexture( "Interface\\RaidFrame\\ReadyCheck-Ready" )
    else
        status:SetTexture( "Interface\\RaidFrame\\ReadyCheck-NotReady" )
    end

    local rank = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    rank:SetPoint( "LEFT", row, "LEFT", 35, 0 )
    rank:SetWidth( 50 )
    rank:SetJustifyH( "LEFT" )
    rank:SetText( rankText )

    local recipe = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    recipe:SetPoint( "LEFT", row, "LEFT", 105, 0 )
    recipe:SetWidth( 240 )
    recipe:SetJustifyH( "LEFT" )
    recipe:SetText( recipeText )

    local creates = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    creates:SetPoint( "LEFT", row, "LEFT", 355, 0 )
    creates:SetWidth( 200 )
    creates:SetJustifyH( "LEFT" )
    creates:SetText( createsText )

    local source = row:CreateFontString( nil, "OVERLAY", "GameFontHighlight" )
    source:SetPoint( "LEFT", row, "LEFT", 625, 0 )
    source:SetWidth( 170 )
    source:SetJustifyH( "LEFT" )
    source:SetText( sourceText )

    return row
end

function Recipes:Create( page )
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
    CreateRecipesPanel( page )
    CreateKnownToggle( page )
    CreateMissingToggle( page )
    CreateCharacterDropdown( page )
    CreateProfessionDropdown( page )
    CreateSourceDropdown( page )
    CreateSearchBox( page )
    CreateRecipeHeader( page )   
    page.testKnownRecipe = CreateTestRecipeRow( page, 1, true, "125", "Test Known Recipe", "Test Crafted Item", "Trainer" )
    page.testMissingRecipe =CreateTestRecipeRow( page, 2, false, "150", "Test Missing Recipe", "Another Crafted Item", "Vendor (Test NPC)")
end
