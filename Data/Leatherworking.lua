local ADDON, ns = ...

ns.RecipeData = ns.RecipeData or {}

ns.RecipeData[ "Leatherworking" ] = {
    [2149] = {
        difficulty = {
            learnedAt = 40,
            orange = 40,
            yellow = 55,
            green = 70,
        },
        sources = {},
        recipeItems = {},
    },

    [2153] = {
        difficulty = {
            learnedAt = 15,
            orange = 45,
            yellow = 60,
            green = 75,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 50,
            },
        },
        recipeItems = {},
    },

    [2152] = {
        difficulty = {
            learnedAt = 30,
            orange = 30,
            yellow = 45,
            green = 60,
        },
        sources = {},
        recipeItems = {},
    },

    [2158] = {
        difficulty = {
            learnedAt = 65,
            orange = 95,
            yellow = 110,
            green = 125,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:16",
            },
            {
                type = "unknown:21",
            },
        },
        recipeItems = {
            {
                itemID = 2406,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:16",
                    },
                    {
                        type = "unknown:21",
                    },
                },
            },
        },
    },

    [2159] = {
        difficulty = {
            learnedAt = 50,
            orange = 70,
            yellow = 85,
            green = 100,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 250,
            },
        },
        recipeItems = {},
    },

    [2160] = {
        difficulty = {
            learnedAt = 35,
            orange = 65,
            yellow = 80,
            green = 95,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 100,
            },
        },
        recipeItems = {},
    },

    [2161] = {
        difficulty = {
            learnedAt = 50,
            orange = 80,
            yellow = 95,
            green = 110,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 100,
            },
        },
        recipeItems = {},
    },

    [2162] = {
        difficulty = {
            learnedAt = 40,
            orange = 70,
            yellow = 85,
            green = 100,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 100,
            },
        },
        recipeItems = {},
    },

    [2163] = {
        difficulty = {
            learnedAt = 40,
            orange = 70,
            yellow = 85,
            green = 100,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:16",
            },
            {
                type = "unknown:21",
            },
        },
        recipeItems = {
            {
                itemID = 2407,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:16",
                    },
                    {
                        type = "unknown:21",
                    },
                },
            },
        },
    },

    [2164] = {
        difficulty = {
            learnedAt = 50,
            orange = 80,
            yellow = 95,
            green = 110,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:21",
            },
        },
        recipeItems = {
            {
                itemID = 2408,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:21",
                    },
                },
            },
        },
    },

    [2165] = {
        difficulty = {
            learnedAt = 75,
            orange = 90,
            yellow = 97,
            green = 105,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 250,
            },
        },
        recipeItems = {},
    },

    [2166] = {
        difficulty = {
            learnedAt = 95,
            orange = 120,
            yellow = 132,
            green = 145,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 450,
            },
        },
        recipeItems = {},
    },

    [2167] = {
        difficulty = {
            learnedAt = 75,
            orange = 100,
            yellow = 112,
            green = 125,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 350,
            },
        },
        recipeItems = {},
    },

    [2168] = {
        difficulty = {
            learnedAt = 85,
            orange = 110,
            yellow = 122,
            green = 135,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 350,
            },
        },
        recipeItems = {},
    },

    [2169] = {
        difficulty = {
            learnedAt = 75,
            orange = 100,
            yellow = 112,
            green = 125,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:16",
            },
        },
        recipeItems = {
            {
                itemID = 2409,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:16",
                    },
                },
            },
        },
    },

    [2881] = {
        difficulty = {
            learnedAt = 20,
            orange = 20,
            yellow = 30,
            green = 40,
        },
        sources = {},
        recipeItems = {},
    },

    [3753] = {
        difficulty = {
            learnedAt = 25,
            orange = 55,
            yellow = 70,
            green = 85,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 75,
            },
        },
        recipeItems = {},
    },

    [3756] = {
        difficulty = {
            learnedAt = 40,
            orange = 70,
            yellow = 85,
            green = 100,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 150,
            },
        },
        recipeItems = {},
    },

    [3759] = {
        difficulty = {
            learnedAt = 50,
            orange = 80,
            yellow = 95,
            green = 110,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 200,
            },
        },
        recipeItems = {},
    },

    [3760] = {
        difficulty = {
            learnedAt = 125,
            orange = 145,
            yellow = 155,
            green = 165,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 600,
            },
        },
        recipeItems = {},
    },

    [3761] = {
        difficulty = {
            learnedAt = 60,
            orange = 90,
            yellow = 105,
            green = 120,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 350,
            },
        },
        recipeItems = {},
    },

    [3762] = {
        difficulty = {
            learnedAt = 75,
            orange = 100,
            yellow = 112,
            green = 125,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:21",
            },
        },
        recipeItems = {
            {
                itemID = 4293,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:21",
                    },
                },
            },
        },
    },

    [3763] = {
        difficulty = {
            learnedAt = 55,
            orange = 85,
            yellow = 100,
            green = 115,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 300,
            },
        },
        recipeItems = {},
    },

    [3764] = {
        difficulty = {
            learnedAt = 120,
            orange = 145,
            yellow = 157,
            green = 170,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {},
    },

    [3765] = {
        difficulty = {
            learnedAt = 95,
            orange = 140,
            yellow = 152,
            green = 165,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 7360,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [3766] = {
        difficulty = {
            learnedAt = 100,
            orange = 125,
            yellow = 137,
            green = 150,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 400,
            },
        },
        recipeItems = {},
    },

    [3767] = {
        difficulty = {
            learnedAt = 95,
            orange = 125,
            yellow = 137,
            green = 150,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:16",
            },
        },
        recipeItems = {
            {
                itemID = 4294,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:16",
                    },
                },
            },
        },
    },

    [3768] = {
        difficulty = {
            learnedAt = 105,
            orange = 130,
            yellow = 142,
            green = 155,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {},
    },

    [3769] = {
        difficulty = {
            learnedAt = 115,
            orange = 140,
            yellow = 152,
            green = 165,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 4296,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [3770] = {
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 147,
            green = 160,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {},
    },

    [3771] = {
        difficulty = {
            learnedAt = 125,
            orange = 150,
            yellow = 160,
            green = 170,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 4297,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [3772] = {
        difficulty = {
            learnedAt = 130,
            orange = 150,
            yellow = 160,
            green = 170,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 7613,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [3773] = {
        difficulty = {
            learnedAt = 150,
            orange = 170,
            yellow = 180,
            green = 190,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:16",
            },
        },
        recipeItems = {
            {
                itemID = 4299,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:16",
                    },
                },
            },
        },
    },

    [3774] = {
        difficulty = {
            learnedAt = 135,
            orange = 155,
            yellow = 165,
            green = 175,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 900,
            },
        },
        recipeItems = {},
    },

    [3775] = {
        difficulty = {
            learnedAt = 145,
            orange = 165,
            yellow = 175,
            green = 185,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {},
    },

    [3776] = {
        difficulty = {
            learnedAt = 155,
            orange = 175,
            yellow = 185,
            green = 195,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1080,
            },
        },
        recipeItems = {},
    },

    [3777] = {
        difficulty = {
            learnedAt = 170,
            orange = 190,
            yellow = 200,
            green = 210,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {},
    },

    [3778] = {
        difficulty = {
            learnedAt = 160,
            orange = 180,
            yellow = 190,
            green = 200,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 14635,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [3779] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 205,
            green = 215,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:21",
            },
        },
        recipeItems = {
            {
                itemID = 4301,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:21",
                    },
                },
            },
        },
    },

    [3816] = {
        difficulty = {
            learnedAt = 30,
            orange = 50,
            yellow = 60,
            green = 70,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 50,
            },
        },
        recipeItems = {},
    },

    [3817] = {
        difficulty = {
            learnedAt = 75,
            orange = 90,
            yellow = 97,
            green = 105,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 200,
            },
        },
        recipeItems = {},
    },

    [3818] = {
        difficulty = {
            learnedAt = 125,
            orange = 135,
            yellow = 140,
            green = 145,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {},
    },

    [3780] = {
        difficulty = {
            learnedAt = 125,
            orange = 145,
            yellow = 155,
            green = 165,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 750,
            },
        },
        recipeItems = {},
    },

    [4097] = {
        difficulty = {
            learnedAt = 140,
            orange = 160,
            yellow = 170,
            green = 180,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 13288,
                faction = 1,
                sources = {
                    {
                        type = "vendor",
                        npcID = 2816,
                        npcName = "Androd Fadran",
                        wowheadZoneID = 45,
                    },
                },
            },
        },
    },

    [4096] = {
        difficulty = {
            learnedAt = 140,
            orange = 160,
            yellow = 170,
            green = 180,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 13287,
                faction = 2,
                sources = {
                    {
                        type = "vendor",
                        npcID = 2819,
                        npcName = "Tunkk",
                        wowheadZoneID = 45,
                    },
                },
            },
        },
    },

    [5244] = {
        difficulty = {
            learnedAt = 35,
            orange = 65,
            yellow = 80,
            green = 95,
        },
        sources = {
            {
                type = "quest",
            },
        },
        recipeItems = {
            {
                itemID = 5083,
                faction = nil,
                sources = {
                    {
                        type = "quest",
                        questID = 769,
                        questName = "Kodo Hide Bag",
                    },
                },
            },
        },
    },

    [6661] = {
        difficulty = {
            learnedAt = 165,
            orange = 185,
            yellow = 195,
            green = 205,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1800,
            },
        },
        recipeItems = {},
    },

    [6702] = {
        difficulty = {
            learnedAt = 65,
            orange = 95,
            yellow = 110,
            green = 125,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 5786,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [6705] = {
        difficulty = {
            learnedAt = 165,
            orange = 185,
            yellow = 195,
            green = 205,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 5789,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [6703] = {
        difficulty = {
            learnedAt = 70,
            orange = 100,
            yellow = 115,
            green = 130,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 5787,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [6704] = {
        difficulty = {
            learnedAt = 145,
            orange = 165,
            yellow = 175,
            green = 185,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 5788,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [7126] = {
        difficulty = {
            learnedAt = 40,
            orange = 40,
            yellow = 55,
            green = 70,
        },
        sources = {},
        recipeItems = {},
    },

    [7133] = {
        difficulty = {
            learnedAt = 80,
            orange = 105,
            yellow = 117,
            green = 130,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 5972,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [7135] = {
        difficulty = {
            learnedAt = 90,
            orange = 115,
            yellow = 127,
            green = 140,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 400,
            },
        },
        recipeItems = {},
    },

    [7147] = {
        difficulty = {
            learnedAt = 135,
            orange = 155,
            yellow = 165,
            green = 175,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1000,
            },
        },
        recipeItems = {},
    },

    [7149] = {
        difficulty = {
            learnedAt = 145,
            orange = 165,
            yellow = 175,
            green = 185,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 5973,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [7151] = {
        difficulty = {
            learnedAt = 150,
            orange = 170,
            yellow = 180,
            green = 190,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1200,
            },
        },
        recipeItems = {},
    },

    [7153] = {
        difficulty = {
            learnedAt = 160,
            orange = 180,
            yellow = 190,
            green = 200,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 5974,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [7156] = {
        difficulty = {
            learnedAt = 165,
            orange = 185,
            yellow = 195,
            green = 205,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2160,
            },
        },
        recipeItems = {},
    },

    [7955] = {
        difficulty = {
            learnedAt = 90,
            orange = 115,
            yellow = 127,
            green = 140,
        },
        sources = {
            {
                type = "quest",
            },
        },
        recipeItems = {
            {
                itemID = 6476,
                faction = nil,
                sources = {
                    {
                        type = "quest",
                        questID = 1487,
                        questName = "Deviate Eradication",
                    },
                },
            },
        },
    },

    [7953] = {
        difficulty = {
            learnedAt = 65,
            orange = 95,
            yellow = 110,
            green = 125,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 6474,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 5783,
                        npcName = "Kalldan Felmoon",
                    },
                },
            },
        },
    },

    [7954] = {
        difficulty = {
            learnedAt = 80,
            orange = 105,
            yellow = 117,
            green = 130,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 6475,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 5783,
                        npcName = "Kalldan Felmoon",
                    },
                },
            },
        },
    },

    [8322] = {
        difficulty = {
            learnedAt = 65,
            orange = 90,
            yellow = 105,
            green = 120,
        },
        sources = {
            {
                type = "quest",
            },
        },
        recipeItems = {
            {
                itemID = 6710,
                faction = nil,
                sources = {
                    {
                        type = "quest",
                        questID = 1582,
                        questName = "Moonglow Vest",
                    },
                },
            },
        },
    },

    [9058] = {
        difficulty = {
            learnedAt = 40,
            orange = 40,
            yellow = 55,
            green = 70,
        },
        sources = {},
        recipeItems = {},
    },

    [9059] = {
        difficulty = {
            learnedAt = 40,
            orange = 40,
            yellow = 55,
            green = 70,
        },
        sources = {},
        recipeItems = {},
    },

    [9060] = {
        difficulty = {
            learnedAt = 25,
            orange = 55,
            yellow = 70,
            green = 85,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 100,
            },
        },
        recipeItems = {},
    },

    [9062] = {
        difficulty = {
            learnedAt = 25,
            orange = 55,
            yellow = 70,
            green = 85,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 100,
            },
        },
        recipeItems = {},
    },

    [9064] = {
        difficulty = {
            learnedAt = 30,
            orange = 60,
            yellow = 75,
            green = 90,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:16",
            },
            {
                type = "unknown:21",
            },
        },
        recipeItems = {
            {
                itemID = 7288,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:16",
                    },
                    {
                        type = "unknown:21",
                    },
                },
            },
        },
    },

    [9065] = {
        difficulty = {
            learnedAt = 45,
            orange = 75,
            yellow = 90,
            green = 105,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 150,
            },
        },
        recipeItems = {},
    },

    [9068] = {
        difficulty = {
            learnedAt = 70,
            orange = 100,
            yellow = 115,
            green = 130,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 400,
            },
        },
        recipeItems = {},
    },

    [9070] = {
        difficulty = {
            learnedAt = 75,
            orange = 100,
            yellow = 112,
            green = 125,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 7289,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [9072] = {
        difficulty = {
            learnedAt = 95,
            orange = 120,
            yellow = 132,
            green = 145,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 7290,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [9074] = {
        difficulty = {
            learnedAt = 95,
            orange = 120,
            yellow = 132,
            green = 145,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {},
    },

    [9145] = {
        difficulty = {
            learnedAt = 100,
            orange = 125,
            yellow = 137,
            green = 150,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {},
    },

    [9146] = {
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 147,
            green = 160,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 7361,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 6731,
                        npcName = "Harlown Darkweave",
                        wowheadZoneID = 331,
                    },
                },
            },
        },
    },

    [9147] = {
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 147,
            green = 160,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 7362,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 3537,
                        npcName = "Zixil",
                        wowheadZoneID = 267,
                    },
                },
            },
        },
    },

    [9148] = {
        difficulty = {
            learnedAt = 115,
            orange = 140,
            yellow = 152,
            green = 165,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 7363,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [9149] = {
        difficulty = {
            learnedAt = 120,
            orange = 145,
            yellow = 157,
            green = 170,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 7364,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [9193] = {
        difficulty = {
            learnedAt = 125,
            orange = 145,
            yellow = 155,
            green = 165,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {},
    },

    [9194] = {
        difficulty = {
            learnedAt = 125,
            orange = 145,
            yellow = 155,
            green = 165,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {},
    },

    [9195] = {
        difficulty = {
            learnedAt = 140,
            orange = 160,
            yellow = 170,
            green = 180,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 7449,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [9196] = {
        difficulty = {
            learnedAt = 150,
            orange = 170,
            yellow = 180,
            green = 190,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1350,
            },
        },
        recipeItems = {},
    },

    [9197] = {
        difficulty = {
            learnedAt = 150,
            orange = 170,
            yellow = 180,
            green = 190,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 7450,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [9198] = {
        difficulty = {
            learnedAt = 155,
            orange = 175,
            yellow = 185,
            green = 195,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1800,
            },
        },
        recipeItems = {},
    },

    [9201] = {
        difficulty = {
            learnedAt = 160,
            orange = 180,
            yellow = 190,
            green = 200,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1800,
            },
        },
        recipeItems = {},
    },

    [9202] = {
        difficulty = {
            learnedAt = 165,
            orange = 185,
            yellow = 195,
            green = 205,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 7451,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [9206] = {
        difficulty = {
            learnedAt = 170,
            orange = 190,
            yellow = 200,
            green = 210,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2250,
            },
        },
        recipeItems = {},
    },

    [9207] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 205,
            green = 215,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:21",
            },
        },
        recipeItems = {
            {
                itemID = 7452,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:21",
                    },
                },
            },
        },
    },

    [9208] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 205,
            green = 215,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 7453,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [10482] = {
        difficulty = {
            learnedAt = 200,
            orange = 200,
            yellow = 0,
            green = 0,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1800,
            },
        },
        recipeItems = {},
    },

    [10487] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 205,
            green = 215,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1800,
            },
        },
        recipeItems = {},
    },

    [10490] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 205,
            green = 215,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 8384,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [10499] = {
        difficulty = {
            learnedAt = 180,
            orange = 200,
            yellow = 210,
            green = 220,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 3000,
            },
        },
        recipeItems = {},
    },

    [10507] = {
        difficulty = {
            learnedAt = 180,
            orange = 200,
            yellow = 210,
            green = 220,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 3000,
            },
        },
        recipeItems = {},
    },

    [10509] = {
        difficulty = {
            learnedAt = 180,
            orange = 200,
            yellow = 210,
            green = 220,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
            {
                type = "unknown:16",
            },
        },
        recipeItems = {},
    },

    [10511] = {
        difficulty = {
            learnedAt = 185,
            orange = 205,
            yellow = 215,
            green = 225,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 3000,
            },
        },
        recipeItems = {},
    },

    [10516] = {
        difficulty = {
            learnedAt = 185,
            orange = 205,
            yellow = 215,
            green = 225,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 8409,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [10518] = {
        difficulty = {
            learnedAt = 185,
            orange = 205,
            yellow = 215,
            green = 225,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 3150,
            },
        },
        recipeItems = {},
    },

    [10520] = {
        difficulty = {
            learnedAt = 190,
            orange = 210,
            yellow = 220,
            green = 230,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {},
    },

    [10525] = {
        difficulty = {
            learnedAt = 195,
            orange = 215,
            yellow = 225,
            green = 235,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 8395,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 5618,
                        npcName = "Wastewander Bandit",
                        wowheadZoneID = 440,
                    },
                },
            },
        },
    },

    [10529] = {
        difficulty = {
            learnedAt = 195,
            orange = 215,
            yellow = 225,
            green = 235,
        },
        sources = {
            {
                type = "quest",
            },
        },
        recipeItems = {
            {
                itemID = 8403,
                faction = nil,
                sources = {
                    {
                        type = "quest",
                    },
                },
            },
        },
    },

    [10531] = {
        difficulty = {
            learnedAt = 195,
            orange = 215,
            yellow = 225,
            green = 235,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {},
    },

    [10533] = {
        difficulty = {
            learnedAt = 195,
            orange = 215,
            yellow = 225,
            green = 235,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 8397,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 5617,
                        npcName = "Wastewander Shadow Mage",
                        wowheadZoneID = 440,
                    },
                },
            },
        },
    },

    [10542] = {
        difficulty = {
            learnedAt = 200,
            orange = 220,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 8398,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 5616,
                        npcName = "Wastewander Thief",
                        wowheadZoneID = 440,
                    },
                },
            },
        },
    },

    [10544] = {
        difficulty = {
            learnedAt = 200,
            orange = 220,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "quest",
            },
        },
        recipeItems = {
            {
                itemID = 8404,
                faction = nil,
                sources = {
                    {
                        type = "quest",
                    },
                },
            },
        },
    },

    [10546] = {
        difficulty = {
            learnedAt = 200,
            orange = 220,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "quest",
            },
        },
        recipeItems = {
            {
                itemID = 8405,
                faction = nil,
                sources = {
                    {
                        type = "quest",
                    },
                },
            },
        },
    },

    [10619] = {
        difficulty = {
            learnedAt = 225,
            orange = 225,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 9000,
            },
        },
        recipeItems = {},
    },

    [10621] = {
        difficulty = {
            learnedAt = 200,
            orange = 220,
            yellow = 230,
            green = 240,
        },
        sources = {},
        recipeItems = {},
    },

    [10548] = {
        difficulty = {
            learnedAt = 205,
            orange = 225,
            yellow = 235,
            green = 245,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4000,
            },
        },
        recipeItems = {},
    },

    [10550] = {
        difficulty = {
            learnedAt = nil,
            orange = nil,
            yellow = nil,
            green = nil,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 8388,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [10552] = {
        difficulty = {
            learnedAt = 205,
            orange = 225,
            yellow = 235,
            green = 245,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4000,
            },
        },
        recipeItems = {},
    },

    [10630] = {
        difficulty = {
            learnedAt = 205,
            orange = 225,
            yellow = 235,
            green = 245,
        },
        sources = {},
        recipeItems = {},
    },

    [10554] = {
        difficulty = {
            learnedAt = 210,
            orange = 230,
            yellow = 240,
            green = 250,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 8399,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 5615,
                        npcName = "Wastewander Rogue",
                        wowheadZoneID = 440,
                    },
                },
            },
        },
    },

    [10556] = {
        difficulty = {
            learnedAt = 210,
            orange = 230,
            yellow = 240,
            green = 250,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4500,
            },
        },
        recipeItems = {},
    },

    [10558] = {
        difficulty = {
            learnedAt = 210,
            orange = 230,
            yellow = 240,
            green = 250,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4500,
            },
        },
        recipeItems = {},
    },

    [10560] = {
        difficulty = {
            learnedAt = 215,
            orange = 230,
            yellow = 240,
            green = 250,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 8389,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [10562] = {
        difficulty = {
            learnedAt = 215,
            orange = 235,
            yellow = 245,
            green = 255,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 8390,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [10564] = {
        difficulty = {
            learnedAt = 215,
            orange = 235,
            yellow = 245,
            green = 255,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 8400,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 440,
                    },
                },
            },
        },
    },

    [10566] = {
        difficulty = {
            learnedAt = 220,
            orange = 240,
            yellow = 250,
            green = 260,
        },
        sources = {
            {
                type = "quest",
            },
        },
        recipeItems = {
            {
                itemID = 8406,
                faction = nil,
                sources = {
                    {
                        type = "quest",
                    },
                },
            },
        },
    },

    [10568] = {
        difficulty = {
            learnedAt = 220,
            orange = 240,
            yellow = 250,
            green = 260,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 8401,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 5615,
                        npcName = "Wastewander Rogue",
                        wowheadZoneID = 440,
                    },
                },
            },
        },
    },

    [10570] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 255,
            green = 265,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 8402,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 440,
                    },
                },
            },
        },
    },

    [10572] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 255,
            green = 265,
        },
        sources = {
            {
                type = "quest",
            },
        },
        recipeItems = {
            {
                itemID = 8407,
                faction = nil,
                sources = {
                    {
                        type = "quest",
                    },
                },
            },
        },
    },

    [10574] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 255,
            green = 265,
        },
        sources = {
            {
                type = "quest",
            },
        },
        recipeItems = {
            {
                itemID = 8408,
                faction = nil,
                sources = {
                    {
                        type = "quest",
                    },
                },
            },
        },
    },

    [10632] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 255,
            green = 265,
        },
        sources = {},
        recipeItems = {},
    },

    [10647] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 255,
            green = 265,
        },
        sources = {},
        recipeItems = {},
    },

    [10650] = {
        difficulty = {
            learnedAt = 255,
            orange = 255,
            yellow = 260,
            green = 270,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 9000,
            },
        },
        recipeItems = {},
    },

    [14930] = {
        difficulty = {
            learnedAt = 200,
            orange = 220,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 3240,
            },
        },
        recipeItems = {},
    },

    [14932] = {
        difficulty = {
            learnedAt = 200,
            orange = 220,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 3240,
            },
        },
        recipeItems = {},
    },

    [19047] = {
        difficulty = {
            learnedAt = 225,
            orange = 225,
            yellow = 230,
            green = 235,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 5000,
            },
        },
        recipeItems = {},
    },

    [19058] = {
        difficulty = {
            learnedAt = 225,
            orange = 225,
            yellow = 235,
            green = 245,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 5000,
            },
        },
        recipeItems = {},
    },

    [19048] = {
        difficulty = {
            learnedAt = 255,
            orange = 255,
            yellow = 260,
            green = 270,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15724,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12956,
                        npcName = "Zannok Hidepiercer",
                        wowheadZoneID = 1377,
                    },
                },
            },
        },
    },

    [19049] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15725,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [19050] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15726,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 11874,
                        npcName = "Masat T'andr",
                        wowheadZoneID = 8,
                    },
                },
            },
        },
    },

    [19051] = {
        difficulty = {
            learnedAt = 240,
            orange = 260,
            yellow = 270,
            green = 280,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15727,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 5981,
                        npcName = "Portal Seeker",
                        wowheadZoneID = 4,
                    },
                },
            },
        },
    },

    [19052] = {
        difficulty = {
            learnedAt = 240,
            orange = 260,
            yellow = 270,
            green = 280,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15728,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 6201,
                        npcName = "Legashi Rogue",
                        wowheadZoneID = 16,
                    },
                },
            },
        },
    },

    [19053] = {
        difficulty = {
            learnedAt = 240,
            orange = 260,
            yellow = 270,
            green = 280,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15729,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12957,
                        npcName = "Blimo Gadgetspring",
                        wowheadZoneID = 16,
                    },
                },
            },
        },
    },

    [19054] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15730,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 10363,
                        npcName = "General Drakkisath",
                        wowheadZoneID = 1583,
                    },
                },
            },
        },
    },

    [19055] = {
        difficulty = {
            learnedAt = 245,
            orange = 265,
            yellow = 275,
            green = 285,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15731,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [19059] = {
        difficulty = {
            learnedAt = 245,
            orange = 265,
            yellow = 275,
            green = 285,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15732,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7035,
                        npcName = "Firegut Brute",
                        wowheadZoneID = 46,
                    },
                },
            },
        },
    },

    [19060] = {
        difficulty = {
            learnedAt = 245,
            orange = 265,
            yellow = 275,
            green = 285,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15733,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 5226,
                        npcName = "Murk Worm",
                        wowheadZoneID = 1477,
                    },
                },
            },
        },
    },

    [19061] = {
        difficulty = {
            learnedAt = 245,
            orange = 265,
            yellow = 275,
            green = 285,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15734,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        wowheadZoneID = 357,
                    },
                },
            },
        },
    },

    [19062] = {
        difficulty = {
            learnedAt = 245,
            orange = 265,
            yellow = 275,
            green = 285,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15735,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12958,
                        npcName = "Gigget Zipcoil",
                        wowheadZoneID = 47,
                    },
                },
            },
        },
    },

    [19063] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15737,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [19064] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15738,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7025,
                        npcName = "Blackrock Soldier",
                        wowheadZoneID = 46,
                    },
                },
            },
        },
    },

    [19065] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15739,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7112,
                        npcName = "Jaedenar Cultist",
                        wowheadZoneID = 361,
                    },
                },
            },
        },
    },

    [19066] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15740,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 11189,
                        npcName = "Qia",
                        wowheadZoneID = 618,
                    },
                },
            },
        },
    },

    [19067] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15741,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [19068] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15742,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
            {
                itemID = 20253,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [19070] = {
        difficulty = {
            learnedAt = 255,
            orange = 275,
            yellow = 285,
            green = 295,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:16",
            },
        },
        recipeItems = {
            {
                itemID = 15743,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:16",
                    },
                },
            },
        },
    },

    [19071] = {
        difficulty = {
            learnedAt = 255,
            orange = 275,
            yellow = 285,
            green = 295,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15744,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7107,
                        npcName = "Jadefire Trickster",
                        wowheadZoneID = 361,
                    },
                },
            },
        },
    },

    [19072] = {
        difficulty = {
            learnedAt = 255,
            orange = 275,
            yellow = 285,
            green = 295,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:16",
            },
        },
        recipeItems = {
            {
                itemID = 15745,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:16",
                    },
                },
            },
        },
    },

    [19073] = {
        difficulty = {
            learnedAt = 255,
            orange = 275,
            yellow = 285,
            green = 295,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "unknown:16",
            },
        },
        recipeItems = {
            {
                itemID = 15746,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "unknown:16",
                    },
                },
            },
        },
    },

    [19074] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15747,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7440,
                        npcName = "Winterfall Den Watcher",
                        wowheadZoneID = 618,
                    },
                },
            },
        },
    },

    [19075] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15748,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7027,
                        npcName = "Blackrock Slayer",
                        wowheadZoneID = 46,
                    },
                },
            },
        },
    },

    [19076] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15749,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 9259,
                        npcName = "Firebrand Grunt",
                        wowheadZoneID = 1583,
                    },
                },
            },
        },
    },

    [19077] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15751,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12957,
                        npcName = "Blimo Gadgetspring",
                        wowheadZoneID = 16,
                    },
                },
            },
        },
    },

    [19078] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15752,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7158,
                        npcName = "Deadwood Shaman",
                        wowheadZoneID = 361,
                    },
                },
            },
        },
    },

    [19079] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15753,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 6138,
                        npcName = "Arkkoran Oracle",
                        wowheadZoneID = 16,
                    },
                },
            },
        },
    },

    [19080] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 20254,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 11557,
                        npcName = "Meilosh",
                        wowheadZoneID = 361,
                    },
                },
            },
        },
    },

    [19081] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 295,
            green = 305,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15755,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [19085] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 295,
            green = 305,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15759,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 9499,
                        npcName = "Plugger Spazzring",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [19084] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 295,
            green = 305,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15758,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12959,
                        npcName = "Nergal",
                        wowheadZoneID = 490,
                    },
                },
            },
        },
    },

    [19086] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 295,
            green = 305,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15760,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 2644,
                        npcName = "Vilebranch Hideskinner",
                        wowheadZoneID = 47,
                    },
                },
            },
        },
    },

    [19082] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 295,
            green = 305,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15756,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12941,
                        npcName = "Jase Farlane",
                        wowheadZoneID = 139,
                    },
                },
            },
        },
    },

    [19083] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 295,
            green = 305,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15757,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [19089] = {
        difficulty = {
            learnedAt = 270,
            orange = 290,
            yellow = 300,
            green = 310,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15763,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 6146,
                        npcName = "Cliff Breaker",
                    },
                },
            },
        },
    },

    [19087] = {
        difficulty = {
            learnedAt = 270,
            orange = 290,
            yellow = 300,
            green = 310,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15761,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7441,
                        npcName = "Winterfall Totemic",
                        wowheadZoneID = 618,
                    },
                },
            },
        },
    },

    [19088] = {
        difficulty = {
            learnedAt = 270,
            orange = 290,
            yellow = 300,
            green = 310,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 15762,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12956,
                        npcName = "Zannok Hidepiercer",
                        wowheadZoneID = 1377,
                    },
                },
            },
        },
    },

    [19090] = {
        difficulty = {
            learnedAt = 270,
            orange = 290,
            yellow = 300,
            green = 310,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15764,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 6144,
                        npcName = "Son of Arkkoroc",
                        wowheadZoneID = 16,
                    },
                },
            },
        },
    },

    [19094] = {
        difficulty = {
            learnedAt = 270,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15770,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 8898,
                        npcName = "Anvilrage Marshal",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [19097] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15772,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 490,
                    },
                },
            },
        },
    },

    [19095] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15771,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 1813,
                        npcName = "Decaying Horror",
                        wowheadZoneID = 28,
                    },
                },
            },
        },
    },

    [19093] = {
        difficulty = {
            learnedAt = 320,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [19091] = {
        difficulty = {
            learnedAt = 275,
            orange = 295,
            yellow = 305,
            green = 315,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15765,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [19092] = {
        difficulty = {
            learnedAt = 275,
            orange = 295,
            yellow = 305,
            green = 315,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15768,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 10406,
                        npcName = "Ghoul Ravener",
                        wowheadZoneID = 2017,
                    },
                },
            },
        },
    },

    [19100] = {
        difficulty = {
            learnedAt = 280,
            orange = 300,
            yellow = 310,
            green = 320,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15774,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7029,
                        npcName = "Blackrock Battlemaster",
                        wowheadZoneID = 46,
                    },
                },
            },
        },
    },

    [19102] = {
        difficulty = {
            learnedAt = 285,
            orange = 305,
            yellow = 315,
            green = 325,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15776,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 11582,
                        npcName = "Scholomance Dark Summoner",
                        wowheadZoneID = 2057,
                    },
                },
            },
        },
    },

    [19101] = {
        difficulty = {
            learnedAt = 280,
            orange = 300,
            yellow = 310,
            green = 320,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15775,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 9260,
                        npcName = "Firebrand Legionnaire",
                        wowheadZoneID = 1583,
                    },
                },
            },
        },
    },

    [19098] = {
        difficulty = {
            learnedAt = 280,
            orange = 300,
            yellow = 310,
            green = 320,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15773,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 10499,
                        npcName = "Spectral Researcher",
                        wowheadZoneID = 2057,
                    },
                },
            },
        },
    },

    [19107] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15781,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 8903,
                        npcName = "Anvilrage Captain",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [19104] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15779,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7438,
                        npcName = "Winterfall Ursa",
                        wowheadZoneID = 618,
                    },
                },
            },
        },
    },

    [19106] = {
        difficulty = {
            learnedAt = nil,
            orange = nil,
            yellow = nil,
            green = nil,
        },
        sources = {},
        recipeItems = {},
    },

    [19103] = {
        difficulty = {
            learnedAt = 285,
            orange = 305,
            yellow = 315,
            green = 325,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 15777,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 10425,
                        npcName = "Crimson Battle Mage",
                        wowheadZoneID = 2017,
                    },
                },
            },
        },
    },

    [20648] = {
        difficulty = {
            learnedAt = 75,
            orange = 75,
            yellow = 80,
            green = 85,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {},
    },

    [20649] = {
        difficulty = {
            learnedAt = 125,
            orange = 125,
            yellow = 130,
            green = 135,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1000,
            },
        },
        recipeItems = {},
    },

    [20650] = {
        difficulty = {
            learnedAt = 175,
            orange = 175,
            yellow = 177,
            green = 180,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4000,
            },
        },
        recipeItems = {},
    },

    [20853] = {
        difficulty = {
            learnedAt = 295,
            orange = 315,
            yellow = 325,
            green = 335,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 17022,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12944,
                        npcName = "Lokhtos Darkbargainer",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [20854] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 17023,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12944,
                        npcName = "Lokhtos Darkbargainer",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [20855] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 17025,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12944,
                        npcName = "Lokhtos Darkbargainer",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [21943] = {
        difficulty = {
            learnedAt = 165,
            orange = 185,
            yellow = 195,
            green = 205,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 17722,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [22331] = {
        difficulty = {
            learnedAt = 250,
            orange = 250,
            yellow = 0,
            green = 0,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 5000,
            },
        },
        recipeItems = {},
    },

    [22711] = {
        difficulty = {
            learnedAt = 175,
            orange = 185,
            yellow = 195,
            green = 205,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 18239,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 2699,
                        npcName = "Rikqiz",
                        wowheadZoneID = 33,
                    },
                },
            },
        },
    },

    [22727] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 18252,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [22815] = {
        difficulty = {
            learnedAt = 285,
            orange = 285,
            yellow = 290,
            green = 295,
        },
        sources = {},
        recipeItems = {},
    },

    [22921] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 18514,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 2557,
                    },
                },
            },
        },
    },

    [22922] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 18515,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 2557,
                    },
                },
            },
        },
    },

    [22923] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 18516,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 2557,
                    },
                },
            },
        },
    },

    [22926] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 18517,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 2557,
                    },
                },
            },
        },
    },

    [22927] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 18518,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 2557,
                    },
                },
            },
        },
    },

    [22928] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 18519,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 2557,
                    },
                },
            },
        },
    },

    [23190] = {
        difficulty = {
            learnedAt = 150,
            orange = 0,
            yellow = 0,
            green = 0,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 18731,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [23399] = {
        difficulty = {
            learnedAt = 130,
            orange = 155,
            yellow = 165,
            green = 175,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 18949,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [23703] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 295,
            green = 305,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19326,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 11557,
                        npcName = "Meilosh",
                        wowheadZoneID = 361,
                    },
                },
            },
        },
    },

    [23705] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 295,
            green = 305,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19328,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [23704] = {
        difficulty = {
            learnedAt = 295,
            orange = 315,
            yellow = 325,
            green = 335,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19327,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 11557,
                        npcName = "Meilosh",
                        wowheadZoneID = 361,
                    },
                },
            },
        },
    },

    [23706] = {
        difficulty = {
            learnedAt = 300,
            orange = 315,
            yellow = 325,
            green = 335,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19329,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
            {
                itemID = 227895,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [23707] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19330,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12944,
                        npcName = "Lokhtos Darkbargainer",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [23708] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19331,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12944,
                        npcName = "Lokhtos Darkbargainer",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [23709] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19332,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12944,
                        npcName = "Lokhtos Darkbargainer",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [23710] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19333,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12944,
                        npcName = "Lokhtos Darkbargainer",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [24124] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19772,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 14921,
                        npcName = "Rin'wosho the Trader",
                        wowheadZoneID = 33,
                    },
                },
            },
        },
    },

    [24125] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19773,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 14921,
                        npcName = "Rin'wosho the Trader",
                        wowheadZoneID = 33,
                    },
                },
            },
        },
    },

    [24123] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19771,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 14921,
                        npcName = "Rin'wosho the Trader",
                        wowheadZoneID = 33,
                    },
                },
            },
        },
    },

    [24122] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19770,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 14921,
                        npcName = "Rin'wosho the Trader",
                        wowheadZoneID = 33,
                    },
                },
            },
        },
    },

    [24121] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19769,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 14921,
                        npcName = "Rin'wosho the Trader",
                        wowheadZoneID = 33,
                    },
                },
            },
        },
    },

    [24655] = {
        difficulty = {
            learnedAt = 280,
            orange = 280,
            yellow = 285,
            green = 295,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 27000,
            },
        },
        recipeItems = {},
    },

    [24654] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 45000,
            },
        },
        recipeItems = {},
    },

    [24846] = {
        difficulty = {
            learnedAt = 310,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [24847] = {
        difficulty = {
            learnedAt = 305,
            orange = 305,
            yellow = 315,
            green = 325,
        },
        sources = {},
        recipeItems = {},
    },

    [24848] = {
        difficulty = {
            learnedAt = 310,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [24849] = {
        difficulty = {
            learnedAt = 310,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [24850] = {
        difficulty = {
            learnedAt = 310,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [24851] = {
        difficulty = {
            learnedAt = 310,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [24940] = {
        difficulty = {
            learnedAt = 75,
            orange = 100,
            yellow = 112,
            green = 125,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 20576,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [24703] = {
        difficulty = {
            learnedAt = 320,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [26279] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 21548,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [28224] = {
        difficulty = {
            learnedAt = 320,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [28222] = {
        difficulty = {
            learnedAt = 320,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [28223] = {
        difficulty = {
            learnedAt = 320,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [28221] = {
        difficulty = {
            learnedAt = 320,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [28220] = {
        difficulty = {
            learnedAt = 320,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [28219] = {
        difficulty = {
            learnedAt = 320,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [28474] = {
        difficulty = {
            learnedAt = 320,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [28473] = {
        difficulty = {
            learnedAt = 320,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [28472] = {
        difficulty = {
            learnedAt = 320,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [429354] = {
        difficulty = {
            learnedAt = 160,
            orange = 0,
            yellow = 160,
            green = 172,
        },
        sources = {},
        recipeItems = {},
    },

    [429869] = {
        difficulty = {
            learnedAt = 160,
            orange = 0,
            yellow = 160,
            green = 172,
        },
        sources = {},
        recipeItems = {},
    },

    [435819] = {
        difficulty = {
            learnedAt = 200,
            orange = 0,
            yellow = 200,
            green = 210,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 215367,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 217689,
                        npcName = "Ziri \"The Wrench\" Littlesprocket",
                        wowheadZoneID = 721,
                    },
                },
            },
        },
    },

    [435953] = {
        difficulty = {
            learnedAt = 225,
            orange = 0,
            yellow = 225,
            green = 230,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 215424,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 217689,
                        npcName = "Ziri \"The Wrench\" Littlesprocket",
                        wowheadZoneID = 721,
                    },
                },
            },
        },
    },

    [435904] = {
        difficulty = {
            learnedAt = 225,
            orange = 0,
            yellow = 225,
            green = 230,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 215152,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 217689,
                        npcName = "Ziri \"The Wrench\" Littlesprocket",
                        wowheadZoneID = 721,
                    },
                },
            },
        },
    },

    [435951] = {
        difficulty = {
            learnedAt = 225,
            orange = 0,
            yellow = 225,
            green = 230,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 215423,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 217689,
                        npcName = "Ziri \"The Wrench\" Littlesprocket",
                        wowheadZoneID = 721,
                    },
                },
            },
        },
    },

    [435949] = {
        difficulty = {
            learnedAt = 225,
            orange = 0,
            yellow = 225,
            green = 230,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 215422,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 217689,
                        npcName = "Ziri \"The Wrench\" Littlesprocket",
                        wowheadZoneID = 721,
                    },
                },
            },
        },
    },

    [439105] = {
        difficulty = {
            learnedAt = 240,
            orange = 0,
            yellow = 240,
            green = 250,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {},
    },

    [439108] = {
        difficulty = {
            learnedAt = 235,
            orange = 0,
            yellow = 235,
            green = 245,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {},
    },

    [439110] = {
        difficulty = {
            learnedAt = 215,
            orange = 0,
            yellow = 215,
            green = 225,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {},
    },

    [439112] = {
        difficulty = {
            learnedAt = 190,
            orange = 0,
            yellow = 190,
            green = 200,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {},
    },

    [439114] = {
        difficulty = {
            learnedAt = 160,
            orange = 160,
            yellow = 180,
            green = 190,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1000,
            },
        },
        recipeItems = {},
    },

    [439116] = {
        difficulty = {
            learnedAt = 210,
            orange = 210,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 3000,
            },
        },
        recipeItems = {},
    },

    [439118] = {
        difficulty = {
            learnedAt = 225,
            orange = 0,
            yellow = 225,
            green = 235,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {},
    },

    [446186] = {
        difficulty = {
            learnedAt = 250,
            orange = 0,
            yellow = 250,
            green = 255,
        },
        sources = {},
        recipeItems = {},
    },

    [446192] = {
        difficulty = {
            learnedAt = 250,
            orange = 0,
            yellow = 250,
            green = 255,
        },
        sources = {},
        recipeItems = {},
    },

    [446183] = {
        difficulty = {
            learnedAt = 250,
            orange = 0,
            yellow = 250,
            green = 255,
        },
        sources = {},
        recipeItems = {},
    },

    [446189] = {
        difficulty = {
            learnedAt = 250,
            orange = 0,
            yellow = 250,
            green = 255,
        },
        sources = {},
        recipeItems = {},
    },

    [446185] = {
        difficulty = {
            learnedAt = 250,
            orange = 0,
            yellow = 250,
            green = 255,
        },
        sources = {},
        recipeItems = {},
    },

    [446190] = {
        difficulty = {
            learnedAt = 250,
            orange = 0,
            yellow = 250,
            green = 255,
        },
        sources = {},
        recipeItems = {},
    },

    [451706] = {
        difficulty = {
            learnedAt = 250,
            orange = 0,
            yellow = 250,
            green = 255,
        },
        sources = {},
        recipeItems = {},
    },

    [461673] = {
        difficulty = {
            learnedAt = 305,
            orange = 0,
            yellow = 305,
            green = 315,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 227898,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12957,
                        npcName = "Blimo Gadgetspring",
                        wowheadZoneID = 16,
                    },
                },
            },
        },
    },

    [461645] = {
        difficulty = {
            learnedAt = 315,
            orange = 0,
            yellow = 315,
            green = 325,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 227899,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 6146,
                        npcName = "Cliff Breaker",
                    },
                },
            },
        },
    },

    [462227] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [461677] = {
        difficulty = {
            learnedAt = 300,
            orange = 0,
            yellow = 300,
            green = 310,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 228251,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [461720] = {
        difficulty = {
            learnedAt = 280,
            orange = 0,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 228309,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 11874,
                        npcName = "Masat T'andr",
                        wowheadZoneID = 8,
                    },
                },
            },
        },
    },

    [461649] = {
        difficulty = {
            learnedAt = 290,
            orange = 0,
            yellow = 290,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 227900,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [461655] = {
        difficulty = {
            learnedAt = 310,
            orange = 0,
            yellow = 310,
            green = 320,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 227902,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 9499,
                        npcName = "Plugger Spazzring",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [461659] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 227904,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 8898,
                        npcName = "Anvilrage Marshal",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [461657] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 227903,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 8903,
                        npcName = "Anvilrage Captain",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [461665] = {
        difficulty = {
            learnedAt = 290,
            orange = 0,
            yellow = 290,
            green = 300,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 227908,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7035,
                        npcName = "Firegut Brute",
                        wowheadZoneID = 46,
                    },
                },
            },
        },
    },

    [461661] = {
        difficulty = {
            learnedAt = 305,
            orange = 0,
            yellow = 305,
            green = 315,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 227906,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 9259,
                        npcName = "Firebrand Grunt",
                        wowheadZoneID = 1583,
                    },
                },
            },
        },
    },

    [461663] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 227907,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 9260,
                        npcName = "Firebrand Legionnaire",
                        wowheadZoneID = 1583,
                    },
                },
            },
        },
    },

    [461653] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 227910,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 2557,
                    },
                },
            },
        },
    },

    [461690] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 228276,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 2557,
                    },
                },
            },
        },
    },

    [461692] = {
        difficulty = {
            learnedAt = 285,
            orange = 0,
            yellow = 285,
            green = 290,
        },
        sources = {},
        recipeItems = {},
    },

    [461754] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 228319,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 2557,
                    },
                },
            },
        },
    },

    [461706] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 228301,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 2557,
                    },
                },
            },
        },
    },

    [461722] = {
        difficulty = {
            learnedAt = 310,
            orange = 0,
            yellow = 310,
            green = 320,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 228119,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 6584,
                        npcName = "King Mosh",
                        wowheadZoneID = 490,
                    },
                },
            },
        },
    },

    [461724] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 228120,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 6584,
                        npcName = "King Mosh",
                        wowheadZoneID = 490,
                    },
                },
            },
        },
    },

    [1213717] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213720] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213723] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213726] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213728] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213731] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213734] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213736] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213738] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213751] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213513] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213519] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213521] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213523] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1213525] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1214303] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1223774] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1223776] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1223778] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1223780] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1223782] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1223784] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 330,
        },
        sources = {},
        recipeItems = {},
    },

    [1224615] = {
        difficulty = {
            learnedAt = 285,
            orange = 0,
            yellow = 285,
            green = 295,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238306,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 241006,
                        npcName = "Grand Crusader Caldoran",
                        wowheadZoneID = 16236,
                    },
                },
            },
        },
    },

    [1224616] = {
        difficulty = {
            learnedAt = 285,
            orange = 0,
            yellow = 285,
            green = 295,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238307,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 16236,
                    },
                },
            },
        },
    },

    [1224617] = {
        difficulty = {
            learnedAt = 285,
            orange = 0,
            yellow = 285,
            green = 295,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238308,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 16236,
                    },
                },
            },
        },
    },

    [1224618] = {
        difficulty = {
            learnedAt = 260,
            orange = 0,
            yellow = 260,
            green = 282,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238309,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [1224619] = {
        difficulty = {
            learnedAt = 270,
            orange = 0,
            yellow = 270,
            green = 287,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238310,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [1224620] = {
        difficulty = {
            learnedAt = 260,
            orange = 0,
            yellow = 260,
            green = 282,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238311,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [1224621] = {
        difficulty = {
            learnedAt = 280,
            orange = 0,
            yellow = 280,
            green = 292,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238312,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [1224622] = {
        difficulty = {
            learnedAt = 270,
            orange = 0,
            yellow = 270,
            green = 287,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238313,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [1224623] = {
        difficulty = {
            learnedAt = 285,
            orange = 0,
            yellow = 285,
            green = 295,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238314,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 241006,
                        npcName = "Grand Crusader Caldoran",
                        wowheadZoneID = 16236,
                    },
                },
            },
        },
    },

    [1224624] = {
        difficulty = {
            learnedAt = 285,
            orange = 0,
            yellow = 285,
            green = 295,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238315,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 16236,
                    },
                },
            },
        },
    },

    [1224625] = {
        difficulty = {
            learnedAt = 285,
            orange = 0,
            yellow = 285,
            green = 295,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238316,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 16236,
                    },
                },
            },
        },
    },

    [1224626] = {
        difficulty = {
            learnedAt = 260,
            orange = 0,
            yellow = 260,
            green = 282,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238317,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [1224627] = {
        difficulty = {
            learnedAt = 270,
            orange = 0,
            yellow = 270,
            green = 287,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238318,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [1224628] = {
        difficulty = {
            learnedAt = 260,
            orange = 0,
            yellow = 260,
            green = 282,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238319,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [1224629] = {
        difficulty = {
            learnedAt = 280,
            orange = 0,
            yellow = 280,
            green = 292,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238320,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [1224630] = {
        difficulty = {
            learnedAt = 270,
            orange = 0,
            yellow = 270,
            green = 287,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 238321,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [1226689] = {
        difficulty = {
            learnedAt = 280,
            orange = 0,
            yellow = 280,
            green = 285,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 238927,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1226690] = {
        difficulty = {
            learnedAt = 280,
            orange = 0,
            yellow = 280,
            green = 285,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 238928,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1229432] = {
        difficulty = {
            learnedAt = 20,
            orange = 0,
            yellow = 20,
            green = 22,
        },
        sources = {
            {
                type = "quest",
            },
            {
                type = "trainer",
                trainingCost = 100,
            },
        },
        recipeItems = {},
    },

    [1254965] = {
        difficulty = {
            learnedAt = 235,
            orange = 235,
            yellow = 245,
            green = 255,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252942,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1254966] = {
        difficulty = {
            learnedAt = 235,
            orange = 235,
            yellow = 245,
            green = 255,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252941,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1254967] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252940,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254968] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252939,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254969] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252938,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254970] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252937,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254971] = {
        difficulty = {
            learnedAt = 280,
            orange = 300,
            yellow = 310,
            green = 320,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252936,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254972] = {
        difficulty = {
            learnedAt = 280,
            orange = 300,
            yellow = 310,
            green = 320,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252935,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254973] = {
        difficulty = {
            learnedAt = 270,
            orange = 290,
            yellow = 300,
            green = 310,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252934,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254974] = {
        difficulty = {
            learnedAt = 270,
            orange = 290,
            yellow = 300,
            green = 310,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252933,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 266901,
                        npcName = "Pexmit",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1254975] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252932,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254976] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252931,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254977] = {
        difficulty = {
            learnedAt = 255,
            orange = 275,
            yellow = 285,
            green = 295,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252930,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254978] = {
        difficulty = {
            learnedAt = 255,
            orange = 275,
            yellow = 285,
            green = 295,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252929,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254979] = {
        difficulty = {
            learnedAt = 255,
            orange = 275,
            yellow = 285,
            green = 295,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252928,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254980] = {
        difficulty = {
            learnedAt = 255,
            orange = 275,
            yellow = 285,
            green = 295,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252927,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254981] = {
        difficulty = {
            learnedAt = 255,
            orange = 275,
            yellow = 285,
            green = 295,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252926,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254982] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252925,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1254983] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252924,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1254984] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252923,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1254985] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252922,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1254986] = {
        difficulty = {
            learnedAt = 250,
            orange = 255,
            yellow = 255,
            green = 255,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252921,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254987] = {
        difficulty = {
            learnedAt = 250,
            orange = 255,
            yellow = 255,
            green = 255,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252920,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254988] = {
        difficulty = {
            learnedAt = 250,
            orange = 255,
            yellow = 255,
            green = 255,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252919,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254989] = {
        difficulty = {
            learnedAt = 250,
            orange = 255,
            yellow = 255,
            green = 255,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252918,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254990] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252917,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254991] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252916,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254992] = {
        difficulty = {
            learnedAt = 240,
            orange = 260,
            yellow = 270,
            green = 280,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252915,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254993] = {
        difficulty = {
            learnedAt = 240,
            orange = 260,
            yellow = 270,
            green = 280,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252914,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254994] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252913,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1254995] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252912,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1254996] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252911,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1254997] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252910,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1254998] = {
        difficulty = {
            learnedAt = 230,
            orange = 250,
            yellow = 260,
            green = 270,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252909,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1254999] = {
        difficulty = {
            learnedAt = 230,
            orange = 250,
            yellow = 260,
            green = 270,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252908,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255000] = {
        difficulty = {
            learnedAt = 225,
            orange = 225,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252907,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255001] = {
        difficulty = {
            learnedAt = 225,
            orange = 225,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252906,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255002] = {
        difficulty = {
            learnedAt = 225,
            orange = 225,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252905,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255003] = {
        difficulty = {
            learnedAt = 225,
            orange = 225,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252904,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255004] = {
        difficulty = {
            learnedAt = 210,
            orange = 220,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252903,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255005] = {
        difficulty = {
            learnedAt = 210,
            orange = 220,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252902,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255006] = {
        difficulty = {
            learnedAt = 210,
            orange = 220,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252901,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255007] = {
        difficulty = {
            learnedAt = 210,
            orange = 220,
            yellow = 230,
            green = 240,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252900,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255008] = {
        difficulty = {
            learnedAt = 200,
            orange = 205,
            yellow = 205,
            green = 205,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252899,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255009] = {
        difficulty = {
            learnedAt = 200,
            orange = 205,
            yellow = 205,
            green = 205,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252898,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255010] = {
        difficulty = {
            learnedAt = 200,
            orange = 205,
            yellow = 205,
            green = 205,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252897,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255011] = {
        difficulty = {
            learnedAt = 200,
            orange = 205,
            yellow = 205,
            green = 205,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252896,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255012] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252895,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255013] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252894,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255014] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252893,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255015] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252892,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255016] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 330,
            green = 340,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252891,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255017] = {
        difficulty = {
            learnedAt = 280,
            orange = 300,
            yellow = 310,
            green = 320,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252890,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255018] = {
        difficulty = {
            learnedAt = 280,
            orange = 300,
            yellow = 310,
            green = 320,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252889,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255019] = {
        difficulty = {
            learnedAt = 275,
            orange = 295,
            yellow = 305,
            green = 315,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252888,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255020] = {
        difficulty = {
            learnedAt = 275,
            orange = 295,
            yellow = 305,
            green = 315,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252887,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255021] = {
        difficulty = {
            learnedAt = 270,
            orange = 290,
            yellow = 300,
            green = 310,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252886,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255022] = {
        difficulty = {
            learnedAt = 270,
            orange = 290,
            yellow = 300,
            green = 310,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252885,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255023] = {
        difficulty = {
            learnedAt = 270,
            orange = 290,
            yellow = 300,
            green = 310,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252884,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255024] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 295,
            green = 305,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252883,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255025] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 295,
            green = 305,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252882,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255026] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252881,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255027] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252880,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255028] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252879,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255029] = {
        difficulty = {
            learnedAt = 255,
            orange = 275,
            yellow = 285,
            green = 295,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252878,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255030] = {
        difficulty = {
            learnedAt = 255,
            orange = 275,
            yellow = 285,
            green = 295,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252877,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 266901,
                        npcName = "Pexmit",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1255031] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252876,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255032] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252875,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255033] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252874,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255034] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252873,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255035] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 280,
            green = 290,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252872,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255036] = {
        difficulty = {
            learnedAt = 250,
            orange = 255,
            yellow = 255,
            green = 255,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252871,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255037] = {
        difficulty = {
            learnedAt = 250,
            orange = 255,
            yellow = 255,
            green = 255,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252870,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255038] = {
        difficulty = {
            learnedAt = 250,
            orange = 255,
            yellow = 255,
            green = 255,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252869,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255039] = {
        difficulty = {
            learnedAt = 250,
            orange = 255,
            yellow = 255,
            green = 255,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252868,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255040] = {
        difficulty = {
            learnedAt = 250,
            orange = 255,
            yellow = 255,
            green = 255,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252867,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255041] = {
        difficulty = {
            learnedAt = 240,
            orange = 260,
            yellow = 270,
            green = 280,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252866,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255042] = {
        difficulty = {
            learnedAt = 240,
            orange = 260,
            yellow = 270,
            green = 280,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252865,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255043] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252864,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255044] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252863,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255045] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252862,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255046] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252861,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255047] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252860,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255048] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252859,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255049] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 265,
            green = 275,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252858,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255050] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 255,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252857,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255051] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 255,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252856,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255052] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 255,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252855,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255053] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 255,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252854,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255054] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 255,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252853,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255055] = {
        difficulty = {
            learnedAt = 210,
            orange = 230,
            yellow = 240,
            green = 250,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252852,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255056] = {
        difficulty = {
            learnedAt = 210,
            orange = 230,
            yellow = 240,
            green = 250,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252851,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255057] = {
        difficulty = {
            learnedAt = 210,
            orange = 230,
            yellow = 240,
            green = 250,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252850,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255058] = {
        difficulty = {
            learnedAt = 210,
            orange = 230,
            yellow = 240,
            green = 250,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252849,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255059] = {
        difficulty = {
            learnedAt = 210,
            orange = 230,
            yellow = 240,
            green = 250,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252848,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255060] = {
        difficulty = {
            learnedAt = 200,
            orange = 205,
            yellow = 205,
            green = 205,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252847,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255061] = {
        difficulty = {
            learnedAt = 200,
            orange = 205,
            yellow = 205,
            green = 205,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252846,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255062] = {
        difficulty = {
            learnedAt = 200,
            orange = 205,
            yellow = 205,
            green = 205,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252845,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255063] = {
        difficulty = {
            learnedAt = 200,
            orange = 205,
            yellow = 205,
            green = 205,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252844,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255064] = {
        difficulty = {
            learnedAt = 200,
            orange = 205,
            yellow = 205,
            green = 205,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 252843,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1255065] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 205,
            green = 215,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252842,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255066] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 205,
            green = 215,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252841,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255067] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 205,
            green = 215,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252840,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255068] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 205,
            green = 215,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252839,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255069] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 205,
            green = 215,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252838,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255070] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 205,
            green = 215,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252837,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255071] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 205,
            green = 215,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252836,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255073] = {
        difficulty = {
            learnedAt = 185,
            orange = 205,
            yellow = 215,
            green = 225,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252834,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255074] = {
        difficulty = {
            learnedAt = 185,
            orange = 205,
            yellow = 215,
            green = 225,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252833,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        wowheadZoneID = 405,
                    },
                },
            },
        },
    },

    [1255075] = {
        difficulty = {
            learnedAt = 150,
            orange = 155,
            yellow = 155,
            green = 155,
        },
        sources = {
            {
                type = "vendor",
            },
            {
                type = "trainer",
                trainingCost = 2000,
            },
        },
        recipeItems = {
            {
                itemID = 252832,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 258306,
                        npcName = "Granny Finespindle",
                        wowheadZoneID = 1537,
                    },
                },
            },
        },
    },

    [1255076] = {
        difficulty = {
            learnedAt = 150,
            orange = 155,
            yellow = 155,
            green = 155,
        },
        sources = {
            {
                type = "vendor",
            },
            {
                type = "trainer",
                trainingCost = 2000,
            },
        },
        recipeItems = {
            {
                itemID = 252831,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 258306,
                        npcName = "Granny Finespindle",
                        wowheadZoneID = 1537,
                    },
                },
            },
        },
    },

    [1255077] = {
        difficulty = {
            learnedAt = 150,
            orange = 155,
            yellow = 155,
            green = 155,
        },
        sources = {
            {
                type = "vendor",
            },
            {
                type = "trainer",
                trainingCost = 2000,
            },
        },
        recipeItems = {
            {
                itemID = 252830,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 258306,
                        npcName = "Granny Finespindle",
                        wowheadZoneID = 1537,
                    },
                },
            },
        },
    },

    [1255078] = {
        difficulty = {
            learnedAt = 150,
            orange = 155,
            yellow = 155,
            green = 155,
        },
        sources = {
            {
                type = "vendor",
            },
            {
                type = "trainer",
                trainingCost = 2000,
            },
        },
        recipeItems = {
            {
                itemID = 252829,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 258306,
                        npcName = "Granny Finespindle",
                        wowheadZoneID = 1537,
                    },
                },
            },
        },
    },

    [1255079] = {
        difficulty = {
            learnedAt = 150,
            orange = 155,
            yellow = 155,
            green = 155,
        },
        sources = {
            {
                type = "vendor",
            },
            {
                type = "trainer",
                trainingCost = 2000,
            },
        },
        recipeItems = {
            {
                itemID = 252828,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 258306,
                        npcName = "Granny Finespindle",
                        wowheadZoneID = 1537,
                    },
                },
            },
        },
    },

    [1255080] = {
        difficulty = {
            learnedAt = 150,
            orange = 155,
            yellow = 155,
            green = 155,
        },
        sources = {
            {
                type = "vendor",
            },
            {
                type = "trainer",
                trainingCost = 2000,
            },
        },
        recipeItems = {
            {
                itemID = 252827,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 258306,
                        npcName = "Granny Finespindle",
                        wowheadZoneID = 1537,
                    },
                },
            },
        },
    },

    [1255081] = {
        difficulty = {
            learnedAt = 150,
            orange = 155,
            yellow = 155,
            green = 155,
        },
        sources = {
            {
                type = "vendor",
            },
            {
                type = "trainer",
                trainingCost = 2000,
            },
        },
        recipeItems = {
            {
                itemID = 252826,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 258306,
                        npcName = "Granny Finespindle",
                        wowheadZoneID = 1537,
                    },
                },
            },
        },
    },

    [1255082] = {
        difficulty = {
            learnedAt = 125,
            orange = 150,
            yellow = 160,
            green = 170,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252825,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255083] = {
        difficulty = {
            learnedAt = 125,
            orange = 150,
            yellow = 160,
            green = 170,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252824,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255084] = {
        difficulty = {
            learnedAt = 125,
            orange = 150,
            yellow = 160,
            green = 170,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252823,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255085] = {
        difficulty = {
            learnedAt = 125,
            orange = 150,
            yellow = 160,
            green = 170,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252822,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255086] = {
        difficulty = {
            learnedAt = 125,
            orange = 150,
            yellow = 160,
            green = 170,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252821,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255087] = {
        difficulty = {
            learnedAt = 125,
            orange = 150,
            yellow = 160,
            green = 170,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252820,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255088] = {
        difficulty = {
            learnedAt = 125,
            orange = 130,
            yellow = 130,
            green = 130,
        },
        sources = {},
        recipeItems = {},
    },

    [1255089] = {
        difficulty = {
            learnedAt = 125,
            orange = 130,
            yellow = 130,
            green = 130,
        },
        sources = {},
        recipeItems = {},
    },

    [1255090] = {
        difficulty = {
            learnedAt = 125,
            orange = 130,
            yellow = 130,
            green = 130,
        },
        sources = {},
        recipeItems = {},
    },

    [1255091] = {
        difficulty = {
            learnedAt = 125,
            orange = 130,
            yellow = 130,
            green = 130,
        },
        sources = {},
        recipeItems = {},
    },

    [1255092] = {
        difficulty = {
            learnedAt = 125,
            orange = 130,
            yellow = 130,
            green = 130,
        },
        sources = {},
        recipeItems = {},
    },

    [1255093] = {
        difficulty = {
            learnedAt = 125,
            orange = 130,
            yellow = 130,
            green = 130,
        },
        sources = {},
        recipeItems = {},
    },

    [1255095] = {
        difficulty = {
            learnedAt = 135,
            orange = 155,
            yellow = 165,
            green = 175,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252812,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255096] = {
        difficulty = {
            learnedAt = 135,
            orange = 155,
            yellow = 165,
            green = 175,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252811,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255097] = {
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 147,
            green = 160,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252810,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255098] = {
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 147,
            green = 160,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252809,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255099] = {
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 147,
            green = 160,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252808,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255100] = {
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 147,
            green = 160,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252807,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255101] = {
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 147,
            green = 160,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252806,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255102] = {
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 147,
            green = 160,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252805,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255103] = {
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 147,
            green = 160,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 252804,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 3817,
                        npcName = "Shadowhorn Stag",
                        wowheadZoneID = 331,
                    },
                },
            },
        },
    },

    [1255104] = {
        difficulty = {
            learnedAt = 100,
            orange = 125,
            yellow = 137,
            green = 150,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252803,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255105] = {
        difficulty = {
            learnedAt = 100,
            orange = 125,
            yellow = 137,
            green = 150,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252802,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255106] = {
        difficulty = {
            learnedAt = 100,
            orange = 125,
            yellow = 137,
            green = 150,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252801,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255107] = {
        difficulty = {
            learnedAt = 100,
            orange = 125,
            yellow = 137,
            green = 150,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252800,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255108] = {
        difficulty = {
            learnedAt = 100,
            orange = 125,
            yellow = 137,
            green = 150,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252799,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255109] = {
        difficulty = {
            learnedAt = 100,
            orange = 125,
            yellow = 137,
            green = 150,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252798,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255110] = {
        difficulty = {
            learnedAt = 100,
            orange = 105,
            yellow = 105,
            green = 105,
        },
        sources = {},
        recipeItems = {},
    },

    [1255111] = {
        difficulty = {
            learnedAt = 100,
            orange = 105,
            yellow = 105,
            green = 105,
        },
        sources = {},
        recipeItems = {},
    },

    [1255112] = {
        difficulty = {
            learnedAt = 100,
            orange = 105,
            yellow = 105,
            green = 105,
        },
        sources = {},
        recipeItems = {},
    },

    [1255113] = {
        difficulty = {
            learnedAt = 100,
            orange = 105,
            yellow = 105,
            green = 105,
        },
        sources = {},
        recipeItems = {},
    },

    [1255114] = {
        difficulty = {
            learnedAt = 100,
            orange = 105,
            yellow = 105,
            green = 105,
        },
        sources = {},
        recipeItems = {},
    },

    [1255115] = {
        difficulty = {
            learnedAt = 100,
            orange = 105,
            yellow = 105,
            green = 105,
        },
        sources = {},
        recipeItems = {},
    },

    [1255116] = {
        difficulty = {
            learnedAt = 85,
            orange = 110,
            yellow = 122,
            green = 135,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252791,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255117] = {
        difficulty = {
            learnedAt = 85,
            orange = 110,
            yellow = 122,
            green = 135,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252790,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255118] = {
        difficulty = {
            learnedAt = 85,
            orange = 110,
            yellow = 122,
            green = 135,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252789,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255119] = {
        difficulty = {
            learnedAt = 85,
            orange = 110,
            yellow = 122,
            green = 135,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252788,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255120] = {
        difficulty = {
            learnedAt = 85,
            orange = 110,
            yellow = 122,
            green = 135,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252787,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255121] = {
        difficulty = {
            learnedAt = 85,
            orange = 110,
            yellow = 122,
            green = 135,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252786,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255123] = {
        difficulty = {
            learnedAt = 80,
            orange = 95,
            yellow = 102,
            green = 110,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252784,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255124] = {
        difficulty = {
            learnedAt = 80,
            orange = 95,
            yellow = 102,
            green = 110,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252783,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255125] = {
        difficulty = {
            learnedAt = 75,
            orange = 100,
            yellow = 112,
            green = 125,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252782,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255126] = {
        difficulty = {
            learnedAt = 75,
            orange = 100,
            yellow = 112,
            green = 125,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252781,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255127] = {
        difficulty = {
            learnedAt = 75,
            orange = 100,
            yellow = 112,
            green = 125,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252780,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255128] = {
        difficulty = {
            learnedAt = 75,
            orange = 100,
            yellow = 112,
            green = 125,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252779,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255129] = {
        difficulty = {
            learnedAt = 75,
            orange = 100,
            yellow = 112,
            green = 125,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252778,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255130] = {
        difficulty = {
            learnedAt = 75,
            orange = 100,
            yellow = 112,
            green = 125,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252777,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255131] = {
        difficulty = {
            learnedAt = 75,
            orange = 80,
            yellow = 80,
            green = 80,
        },
        sources = {},
        recipeItems = {},
    },

    [1255132] = {
        difficulty = {
            learnedAt = 75,
            orange = 80,
            yellow = 80,
            green = 80,
        },
        sources = {},
        recipeItems = {},
    },

    [1255133] = {
        difficulty = {
            learnedAt = 75,
            orange = 80,
            yellow = 80,
            green = 80,
        },
        sources = {},
        recipeItems = {},
    },

    [1255134] = {
        difficulty = {
            learnedAt = 75,
            orange = 80,
            yellow = 80,
            green = 80,
        },
        sources = {},
        recipeItems = {},
    },

    [1255135] = {
        difficulty = {
            learnedAt = 75,
            orange = 80,
            yellow = 80,
            green = 80,
        },
        sources = {},
        recipeItems = {},
    },

    [1255136] = {
        difficulty = {
            learnedAt = 75,
            orange = 80,
            yellow = 80,
            green = 80,
        },
        sources = {},
        recipeItems = {},
    },

    [1255137] = {
        difficulty = {
            learnedAt = 60,
            orange = 90,
            yellow = 105,
            green = 120,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252770,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255138] = {
        difficulty = {
            learnedAt = 60,
            orange = 90,
            yellow = 105,
            green = 120,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252769,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255139] = {
        difficulty = {
            learnedAt = 60,
            orange = 90,
            yellow = 105,
            green = 120,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252768,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255140] = {
        difficulty = {
            learnedAt = 60,
            orange = 90,
            yellow = 105,
            green = 120,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252767,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255141] = {
        difficulty = {
            learnedAt = 60,
            orange = 90,
            yellow = 105,
            green = 120,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252766,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255142] = {
        difficulty = {
            learnedAt = 60,
            orange = 90,
            yellow = 105,
            green = 120,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 252765,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1255143] = {
        difficulty = {
            learnedAt = 35,
            orange = 40,
            yellow = 40,
            green = 40,
        },
        sources = {
            {
                type = "vendor",
            },
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {
            {
                itemID = 252764,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 258306,
                        npcName = "Granny Finespindle",
                        wowheadZoneID = 1537,
                    },
                },
            },
        },
    },

    [1255144] = {
        difficulty = {
            learnedAt = 35,
            orange = 40,
            yellow = 40,
            green = 40,
        },
        sources = {
            {
                type = "vendor",
            },
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {
            {
                itemID = 252763,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 258306,
                        npcName = "Granny Finespindle",
                        wowheadZoneID = 1537,
                    },
                },
            },
        },
    },

    [1255145] = {
        difficulty = {
            learnedAt = 35,
            orange = 40,
            yellow = 40,
            green = 40,
        },
        sources = {
            {
                type = "vendor",
            },
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {},
    },

    [1255146] = {
        difficulty = {
            learnedAt = 35,
            orange = 40,
            yellow = 40,
            green = 40,
        },
        sources = {
            {
                type = "vendor",
            },
            {
                type = "trainer",
                trainingCost = 500,
            },
        },
        recipeItems = {
            {
                itemID = 252761,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 258306,
                        npcName = "Granny Finespindle",
                        wowheadZoneID = 1537,
                    },
                },
            },
        },
    },

    [16650] = {
        difficulty = {
            learnedAt = 270,
            orange = 270,
            yellow = 275,
            green = 285,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 12691,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [23628] = {
        difficulty = {
            learnedAt = 290,
            orange = 290,
            yellow = 295,
            green = 305,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19202,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 11557,
                        npcName = "Meilosh",
                        wowheadZoneID = 361,
                    },
                },
            },
        },
    },

    [16661] = {
        difficulty = {
            learnedAt = 295,
            orange = 295,
            yellow = 300,
            green = 310,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 12703,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [16728] = {
        difficulty = {
            learnedAt = 300,
            orange = 300,
            yellow = 300,
            green = 310,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 12716,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [23629] = {
        difficulty = {
            learnedAt = 300,
            orange = 300,
            yellow = 310,
            green = 320,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19204,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 11557,
                        npcName = "Meilosh",
                        wowheadZoneID = 361,
                    },
                },
            },
        },
    },

    [16746] = {
        difficulty = {
            learnedAt = 300,
            orange = 300,
            yellow = 302,
            green = 310,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 12728,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [1263031] = {
        difficulty = {
            learnedAt = 140,
            orange = 0,
            yellow = 140,
            green = 142,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 273096,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1263079] = {
        difficulty = {
            learnedAt = 300,
            orange = 0,
            yellow = 300,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 273121,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1292924] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273955,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292921] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273953,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292923] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273954,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292920] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273952,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292928] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273959,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292926] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273957,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292927] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273958,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292925] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273956,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292932] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273963,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292930] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273961,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292931] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273962,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292929] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273960,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292936] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273967,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292934] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273965,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292935] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273966,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292933] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273964,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292940] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273971,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292938] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273969,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292939] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273970,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292937] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273968,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292968] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273999,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292966] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273997,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292967] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273998,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292965] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 273996,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292972] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274003,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292970] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274001,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292971] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274002,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292969] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274000,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292976] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274007,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292974] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274005,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292975] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274006,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1292973] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274004,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1297126] = {
        difficulty = {
            learnedAt = 285,
            orange = 290,
            yellow = 292,
            green = 295,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 275586,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1297127] = {
        difficulty = {
            learnedAt = 290,
            orange = 295,
            yellow = 297,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 275587,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1297128] = {
        difficulty = {
            learnedAt = 295,
            orange = 295,
            yellow = 297,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 275588,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1297129] = {
        difficulty = {
            learnedAt = 285,
            orange = 290,
            yellow = 292,
            green = 295,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 275589,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1297130] = {
        difficulty = {
            learnedAt = 290,
            orange = 295,
            yellow = 297,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 275590,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1297131] = {
        difficulty = {
            learnedAt = 295,
            orange = 295,
            yellow = 297,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 275591,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1297132] = {
        difficulty = {
            learnedAt = 285,
            orange = 290,
            yellow = 292,
            green = 295,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 275592,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1297133] = {
        difficulty = {
            learnedAt = 290,
            orange = 295,
            yellow = 297,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 275593,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1297134] = {
        difficulty = {
            learnedAt = 295,
            orange = 295,
            yellow = 297,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 275594,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1297135] = {
        difficulty = {
            learnedAt = 285,
            orange = 290,
            yellow = 292,
            green = 295,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 275595,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1297136] = {
        difficulty = {
            learnedAt = 290,
            orange = 295,
            yellow = 297,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 275596,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1297137] = {
        difficulty = {
            learnedAt = 295,
            orange = 295,
            yellow = 297,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 275597,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1299917] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276545,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1299915] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276543,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1299916] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276544,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1299914] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 325,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276542,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264797,
                        npcName = "Aisarra Nightmeadow",
                        wowheadZoneID = 616,
                    },
                },
            },
        },
    },

    [1301427] = {
        difficulty = {
            learnedAt = 60,
            orange = 65,
            yellow = 67,
            green = 70,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276934,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301428] = {
        difficulty = {
            learnedAt = 50,
            orange = 55,
            yellow = 57,
            green = 60,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276935,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301429] = {
        difficulty = {
            learnedAt = 55,
            orange = 60,
            yellow = 62,
            green = 65,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276936,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301430] = {
        difficulty = {
            learnedAt = 50,
            orange = 55,
            yellow = 57,
            green = 60,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276937,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301431] = {
        difficulty = {
            learnedAt = 60,
            orange = 65,
            yellow = 67,
            green = 70,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276938,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301432] = {
        difficulty = {
            learnedAt = 55,
            orange = 60,
            yellow = 62,
            green = 65,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276939,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301433] = {
        difficulty = {
            learnedAt = 60,
            orange = 65,
            yellow = 67,
            green = 70,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276940,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301434] = {
        difficulty = {
            learnedAt = 50,
            orange = 55,
            yellow = 57,
            green = 60,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276941,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301435] = {
        difficulty = {
            learnedAt = 55,
            orange = 60,
            yellow = 62,
            green = 65,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276942,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301436] = {
        difficulty = {
            learnedAt = 50,
            orange = 55,
            yellow = 57,
            green = 60,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276943,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301437] = {
        difficulty = {
            learnedAt = 60,
            orange = 65,
            yellow = 67,
            green = 70,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276944,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301438] = {
        difficulty = {
            learnedAt = 55,
            orange = 60,
            yellow = 62,
            green = 65,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276945,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301451] = {
        difficulty = {
            learnedAt = 60,
            orange = 65,
            yellow = 67,
            green = 70,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276958,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301452] = {
        difficulty = {
            learnedAt = 50,
            orange = 55,
            yellow = 57,
            green = 60,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276959,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301453] = {
        difficulty = {
            learnedAt = 55,
            orange = 60,
            yellow = 62,
            green = 65,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276960,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301454] = {
        difficulty = {
            learnedAt = 50,
            orange = 55,
            yellow = 57,
            green = 60,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276961,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301455] = {
        difficulty = {
            learnedAt = 60,
            orange = 65,
            yellow = 67,
            green = 70,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276962,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301456] = {
        difficulty = {
            learnedAt = 55,
            orange = 60,
            yellow = 62,
            green = 65,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276963,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301457] = {
        difficulty = {
            learnedAt = 60,
            orange = 65,
            yellow = 67,
            green = 70,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276964,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301458] = {
        difficulty = {
            learnedAt = 50,
            orange = 55,
            yellow = 57,
            green = 60,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276965,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301459] = {
        difficulty = {
            learnedAt = 55,
            orange = 60,
            yellow = 62,
            green = 65,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276966,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301460] = {
        difficulty = {
            learnedAt = 50,
            orange = 55,
            yellow = 57,
            green = 60,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276967,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301461] = {
        difficulty = {
            learnedAt = 60,
            orange = 65,
            yellow = 67,
            green = 70,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276968,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301462] = {
        difficulty = {
            learnedAt = 55,
            orange = 60,
            yellow = 62,
            green = 65,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276969,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 254151,
                        npcName = "Vayn Moongaze",
                        wowheadZoneID = 16593,
                    },
                },
            },
        },
    },

    [1301528] = {
        difficulty = {
            learnedAt = 175,
            orange = 185,
            yellow = 187,
            green = 190,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276978,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264078,
                        npcName = "Sutara Plainstalker",
                        wowheadZoneID = 215,
                    },
                },
            },
        },
    },

    [1301529] = {
        difficulty = {
            learnedAt = 175,
            orange = 185,
            yellow = 187,
            green = 190,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276979,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264078,
                        npcName = "Sutara Plainstalker",
                        wowheadZoneID = 215,
                    },
                },
            },
        },
    },

    [1301530] = {
        difficulty = {
            learnedAt = 175,
            orange = 185,
            yellow = 187,
            green = 190,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276980,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264078,
                        npcName = "Sutara Plainstalker",
                        wowheadZoneID = 215,
                    },
                },
            },
        },
    },

    [1301531] = {
        difficulty = {
            learnedAt = 175,
            orange = 185,
            yellow = 187,
            green = 190,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276981,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 264078,
                        npcName = "Sutara Plainstalker",
                        wowheadZoneID = 215,
                    },
                },
            },
        },
    },

    [1301536] = {
        difficulty = {
            learnedAt = 175,
            orange = 185,
            yellow = 187,
            green = 190,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276986,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 32287,
                        npcName = "Archmage Alvareaux",
                        wowheadZoneID = 36,
                    },
                },
            },
        },
    },

    [1301537] = {
        difficulty = {
            learnedAt = 175,
            orange = 185,
            yellow = 187,
            green = 190,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276987,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 32287,
                        npcName = "Archmage Alvareaux",
                        wowheadZoneID = 36,
                    },
                },
            },
        },
    },

    [1301538] = {
        difficulty = {
            learnedAt = 175,
            orange = 185,
            yellow = 187,
            green = 190,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276988,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 32287,
                        npcName = "Archmage Alvareaux",
                        wowheadZoneID = 36,
                    },
                },
            },
        },
    },

    [1301539] = {
        difficulty = {
            learnedAt = 175,
            orange = 185,
            yellow = 187,
            green = 190,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 276989,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 32287,
                        npcName = "Archmage Alvareaux",
                        wowheadZoneID = 36,
                    },
                },
            },
        },
    },

    [1302604] = {
        difficulty = {
            learnedAt = 30,
            orange = 40,
            yellow = 45,
            green = 50,
        },
        sources = {
            {
                type = "quest",
            },
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 277716,
                faction = nil,
                sources = {
                    {
                        type = "quest",
                        questID = 96875,
                        questName = "Beasts of Thunder Ridge",
                    },
                    {
                        type = "vendor",
                        npcID = 4225,
                        npcName = "Saenorion",
                        wowheadZoneID = 1657,
                    },
                },
            },
        },
    },

    [1306526] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279301,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1306527] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279302,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1306528] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279303,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1306529] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279304,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1306530] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279305,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1306531] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279306,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1306532] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279307,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [44953] = {
        difficulty = {
            learnedAt = nil,
            orange = nil,
            yellow = nil,
            green = nil,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 34262,
                faction = nil,
                sources = {
                },
            },
        },
    },

}
