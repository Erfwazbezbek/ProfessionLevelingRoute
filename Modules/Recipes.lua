-- Recipes.lua
local ADDON, ns = ...
local Recipes = {}
ns.Recipes = Recipes

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
    page.title = page:CreateFontString(
        nil,
        "OVERLAY",
        "GameFontNormalLarge"
    )
    page.title:SetPoint( "CENTER" )
    page.title:SetText( "Here be recipes! Soon(tm)" )
end
