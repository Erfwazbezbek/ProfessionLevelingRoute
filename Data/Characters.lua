-- Characters.lua

local ADDON, ns = ...
local Characters = {}
ns.Characters = Characters

local function GetCharacterProfessions()

    local professions = {}
    if not GetProfessions or not GetProfessionInfo then
        return professions
    end

    local profession1,
          profession2,
          fishing,
          cooking =
        GetProfessions()

    local professionIndexes = {
        profession1,
        profession2,
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
                  specializationOffset =
                GetProfessionInfo(
                    professionIndex
                )
            if skillLine then
                professions[ skillLine ] = 
                    {
                        skillLineID = skillLine,
                        name = name,
                        icon = icon,
                        skillLevel = skillLevel,
                        maxSkillLevel = maxSkillLevel,
                    }
            end
        end
    end
    return professions
end


function Characters:GetCurrentCharacter()

    local name = UnitName( "player" )
    local realm = GetRealmName()
    local faction = UnitFactionGroup( "player" )
    local className, classFile, classID =
        UnitClass( "player" )
    local level =
        UnitLevel( "player" )
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
        professions = GetCharacterProfessions(),
    }
    return character
end