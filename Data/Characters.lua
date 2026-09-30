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
    for _, professionIndex in ipairs( professionIndexes ) do
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
    local name = UnitName( "player" )
    local realm = GetRealmName()
    local faction = UnitFactionGroup( "player" )
    local className, classFile, classID = UnitClass( "player" )
    local level = UnitLevel( "player" )
    
    local character = {
        name = name,
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

function Characters:_InitAmIRight()
    if not PLRDB then PLRDB = {} end
    if not PLRDB.characters then PLRDB.characters = {} end
    if not PLRCDB then PLRCDB = {} end
end

function Characters:_CharKey( character )
    return character.name .. "-" .. character.realm
end

function Characters:_Ctrl_S_Char()
    self:_InitAmIRight()
    local character = self:_Char()
    local characterKey = self:_CharKey( character )
    PLRDB.characters[ characterKey ] = character
    return character
end

function Characters:_SmashNGrab()
    self:_InitAmIRight()
    return PLRDB.characters
end

local eventFrame = CreateFrame( "Frame" )
eventFrame:RegisterEvent( "PLAYER_LOGIN" )
eventFrame:SetScript( "OnEvent", function( self, event )
    if event == "PLAYER_LOGIN" then
        Characters:_Ctrl_S_Char()
        if ns.Roster and ns.Roster.page then
            ns.Roster:RefreshCharacters( ns.Roster.page )
        end
    end
end)
