-- Characters.lua

local ADDON, ns = ...
local Characters = {}
ns.Characters = Characters

local function _CharProf()

    local professions = {}
    if not GetProfessions or not GetProfessionInfo then
        return professions
    end

    local prof1,
          prof2,
          firstaid,
          fishing,
          cooking =
        GetProfessions()

    local professionIndexes = {
        prof1,
        prof2,
        firstaid,
        fishing,
        cooking,
    }
for _, professionIndex in pairs( professionIndexes ) do
        if professionIndex then
            local name,
                  icon,
                  skillLevel,
                  maxSkillLevel,
                  numAbilities,
                  spellOffset,
                  skillLine,
                  skillModifier,
                  specializationIndex,
                  specializationOffset,
                  skillLineName =
                GetProfessionInfo( professionIndex )
            if skillLine then
                professions[ skillLine ] = 
                    {
                        skillLineID = skillLine,
                        name = name,
                        skillLevel = skillLevel,
                        maxSkillLevel = maxSkillLevel,
                        skillLineName = skillLineName
                    }
            end
        end
    end
    return professions
end

function Characters:_Char()
    local firstName = UnitName( "player" )
    local fullName = GetUnitName( "player", true ) or firstName
    local guid = UnitGUID( "player" )
    local realm = {
        id = GetRealmID(),
        nativeID = GetNativeRealmID(),
        name = GetRealmName(),
        normalizedName = GetNormalizedRealmName(),
    }
    realm.ruleset = ns.Realms:GetRuleset()
    local faction = UnitFactionGroup( "player" )
    local className, classFile, classID = UnitClass( "player" )
    local level = UnitLevel( "player" )
    
    local character = {
        name = fullName,
        firstName = firstName,
        fullName = fullName,
        guid = guid,
        realm = realm,
        faction = faction,
        class = 
            {
                name = className,
                file = classFile,
                id = classID,
            },
        level = level,
        professions = _CharProf(),
    }
    return character
end

-- Validate only the containers owned by PLR. Never discard valid character data.
local function EnsureTable(parent, key)
    if type(parent[key]) ~= "table" then parent[key] = {} end
    return parent[key]
end

function Characters:_InitAmIRight()
    if type(PLRDB) ~= "table" then PLRDB = {} end
    EnsureTable(PLRDB, "characters")
    EnsureTable(PLRDB, "trackedRecipes")
    local rules = EnsureTable(PLRDB, "rulesets")
    for _, ruleset in ipairs({ "Normal", "PvP", "RP", "RPPVP", "HC" }) do
        if type(rules[ruleset]) ~= "boolean" then rules[ruleset] = true end
    end
    EnsureTable(PLRDB, "plannerSettings")
    EnsureTable(PLRDB, "plannerRecipeSelections")
    EnsureTable(PLRDB, "plannerInventory")
    if type(PLRCDB) ~= "table" then PLRCDB = {} end
end

function Characters:_CharKey( character )
    return character.guid or ( character.fullName or character.name ) .. "-" .. character.realm.id
end

function Characters:_Ctrl_S_Char()
    self:_InitAmIRight()
    local character = self:_Char()
    local characterKey = self:_CharKey( character )
    local savedCharacter = PLRDB.characters[ characterKey ]
    local legacyKey = character.firstName .. "-" .. character.realm.id
    local legacyCharacter = PLRDB.characters[ legacyKey ]

    -- Only migrate legacy data when its identity can be verified.
    -- First-name-only keys can represent multiple Forever characters.
    if not savedCharacter and legacyCharacter and
       ( legacyCharacter.guid == character.guid or
         legacyCharacter.fullName == character.fullName ) then
        savedCharacter = legacyCharacter
        PLRDB.characters[ legacyKey ] = nil
    end

    if savedCharacter and savedCharacter.recipeKnowledge then
        character.recipeKnowledge = savedCharacter.recipeKnowledge
    end
    PLRDB.characters[ characterKey ] = character
    return character
end

function Characters:_Cookbook( skillLineID, recipeIDs )
    if not skillLineID or not recipeIDs then
        return
    end
    self:_InitAmIRight()
    local currentCharacter = self:_Char()
    local characterKey = self:_CharKey( currentCharacter )
    local character = PLRDB.characters[ characterKey ]
    if not character then
        return
    end
    character.recipeKnowledge = character.recipeKnowledge or {}
    local cookbook = {}
    for _, recipeID in ipairs( recipeIDs ) do
        local recipeInfo = C_TradeSkillUI.GetRecipeInfo( recipeID )
        if recipeInfo then
            cookbook[ recipeID ] = {
                learned = recipeInfo.learned,
                relativeDifficulty = recipeInfo.relativeDifficulty,
                canSkillUp = recipeInfo.canSkillUp,
                numSkillUps = recipeInfo.numSkillUps,
            }
        end
    end
    local savedCookbook = character.recipeKnowledge[ skillLineID ]
    local changed = false

    if not savedCookbook then
        changed = true
    else
        for recipeID, recipeState in pairs( cookbook ) do
            local savedState = savedCookbook[ recipeID ]

            if not savedState or
            savedState.learned ~= recipeState.learned or
            savedState.relativeDifficulty ~= recipeState.relativeDifficulty or
            savedState.canSkillUp ~= recipeState.canSkillUp or
            savedState.numSkillUps ~= recipeState.numSkillUps then
                changed = true
                break
            end
        end

        if not changed then
            for recipeID in pairs( savedCookbook ) do
                if not cookbook[ recipeID ] then
                    changed = true
                    break
                end
            end
        end
    end

    if changed then
        character.recipeKnowledge[ skillLineID ] = cookbook
    end
end

function Characters:_SmashNGrab()
    self:_InitAmIRight()
    return PLRDB.characters
end

local function _WhoseOrderIsThis( recipeIDs )
    if not recipeIDs or not recipeIDs[ 1 ] then
        return
    end
    local professionInfo = C_TradeSkillUI.GetProfessionInfoByRecipeID( recipeIDs[ 1 ] )
    if not professionInfo then
        return
    end
    local skillLineID = professionInfo.parentProfessionID or professionInfo.professionID
    return professionInfo.professionName, skillLineID
end

-- Retail recipe APIs are optional: the roster must still load on other clients.
local function CanReadRecipes()
    return type(C_TradeSkillUI) == "table"
        and type(C_TradeSkillUI.GetAllRecipeIDs) == "function"
        and type(C_TradeSkillUI.GetRecipeInfo) == "function"
        and type(C_TradeSkillUI.GetProfessionInfoByRecipeID) == "function"
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LOGIN")
if CanReadRecipes() then
    pcall(eventFrame.RegisterEvent, eventFrame, "TRADE_SKILL_LIST_UPDATE")
end
eventFrame:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_LOGIN" then
        Characters:_Ctrl_S_Char()
        if ns.Roster and ns.Roster.page then
            ns.Roster:RefreshCharacters(ns.Roster.page)
        end
    elseif event == "TRADE_SKILL_LIST_UPDATE" and CanReadRecipes() then
        local ok, recipeIDs = pcall(C_TradeSkillUI.GetAllRecipeIDs)
        if not ok or type(recipeIDs) ~= "table" or #recipeIDs == 0 then return end
        local okProfession, professionName, skillLineID = pcall(_WhoseOrderIsThis, recipeIDs)
        if okProfession and skillLineID then
            pcall(Characters._Cookbook, Characters, skillLineID, recipeIDs)
        end
    end
end)
