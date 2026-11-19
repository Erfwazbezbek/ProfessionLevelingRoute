local ADDON, ns = ...

ns.RecipeData = ns.RecipeData or {}

ns.RecipeData[ "Enchanting" ] = {
    [7418] = {
        difficulty = {
            learnedAt = 20,
            orange = 20,
            yellow = 22,
            green = 25,
        },
        sources = {},
        recipeItems = {},
    },

    [7420] = {
        difficulty = {
            learnedAt = 15,
            orange = 70,
            yellow = 90,
            green = 110,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 50,
            },
        },
        recipeItems = {},
    },

    [7421] = {
        difficulty = {
            learnedAt = 5,
            orange = 5,
            yellow = 7,
            green = 10,
        },
        sources = {},
        recipeItems = {},
    },

    [7426] = {
        difficulty = {
            learnedAt = 40,
            orange = 90,
            yellow = 110,
            green = 130,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 100,
            },
        },
        recipeItems = {},
    },

    [7428] = {
        difficulty = {
            learnedAt = 80,
            orange = 80,
            yellow = 100,
            green = 120,
        },
        sources = {},
        recipeItems = {},
    },

    [7443] = {
        difficulty = {
            learnedAt = 20,
            orange = 80,
            yellow = 100,
            green = 120,
        },
        sources = {
            {
                type = "drop",
            },
            {
                type = "vendor",
            },
            {
                type = "unknown:21",
            },
        },
        recipeItems = {
            {
                itemID = 6342,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                    {
                        type = "vendor",
                    },
                    {
                        type = "unknown:21",
                    },
                },
            },
        },
    },

    [7454] = {
        difficulty = {
            learnedAt = 45,
            orange = 95,
            yellow = 115,
            green = 135,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 100,
            },
        },
        recipeItems = {},
    },

    [7457] = {
        difficulty = {
            learnedAt = 50,
            orange = 100,
            yellow = 120,
            green = 140,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 250,
            },
        },
        recipeItems = {},
    },

    [7748] = {
        difficulty = {
            learnedAt = 60,
            orange = 105,
            yellow = 125,
            green = 145,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 250,
            },
        },
        recipeItems = {},
    },

    [7766] = {
        difficulty = {
            learnedAt = 60,
            orange = 105,
            yellow = 125,
            green = 145,
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
                itemID = 6344,
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

    [7771] = {
        difficulty = {
            learnedAt = 70,
            orange = 110,
            yellow = 130,
            green = 150,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 200,
            },
        },
        recipeItems = {},
    },

    [7776] = {
        difficulty = {
            learnedAt = 80,
            orange = 115,
            yellow = 135,
            green = 155,
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
                itemID = 6346,
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

    [7779] = {
        difficulty = {
            learnedAt = 80,
            orange = 115,
            yellow = 135,
            green = 155,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 400,
            },
        },
        recipeItems = {},
    },

    [7782] = {
        difficulty = {
            learnedAt = 80,
            orange = 115,
            yellow = 135,
            green = 155,
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
                itemID = 6347,
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

    [7786] = {
        difficulty = {
            learnedAt = 90,
            orange = 120,
            yellow = 140,
            green = 160,
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
                itemID = 6348,
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

    [7788] = {
        difficulty = {
            learnedAt = 90,
            orange = 120,
            yellow = 140,
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

    [7745] = {
        difficulty = {
            learnedAt = 100,
            orange = 130,
            yellow = 150,
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

    [7793] = {
        difficulty = {
            learnedAt = 100,
            orange = 130,
            yellow = 150,
            green = 170,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 6349,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [7795] = {
        difficulty = {
            learnedAt = 100,
            orange = 130,
            yellow = 150,
            green = 170,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1000,
            },
        },
        recipeItems = {},
    },

    [7857] = {
        difficulty = {
            learnedAt = 120,
            orange = 145,
            yellow = 165,
            green = 185,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1000,
            },
        },
        recipeItems = {},
    },

    [7859] = {
        difficulty = {
            learnedAt = 120,
            orange = 145,
            yellow = 165,
            green = 185,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 6375,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [7861] = {
        difficulty = {
            learnedAt = 125,
            orange = 150,
            yellow = 170,
            green = 190,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1250,
            },
        },
        recipeItems = {},
    },

    [7863] = {
        difficulty = {
            learnedAt = 125,
            orange = 150,
            yellow = 170,
            green = 190,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1400,
            },
        },
        recipeItems = {
            {
                itemID = 6376,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [7867] = {
        difficulty = {
            learnedAt = 125,
            orange = 150,
            yellow = 170,
            green = 190,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 6377,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [13378] = {
        difficulty = {
            learnedAt = 105,
            orange = 130,
            yellow = 150,
            green = 170,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 600,
            },
        },
        recipeItems = {},
    },

    [13380] = {
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 155,
            green = 175,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11038,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [13419] = {
        difficulty = {
            learnedAt = 110,
            orange = 135,
            yellow = 155,
            green = 175,
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
                itemID = 11039,
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

    [13421] = {
        difficulty = {
            learnedAt = 115,
            orange = 140,
            yellow = 160,
            green = 180,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 800,
            },
        },
        recipeItems = {},
    },

    [13464] = {
        difficulty = {
            learnedAt = 115,
            orange = 140,
            yellow = 160,
            green = 180,
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
                itemID = 11081,
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

    [13485] = {
        difficulty = {
            learnedAt = 130,
            orange = 155,
            yellow = 175,
            green = 195,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1500,
            },
        },
        recipeItems = {},
    },

    [13501] = {
        difficulty = {
            learnedAt = 130,
            orange = 155,
            yellow = 175,
            green = 195,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 1500,
            },
        },
        recipeItems = {},
    },

    [13503] = {
        difficulty = {
            learnedAt = 140,
            orange = 165,
            yellow = 185,
            green = 205,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2000,
            },
        },
        recipeItems = {},
    },

    [13522] = {
        difficulty = {
            learnedAt = 135,
            orange = 160,
            yellow = 180,
            green = 200,
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
                itemID = 11098,
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

    [13529] = {
        difficulty = {
            learnedAt = 145,
            orange = 170,
            yellow = 190,
            green = 210,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2400,
            },
        },
        recipeItems = {},
    },

    [13536] = {
        difficulty = {
            learnedAt = 140,
            orange = 165,
            yellow = 185,
            green = 205,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 11101,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [13538] = {
        difficulty = {
            learnedAt = 140,
            orange = 165,
            yellow = 185,
            green = 205,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2500,
            },
        },
        recipeItems = {},
    },

    [13607] = {
        difficulty = {
            learnedAt = 145,
            orange = 170,
            yellow = 190,
            green = 210,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2400,
            },
        },
        recipeItems = {},
    },

    [13612] = {
        difficulty = {
            learnedAt = 145,
            orange = 170,
            yellow = 190,
            green = 210,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11150,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [13617] = {
        difficulty = {
            learnedAt = 145,
            orange = 170,
            yellow = 190,
            green = 210,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11151,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [13620] = {
        difficulty = {
            learnedAt = 145,
            orange = 170,
            yellow = 190,
            green = 210,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11152,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 267,
                    },
                },
            },
        },
    },

    [13622] = {
        difficulty = {
            learnedAt = 150,
            orange = 175,
            yellow = 195,
            green = 215,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2500,
            },
        },
        recipeItems = {},
    },

    [13626] = {
        difficulty = {
            learnedAt = 150,
            orange = 175,
            yellow = 195,
            green = 215,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2500,
            },
        },
        recipeItems = {},
    },

    [13628] = {
        difficulty = {
            learnedAt = 150,
            orange = 175,
            yellow = 195,
            green = 215,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2500,
            },
        },
        recipeItems = {},
    },

    [13631] = {
        difficulty = {
            learnedAt = 155,
            orange = 175,
            yellow = 195,
            green = 215,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2600,
            },
        },
        recipeItems = {},
    },

    [13635] = {
        difficulty = {
            learnedAt = 155,
            orange = 175,
            yellow = 195,
            green = 215,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2600,
            },
        },
        recipeItems = {},
    },

    [13637] = {
        difficulty = {
            learnedAt = 160,
            orange = 180,
            yellow = 200,
            green = 220,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2800,
            },
        },
        recipeItems = {},
    },

    [13640] = {
        difficulty = {
            learnedAt = 160,
            orange = 180,
            yellow = 200,
            green = 220,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2700,
            },
        },
        recipeItems = {},
    },

    [13642] = {
        difficulty = {
            learnedAt = 165,
            orange = 185,
            yellow = 205,
            green = 225,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2800,
            },
        },
        recipeItems = {},
    },

    [13644] = {
        difficulty = {
            learnedAt = 170,
            orange = 190,
            yellow = 210,
            green = 230,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2800,
            },
        },
        recipeItems = {},
    },

    [13646] = {
        difficulty = {
            learnedAt = 170,
            orange = 190,
            yellow = 210,
            green = 230,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 11163,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [13648] = {
        difficulty = {
            learnedAt = 170,
            orange = 190,
            yellow = 210,
            green = 230,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2800,
            },
        },
        recipeItems = {},
    },

    [13653] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 215,
            green = 235,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11164,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [13655] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 215,
            green = 235,
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
                itemID = 11165,
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

    [13657] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 215,
            green = 235,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 3000,
            },
        },
        recipeItems = {},
    },

    [13659] = {
        difficulty = {
            learnedAt = 180,
            orange = 200,
            yellow = 220,
            green = 240,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 3200,
            },
        },
        recipeItems = {},
    },

    [13661] = {
        difficulty = {
            learnedAt = 180,
            orange = 200,
            yellow = 220,
            green = 240,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 3600,
            },
        },
        recipeItems = {},
    },

    [13663] = {
        difficulty = {
            learnedAt = 185,
            orange = 205,
            yellow = 225,
            green = 245,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 3800,
            },
        },
        recipeItems = {},
    },

    [13687] = {
        difficulty = {
            learnedAt = 190,
            orange = 210,
            yellow = 230,
            green = 250,
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
                itemID = 11167,
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

    [13689] = {
        difficulty = {
            learnedAt = 195,
            orange = 215,
            yellow = 235,
            green = 255,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11168,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [13693] = {
        difficulty = {
            learnedAt = 195,
            orange = 215,
            yellow = 235,
            green = 255,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4000,
            },
        },
        recipeItems = {},
    },

    [13695] = {
        difficulty = {
            learnedAt = 200,
            orange = 220,
            yellow = 240,
            green = 260,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4000,
            },
        },
        recipeItems = {},
    },

    [13698] = {
        difficulty = {
            learnedAt = 200,
            orange = 220,
            yellow = 240,
            green = 260,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11166,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 45,
                    },
                },
            },
        },
    },

    [13700] = {
        difficulty = {
            learnedAt = 200,
            orange = 220,
            yellow = 240,
            green = 260,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4000,
            },
        },
        recipeItems = {},
    },

    [13702] = {
        difficulty = {
            learnedAt = 200,
            orange = 220,
            yellow = 240,
            green = 260,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4000,
            },
        },
        recipeItems = {},
    },

    [13746] = {
        difficulty = {
            learnedAt = 205,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4200,
            },
        },
        recipeItems = {},
    },

    [13794] = {
        difficulty = {
            learnedAt = 205,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4200,
            },
        },
        recipeItems = {},
    },

    [13815] = {
        difficulty = {
            learnedAt = 210,
            orange = 230,
            yellow = 250,
            green = 270,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4400,
            },
        },
        recipeItems = {},
    },

    [13817] = {
        difficulty = {
            learnedAt = 210,
            orange = 230,
            yellow = 250,
            green = 270,
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
                itemID = 11202,
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

    [13822] = {
        difficulty = {
            learnedAt = 210,
            orange = 230,
            yellow = 250,
            green = 270,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4400,
            },
        },
        recipeItems = {},
    },

    [13836] = {
        difficulty = {
            learnedAt = 215,
            orange = 235,
            yellow = 255,
            green = 275,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4600,
            },
        },
        recipeItems = {},
    },

    [13841] = {
        difficulty = {
            learnedAt = 215,
            orange = 235,
            yellow = 255,
            green = 275,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11203,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 674,
                        npcName = "Venture Co. Strip Miner",
                        wowheadZoneID = 33,
                    },
                },
            },
        },
    },

    [13846] = {
        difficulty = {
            learnedAt = 220,
            orange = 240,
            yellow = 260,
            green = 280,
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
                itemID = 11204,
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

    [13858] = {
        difficulty = {
            learnedAt = 220,
            orange = 240,
            yellow = 260,
            green = 280,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 4800,
            },
        },
        recipeItems = {},
    },

    [13868] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 265,
            green = 285,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11205,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 8,
                    },
                },
            },
        },
    },

    [13882] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 265,
            green = 285,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11206,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [13887] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 265,
            green = 285,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 5000,
            },
        },
        recipeItems = {},
    },

    [13890] = {
        difficulty = {
            learnedAt = 225,
            orange = 245,
            yellow = 265,
            green = 285,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 5000,
            },
        },
        recipeItems = {},
    },

    [13898] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 305,
            green = 325,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11207,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 9024,
                        npcName = "Pyromancer Loregrain",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [13905] = {
        difficulty = {
            learnedAt = 230,
            orange = 250,
            yellow = 270,
            green = 290,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 5400,
            },
        },
        recipeItems = {},
    },

    [13915] = {
        difficulty = {
            learnedAt = 230,
            orange = 250,
            yellow = 270,
            green = 290,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11208,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [13917] = {
        difficulty = {
            learnedAt = 230,
            orange = 250,
            yellow = 270,
            green = 290,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 5400,
            },
        },
        recipeItems = {},
    },

    [13931] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 275,
            green = 295,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 11223,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [13933] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 275,
            green = 295,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11224,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [13935] = {
        difficulty = {
            learnedAt = 235,
            orange = 255,
            yellow = 275,
            green = 295,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 5800,
            },
        },
        recipeItems = {},
    },

    [13937] = {
        difficulty = {
            learnedAt = 240,
            orange = 260,
            yellow = 280,
            green = 300,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 6200,
            },
        },
        recipeItems = {},
    },

    [13939] = {
        difficulty = {
            learnedAt = 240,
            orange = 260,
            yellow = 280,
            green = 300,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 6200,
            },
        },
        recipeItems = {},
    },

    [13941] = {
        difficulty = {
            learnedAt = 245,
            orange = 265,
            yellow = 285,
            green = 305,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 6200,
            },
        },
        recipeItems = {},
    },

    [13943] = {
        difficulty = {
            learnedAt = 245,
            orange = 265,
            yellow = 285,
            green = 305,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 6200,
            },
        },
        recipeItems = {},
    },

    [13945] = {
        difficulty = {
            learnedAt = 245,
            orange = 265,
            yellow = 285,
            green = 305,
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
                itemID = 11225,
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

    [13947] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 290,
            green = 310,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11226,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [13948] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 290,
            green = 310,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 6500,
            },
        },
        recipeItems = {},
    },

    [14293] = {
        difficulty = {
            learnedAt = 10,
            orange = 75,
            yellow = 95,
            green = 115,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 50,
            },
        },
        recipeItems = {},
    },

    [14807] = {
        difficulty = {
            learnedAt = 70,
            orange = 110,
            yellow = 130,
            green = 150,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 200,
            },
        },
        recipeItems = {},
    },

    [14809] = {
        difficulty = {
            learnedAt = 155,
            orange = 175,
            yellow = 195,
            green = 215,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2600,
            },
        },
        recipeItems = {},
    },

    [14810] = {
        difficulty = {
            learnedAt = 175,
            orange = 195,
            yellow = 215,
            green = 235,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 3000,
            },
        },
        recipeItems = {},
    },

    [15596] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 305,
            green = 325,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 11813,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 9025,
                        npcName = "Lord Roccor",
                        wowheadZoneID = 1584,
                    },
                },
            },
        },
    },

    [17181] = {
        difficulty = {
            learnedAt = 250,
            orange = 250,
            yellow = 255,
            green = 260,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 10000,
            },
        },
        recipeItems = {},
    },

    [17180] = {
        difficulty = {
            learnedAt = 250,
            orange = 250,
            yellow = 255,
            green = 260,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 10000,
            },
        },
        recipeItems = {},
    },

    [20008] = {
        difficulty = {
            learnedAt = 255,
            orange = 275,
            yellow = 295,
            green = 315,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16214,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 2642,
                        npcName = "Vilebranch Shadowcaster",
                        wowheadZoneID = 47,
                    },
                },
            },
        },
    },

    [20020] = {
        difficulty = {
            learnedAt = 260,
            orange = 280,
            yellow = 300,
            green = 320,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16215,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [20014] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 305,
            green = 325,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16216,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        wowheadZoneID = 1477,
                    },
                },
            },
        },
    },

    [20017] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 305,
            green = 325,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 16217,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [20009] = {
        difficulty = {
            learnedAt = 270,
            orange = 290,
            yellow = 310,
            green = 330,
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
                itemID = 16218,
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

    [20012] = {
        difficulty = {
            learnedAt = 270,
            orange = 290,
            yellow = 310,
            green = 330,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16219,
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

    [20024] = {
        difficulty = {
            learnedAt = 275,
            orange = 295,
            yellow = 315,
            green = 335,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16220,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [20026] = {
        difficulty = {
            learnedAt = 275,
            orange = 295,
            yellow = 315,
            green = 335,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 16221,
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

    [20016] = {
        difficulty = {
            learnedAt = 280,
            orange = 300,
            yellow = 320,
            green = 340,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16222,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 9447,
                        npcName = "Scarlet Warder",
                        wowheadZoneID = 139,
                    },
                },
            },
        },
    },

    [20029] = {
        difficulty = {
            learnedAt = 285,
            orange = 305,
            yellow = 325,
            green = 345,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16223,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7524,
                        npcName = "Anguished Highborne",
                        wowheadZoneID = 618,
                    },
                },
            },
        },
    },

    [20015] = {
        difficulty = {
            learnedAt = 285,
            orange = 305,
            yellow = 325,
            green = 345,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 16224,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12022,
                        npcName = "Lorelae Wintersong",
                        wowheadZoneID = 493,
                    },
                },
            },
        },
    },

    [20028] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 330,
            green = 350,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16242,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 9452,
                        npcName = "Scarlet Enchanter",
                        wowheadZoneID = 139,
                    },
                },
            },
        },
    },

    [20051] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 330,
            green = 350,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 16243,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 12022,
                        npcName = "Lorelae Wintersong",
                        wowheadZoneID = 493,
                    },
                },
            },
        },
    },

    [20013] = {
        difficulty = {
            learnedAt = 295,
            orange = 315,
            yellow = 335,
            green = 355,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16244,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 9198,
                        npcName = "Spirestone Mystic",
                        wowheadZoneID = 1583,
                    },
                },
            },
        },
    },

    [20023] = {
        difficulty = {
            learnedAt = 295,
            orange = 315,
            yellow = 335,
            green = 355,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16245,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [20010] = {
        difficulty = {
            learnedAt = 295,
            orange = 315,
            yellow = 335,
            green = 355,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16246,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 7372,
                        npcName = "Deadwind Warlock",
                        wowheadZoneID = 41,
                    },
                },
            },
        },
    },

    [20030] = {
        difficulty = {
            learnedAt = 295,
            orange = 315,
            yellow = 335,
            green = 355,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16247,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 10317,
                        npcName = "Blackhand Elite",
                        wowheadZoneID = 1583,
                    },
                },
            },
        },
    },

    [20033] = {
        difficulty = {
            learnedAt = 295,
            orange = 315,
            yellow = 335,
            green = 355,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16248,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [20036] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16249,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 10422,
                        npcName = "Crimson Sorcerer",
                        wowheadZoneID = 2017,
                    },
                },
            },
        },
    },

    [20031] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16250,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 9216,
                        npcName = "Spirestone Warlord",
                        wowheadZoneID = 1583,
                    },
                },
            },
        },
    },

    [20011] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16251,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [20034] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16252,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 4494,
                        npcName = "Scarlet Spellbinder",
                        wowheadZoneID = 28,
                    },
                },
            },
        },
    },

    [20025] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16253,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [20032] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16254,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [20035] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 16255,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 10469,
                        npcName = "Scholomance Adept",
                        wowheadZoneID = 2057,
                    },
                },
            },
        },
    },

    [21931] = {
        difficulty = {
            learnedAt = 190,
            orange = 210,
            yellow = 230,
            green = 250,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 17725,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [22749] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 18259,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [22750] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 18260,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [23799] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 330,
            green = 350,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19444,
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

    [23800] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 330,
            green = 350,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19445,
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

    [23801] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 330,
            green = 350,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19446,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [23802] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {},
    },

    [23803] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19448,
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

    [23804] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 19449,
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

    [25072] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 20726,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [25073] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 20727,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [25074] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 20728,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [25078] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 20729,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [25079] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 20730,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [25080] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 20731,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [25081] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 20732,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 15419,
                        npcName = "Kania",
                        wowheadZoneID = 1377,
                    },
                },
            },
            {
                itemID = 229008,
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

    [25082] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 20733,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 15419,
                        npcName = "Kania",
                        wowheadZoneID = 1377,
                    },
                },
            },
            {
                itemID = 229009,
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

    [25083] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 20734,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [25084] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 20735,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [25086] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 20736,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [25124] = {
        difficulty = {
            learnedAt = 45,
            orange = 45,
            yellow = 47,
            green = 65,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 20758,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [25125] = {
        difficulty = {
            learnedAt = 150,
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
                itemID = 20752,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [25126] = {
        difficulty = {
            learnedAt = 200,
            orange = 210,
            yellow = 220,
            green = 230,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 20753,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [25127] = {
        difficulty = {
            learnedAt = 250,
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
                itemID = 20754,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [25128] = {
        difficulty = {
            learnedAt = 275,
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
                itemID = 20755,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [25129] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 20756,
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

    [25130] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 320,
            green = 330,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 20757,
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

    [27837] = {
        difficulty = {
            learnedAt = 290,
            orange = 310,
            yellow = 330,
            green = 350,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 22392,
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

    [430409] = {
        difficulty = {
            learnedAt = 100,
            orange = 0,
            yellow = 100,
            green = 110,
        },
        sources = {},
        recipeItems = {},
    },

    [435481] = {
        difficulty = {
            learnedAt = 200,
            orange = 0,
            yellow = 200,
            green = 217,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 215129,
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

    [435903] = {
        difficulty = {
            learnedAt = 200,
            orange = 0,
            yellow = 200,
            green = 220,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 215138,
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

    [439134] = {
        difficulty = {
            learnedAt = 175,
            orange = 175,
            yellow = 195,
            green = 215,
        },
        sources = {
            {
                type = "trainer",
                trainingCost = 2666,
            },
        },
        recipeItems = {},
    },

    [439156] = {
        difficulty = {
            learnedAt = 225,
            orange = 0,
            yellow = 225,
            green = 227,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {},
    },

    [446243] = {
        difficulty = {
            learnedAt = 250,
            orange = 250,
            yellow = 255,
            green = 260,
        },
        sources = {},
        recipeItems = {},
    },

    [448624] = {
        difficulty = {
            learnedAt = 120,
            orange = 120,
            yellow = 140,
            green = 160,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 223163,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                    },
                },
            },
        },
    },

    [463871] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 228982,
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

    [463869] = {
        difficulty = {
            learnedAt = 285,
            orange = 0,
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
                itemID = 228981,
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

    [463866] = {
        difficulty = {
            learnedAt = 305,
            orange = 0,
            yellow = 305,
            green = 312,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {},
    },

    [471400] = {
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
                itemID = 232610,
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

    [1213593] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1213595] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1213598] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1213600] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1213603] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1213607] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
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
                itemID = 234271,
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

    [1213610] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 234272,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                        npcID = 15419,
                        npcName = "Kania",
                        wowheadZoneID = 1377,
                    },
                },
            },
        },
    },

    [1213616] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1213622] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249536,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1213626] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249534,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1213628] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1213633] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1213635] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1216005] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1216007] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1216010] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1216014] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1216016] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1216018] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1216020] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1216022] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1216024] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1217189] = {
        difficulty = {
            learnedAt = 320,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {},
        recipeItems = {},
    },

    [1217203] = {
        difficulty = {
            learnedAt = 320,
            orange = 0,
            yellow = 320,
            green = 340,
        },
        sources = {},
        recipeItems = {},
    },

    [1219577] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 274391,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1219578] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 274392,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1219579] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274393,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1219580] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274394,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1219581] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 274395,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1220623] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 274400,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1220624] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274401,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1219587] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274399,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1230643] = {
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

    [1231128] = {
        difficulty = {
            learnedAt = 305,
            orange = 0,
            yellow = 305,
            green = 307,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 241191,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1231139] = {
        difficulty = {
            learnedAt = 305,
            orange = 0,
            yellow = 305,
            green = 307,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 241195,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1231164] = {
        difficulty = {
            learnedAt = 280,
            orange = 305,
            yellow = 307,
            green = 310,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 241201,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1232172] = {
        difficulty = {
            learnedAt = 305,
            orange = 0,
            yellow = 305,
            green = 307,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 242361,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1245320] = {
        difficulty = {
            learnedAt = 10,
            orange = 10,
            yellow = 12,
            green = 15,
        },
        sources = {},
        recipeItems = {},
    },

    [1245321] = {
        difficulty = {
            learnedAt = 10,
            orange = 10,
            yellow = 12,
            green = 15,
        },
        sources = {},
        recipeItems = {},
    },

    [1248458] = {
        difficulty = {
            learnedAt = 70,
            orange = 110,
            yellow = 130,
            green = 150,
        },
        sources = {
            {
                type = "drop",
            },
        },
        recipeItems = {
            {
                itemID = 249474,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 1768,
                        npcName = "Vile Fin Tidehunter",
                        wowheadZoneID = 130,
                    },
                },
            },
        },
    },

    [1248459] = {
        difficulty = {
            learnedAt = 90,
            orange = 120,
            yellow = 140,
            green = 160,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 249475,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1248752] = {
        difficulty = {
            learnedAt = 130,
            orange = 140,
            yellow = 160,
            green = 180,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249476,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248754] = {
        difficulty = {
            learnedAt = 130,
            orange = 140,
            yellow = 160,
            green = 180,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249477,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248755] = {
        difficulty = {
            learnedAt = 130,
            orange = 140,
            yellow = 160,
            green = 180,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249478,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248757] = {
        difficulty = {
            learnedAt = 140,
            orange = 140,
            yellow = 160,
            green = 180,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249479,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248760] = {
        difficulty = {
            learnedAt = 140,
            orange = 140,
            yellow = 160,
            green = 180,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249480,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248805] = {
        difficulty = {
            learnedAt = 140,
            orange = 140,
            yellow = 160,
            green = 180,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249481,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248703] = {
        difficulty = {
            learnedAt = 140,
            orange = 140,
            yellow = 160,
            green = 180,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249482,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248739] = {
        difficulty = {
            learnedAt = 140,
            orange = 140,
            yellow = 160,
            green = 180,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249483,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248745] = {
        difficulty = {
            learnedAt = 140,
            orange = 140,
            yellow = 160,
            green = 180,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249484,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248748] = {
        difficulty = {
            learnedAt = 140,
            orange = 140,
            yellow = 160,
            green = 180,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249485,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248461] = {
        difficulty = {
            learnedAt = 185,
            orange = 205,
            yellow = 225,
            green = 245,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 249487,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1248497] = {
        difficulty = {
            learnedAt = 190,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {},
        recipeItems = {},
    },

    [1248974] = {
        difficulty = {
            learnedAt = 210,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249493,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249006] = {
        difficulty = {
            learnedAt = 210,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249494,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249015] = {
        difficulty = {
            learnedAt = 210,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249495,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249019] = {
        difficulty = {
            learnedAt = 210,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249496,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249057] = {
        difficulty = {
            learnedAt = 210,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249502,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249058] = {
        difficulty = {
            learnedAt = 210,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249503,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249059] = {
        difficulty = {
            learnedAt = 210,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249504,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249060] = {
        difficulty = {
            learnedAt = 210,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249505,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249061] = {
        difficulty = {
            learnedAt = 220,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249506,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249064] = {
        difficulty = {
            learnedAt = 220,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249507,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249069] = {
        difficulty = {
            learnedAt = 220,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249508,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249070] = {
        difficulty = {
            learnedAt = 220,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249509,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249071] = {
        difficulty = {
            learnedAt = 220,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249510,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248510] = {
        difficulty = {
            learnedAt = 210,
            orange = 230,
            yellow = 250,
            green = 270,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 249511,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1248509] = {
        difficulty = {
            learnedAt = 215,
            orange = 235,
            yellow = 255,
            green = 275,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 249512,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1248511] = {
        difficulty = {
            learnedAt = 220,
            orange = 240,
            yellow = 260,
            green = 280,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 249513,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1248500] = {
        difficulty = {
            learnedAt = 240,
            orange = 260,
            yellow = 280,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 249514,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1248505] = {
        difficulty = {
            learnedAt = 245,
            orange = 265,
            yellow = 285,
            green = 305,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 249515,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1248528] = {
        difficulty = {
            learnedAt = 250,
            orange = 270,
            yellow = 290,
            green = 310,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 249516,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1249107] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 305,
            green = 325,
        },
        sources = {},
        recipeItems = {},
    },

    [1249112] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 305,
            green = 325,
        },
        sources = {},
        recipeItems = {},
    },

    [1249114] = {
        difficulty = {
            learnedAt = 265,
            orange = 285,
            yellow = 305,
            green = 325,
        },
        sources = {},
        recipeItems = {},
    },

    [1248515] = {
        difficulty = {
            learnedAt = 275,
            orange = 285,
            yellow = 295,
            green = 305,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 249522,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1248599] = {
        difficulty = {
            learnedAt = 295,
            orange = 315,
            yellow = 335,
            green = 355,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 249524,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1248607] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249525,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248636] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249526,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249128] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249529,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249152] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249530,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1249154] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249532,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248645] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249535,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248650] = {
        difficulty = {
            learnedAt = 275,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249537,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248661] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249538,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248665] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249539,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1248460] = {
        difficulty = {
            learnedAt = 140,
            orange = 165,
            yellow = 185,
            green = 205,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249486,
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

    [1248498] = {
        difficulty = {
            learnedAt = 205,
            orange = 225,
            yellow = 245,
            green = 265,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 249489,
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

    [1248640] = {
        difficulty = {
            learnedAt = 300,
            orange = 320,
            yellow = 340,
            green = 360,
        },
        sources = {
            {
                type = "vendor",
            },
        },
        recipeItems = {
            {
                itemID = 274398,
                faction = nil,
                sources = {
                    {
                        type = "vendor",
                    },
                },
            },
        },
    },

    [1263056] = {
        difficulty = {
            learnedAt = 140,
            orange = 0,
            yellow = 140,
            green = 142,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 273103,
                faction = nil,
                sources = {
                    {
                        type = "drop",
                        npcID = 250657,
                        npcName = "Rath'mael",
                    },
                },
            },
        },
    },

    [1263082] = {
        difficulty = {
            learnedAt = 300,
            orange = 0,
            yellow = 300,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 273116,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1294054] = {
        difficulty = {
            learnedAt = 295,
            orange = 295,
            yellow = 297,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 274424,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1306520] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279295,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1306521] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279296,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1306522] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279297,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1306523] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279298,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1306524] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279299,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1306525] = {
        difficulty = {
            learnedAt = 300,
            orange = 310,
            yellow = 317,
            green = 325,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 279300,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1248668] = {
        difficulty = {
            learnedAt = 290,
            orange = 295,
            yellow = 297,
            green = 300,
        },
        sources = {},
        recipeItems = {
            {
                itemID = 249523,
                faction = nil,
                sources = {
                },
            },
        },
    },

    [1328948] = { -- Enchant Boots - Speed
        difficulty = {
            learnedAt = 280,
            orange = 280,
            yellow = 290,
            green = 300,
        },
        sources = {},
        recipeItems = {},
    },


}
