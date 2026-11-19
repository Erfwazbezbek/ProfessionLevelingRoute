local ADDON, ns = ...

ns.RecipeData = ns.RecipeData or {}

ns.RecipeData[ "First Aid" ] = {

    [3275] = { -- Linen Bandage
        difficulty = {
            learnedAt = 30,
            orange = 30,
            yellow = 45,
            green = 60,
        },
        sources = {},
        recipeItems = {},
    },

    [3276] = { -- Heavy Linen Bandage
        difficulty = {
            learnedAt = 40,
            orange = 50,
            yellow = 75,
            green = 100,
        },
        sources = {
            { type = "trainer", trainingCost = 105 },
        },
        recipeItems = {},
    },

    [3277] = { -- Wool Bandage
        difficulty = {
            learnedAt = 80,
            orange = 80,
            yellow = 115,
            green = 150,
        },
        sources = {
            { type = "trainer", trainingCost = 250 },
        },
        recipeItems = {},
    },

    [3278] = { -- Heavy Wool Bandage
        difficulty = {
            learnedAt = 115,
            orange = 115,
            yellow = 150,
            green = 185,
        },
        sources = {
            { type = "trainer", trainingCost = 1000 },
        },
        recipeItems = {},
    },

    [7928] = { -- Silk Bandage
        difficulty = {
            learnedAt = 150,
            orange = 150,
            yellow = 180,
            green = 210,
        },
        sources = {
            { type = "trainer", trainingCost = 5000 },
        },
        recipeItems = {},
    },

    [7929] = { -- Heavy Silk Bandage
        difficulty = {
            learnedAt = 180,
            orange = 180,
            yellow = 210,
            green = 240,
        },
        sources = {},
        recipeItems = {},
    },

    [7934] = { -- Anti-Venom
        difficulty = {
            learnedAt = 80,
            orange = 80,
            yellow = 115,
            green = 150,
        },
        sources = {
            { type = "trainer", trainingCost = 263 },
        },
        recipeItems = {},
    },

    [7935] = { -- Strong Anti-Venom
        difficulty = {
            learnedAt = 130,
            orange = 130,
            yellow = 165,
            green = 200,
        },
        sources = {},
        recipeItems = {},
    },

    [10840] = { -- Mageweave Bandage
        difficulty = {
            learnedAt = 210,
            orange = 210,
            yellow = 240,
            green = 270,
        },
        sources = {},
        recipeItems = {},
    },

    [10841] = { -- Heavy Mageweave Bandage
        difficulty = {
            learnedAt = 240,
            orange = 240,
            yellow = 270,
            green = 300,
        },
        sources = {},
        recipeItems = {},
    },

    [18629] = { -- Runecloth Bandage
        difficulty = {
            learnedAt = 260,
            orange = 260,
            yellow = 290,
            green = 320,
        },
        sources = {},
        recipeItems = {},
    },

    [18630] = { -- Heavy Runecloth Bandage
        difficulty = {
            learnedAt = 290,
            orange = 290,
            yellow = 320,
            green = 350,
        },
        sources = {},
        recipeItems = {},
    },

    [23787] = { -- Powerful Anti-Venom
        difficulty = {
            learnedAt = 300,
            orange = 300,
            yellow = 330,
            green = 360,
        },
        sources = {},
        recipeItems = {},
    },

    [1244431] = { -- Minor Healing Potion
        difficulty = {
            learnedAt = 1,
            orange = 55,
            yellow = 75,
            green = 95,
        },
        sources = {
            { type = "trainer", trainingCost = 105 },
        },
        recipeItems = {},
    },

    [1244432] = { -- Lesser Healing Potion
        difficulty = {
            learnedAt = 55,
            orange = 85,
            yellow = 105,
            green = 125,
        },
        sources = {
            { type = "trainer", trainingCost = 157 },
        },
        recipeItems = {},
    },

    [1244433] = { -- Healing Potion
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 155,
            green = 175,
        },
        sources = {
            { type = "trainer", trainingCost = 842 },
        },
        recipeItems = {},
    },

    [1244434] = { -- Greater Healing Potion
        difficulty = {
            learnedAt = 175,
            orange = 175,
            yellow = 195,
            green = 215,
        },
        sources = {},
        recipeItems = {},
    },

    [1244435] = { -- Superior Healing Potion
        difficulty = {
            learnedAt = 230,
            orange = 230,
            yellow = 250,
            green = 270,
        },
        sources = {},
        recipeItems = {},
    },

    [1244436] = { -- Major Healing Potion
        difficulty = {
            learnedAt = 290,
            orange = 290,
            yellow = 310,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1259349] = { -- Surgical Tourniquet
        difficulty = {
            learnedAt = 280,
            orange = 280,
            yellow = 310,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1259348] = { -- Leather Tourniquet
        difficulty = {
            learnedAt = 220,
            orange = 220,
            yellow = 250,
            green = 280,
        },
        sources = {},
        recipeItems = {},
    },

    [1259347] = { -- Woolen Tourniquet
        difficulty = {
            learnedAt = 120,
            orange = 120,
            yellow = 155,
            green = 190,
        },
        sources = {
            { type = "trainer", trainingCost = 1263 },
        },
        recipeItems = {},
    },

    [1259345] = { -- Powerful Poultice
        difficulty = {
            learnedAt = 295,
            orange = 295,
            yellow = 325,
            green = 355,
        },
        sources = {},
        recipeItems = {},
    },

    [1259344] = { -- Superior Poultice
        difficulty = {
            learnedAt = 225,
            orange = 225,
            yellow = 255,
            green = 285,
        },
        sources = {},
        recipeItems = {},
    },

    [1259343] = { -- Clever Poultice
        difficulty = {
            learnedAt = 160,
            orange = 160,
            yellow = 190,
            green = 220,
        },
        sources = {},
        recipeItems = {},
    },

    [1259342] = { -- Simple Poultice
        difficulty = {
            learnedAt = 90,
            orange = 90,
            yellow = 125,
            green = 160,
        },
        sources = {
            { type = "trainer", trainingCost = 263 },
        },
        recipeItems = {},
    },

    [1259341] = { -- Potent Anti-Venom
        difficulty = {
            learnedAt = 230,
            orange = 230,
            yellow = 260,
            green = 290,
        },
        sources = {},
        recipeItems = {},
    },


}
