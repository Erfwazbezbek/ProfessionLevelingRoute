-- Inventory.lua - persistent, account-wide snapshots for PLR.
-- Bags are live for the active character; banks are snapshots taken while open.
local ADDON, ns = ...
local Inventory = {}
ns.Inventory = Inventory
local bankOpen, accountOpen = false, false
local onChange

local function DB()
    if type(PLRDB) ~= "table" then PLRDB = {} end
    if type(PLRDB.plannerInventory) ~= "table" then PLRDB.plannerInventory = {} end
    if type(PLRDB.inventory27) ~= "table" then PLRDB.inventory27 = {} end
    local db = PLRDB.inventory27
    if type(db.characters) ~= "table" then db.characters = {} end
    if type(db.warband) ~= "table" then db.warband = {} end
    -- Corrupted per-character snapshots must not break live inventory queries.
    for key, data in pairs(db.characters) do
        if type(data) ~= "table" then
            db.characters[key] = nil
        else
            if data.bags ~= nil and type(data.bags) ~= "table" then data.bags = nil end
            if data.bank ~= nil and type(data.bank) ~= "table" then data.bank = nil end
        end
    end
    return db
end

local function CharacterKey()
    if ns.Characters and type(ns.Characters._Char) == 'function' and type(ns.Characters._CharKey) == 'function' then
        local ok, char = pcall(ns.Characters._Char, ns.Characters)
        if ok and char then
            local success, key = pcall(ns.Characters._CharKey, ns.Characters, char)
            if success and key then return key end
        end
    end
    local name = UnitName('player')
    local realm = GetRealmID and GetRealmID()
    if name and realm then return name .. '-' .. tostring(realm) end
end
Inventory.CurrentCharacterKey = CharacterKey

local function ScanBags(ids)
    local counts = {}
    -- A successful query with real slots confirms the container is readable.
    -- An empty item map alone cannot distinguish an empty bank from an unloaded one.
    local readableSlots = false
    if not C_Container or type(C_Container.GetContainerNumSlots) ~= 'function' or
        type(C_Container.GetContainerItemInfo) ~= 'function' then return nil end
    for _, bag in ipairs(ids) do
        local ok, slots = pcall(C_Container.GetContainerNumSlots, bag)
        if ok and type(slots) == 'number' and slots > 0 then
            readableSlots = true
            for slot = 1, slots do
                local good, info = pcall(C_Container.GetContainerItemInfo, bag, slot)
                if good and info and type(info.itemID) == 'number' then
                    counts[info.itemID] = (counts[info.itemID] or 0) + (info.stackCount or 1)
                end
            end
        end
    end
    return counts, readableSlots
end

local function SameCounts(old, new)
    if type(old) ~= 'table' then return false end
    for itemID, count in pairs(new) do
        if old[itemID] ~= count then return false end
    end
    for itemID, count in pairs(old) do
        if new[itemID] ~= count then return false end
    end
    return true
end

local function BagIDs()
    local ids = {}
    for i = 0, (NUM_BAG_SLOTS or 4) do ids[#ids + 1] = i end
    return ids
end

local function BankIDs()
    local ids, seen = {}, {}
    local function add(id)
        if type(id) == 'number' and not seen[id] then seen[id] = true; ids[#ids+1] = id end
    end
    local e = Enum and Enum.BagIndex or {}
    add(e.Bank)
    add(e.ReagentBank)
    for i = 1, 12 do add(e['BankBag_' .. i]) end
    -- Classic/legacy bank slots; bank open is required for scanning.
    if #ids == 0 then
        add(BANK_CONTAINER or -1)
        add(REAGENTBANK_CONTAINER or -3)
        for i = 5, (NUM_BAG_SLOTS or 4) + (NUM_BANKBAGSLOTS or 7) do add(i) end
    end
    return ids
end

local function AccountIDs()
    local ids, seen = {}, {}
    local e = Enum and Enum.BagIndex or {}
    for i = 1, 10 do
        local id = e['AccountBankTab_' .. i]
        if type(id) == 'number' and not seen[id] then ids[#ids+1] = id; seen[id] = true end
    end
    return ids
end

local function notify()
    if onChange then onChange() end
end

function Inventory:ScanBags()
    local key = CharacterKey()
    if not key then return end
    local counts = ScanBags(BagIDs())
    if not counts then return end
    local db = DB()
    if type(db.characters[key]) ~= "table" then db.characters[key] = {} end
    local changed = not SameCounts(db.characters[key].bags, counts)
    db.characters[key].bags = counts
    PLRDB.plannerInventory[key] = counts -- compatibility with PLR 2.6
    if changed then notify() end
end

function Inventory:ScanBank()
    if not bankOpen then return end
    local key = CharacterKey()
    if not key then return end
    local ids = BankIDs()
    if #ids == 0 then return end
    local counts, readable = ScanBags(ids)
    -- Allow a confirmed empty bank to replace an old populated snapshot.
    -- Never erase a snapshot if the bank container has not loaded.
    if not counts or not readable then return end
    local db = DB()
    if type(db.characters[key]) ~= "table" then db.characters[key] = {} end
    local changed = not SameCounts(db.characters[key].bank, counts)
    db.characters[key].bank = counts
    if changed then notify() end
end

function Inventory:ScanWarband()
    if not accountOpen then return end
    local ids = AccountIDs()
    if #ids == 0 then return end -- unsupported clients: retain last snapshot
    local counts, readable = ScanBags(ids)
    if not counts or not readable then return end -- account tabs may not have loaded
    local db = DB()
    local changed = not SameCounts(db.warband, counts)
    db.warband = counts
    if changed then notify() end
end

-- The active character must use Blizzard's live item count, not a cached
-- container scan. This is the same API path that worked before PLR 2.7.
-- The count excludes bank storage, which is tracked separately below.
local function LiveBagCount(itemID)
    if C_Item and type(C_Item.GetItemCount) == 'function' then
        local ok, count = pcall(C_Item.GetItemCount, itemID, false, false, false)
        if ok and type(count) == 'number' then return count end
    end
    if type(GetItemCount) == 'function' then
        local ok, count = pcall(GetItemCount, itemID, false)
        if ok and type(count) == 'number' then return count end
    end
    return nil
end

function Inventory:GetBreakdown(itemID, selected)
    local db = DB()
    local current = CharacterKey()
    local activeBags = 0
    local bank = 0
    local others = 0
    local warband = db.warband[itemID] or 0
    local selectedBags = 0
    for key, data in pairs(db.characters) do
        if type(data) ~= "table" then data = {} end
        local bags = (data.bags and data.bags[itemID]) or 0
        local savedBank = (data.bank and data.bank[itemID]) or 0
        if key == current then
            -- Live inventory overrides the snapshot even when the bag scan
            -- did not populate this item or the cache is stale.
            activeBags = LiveBagCount(itemID) or bags
        end
        if key == selected then
            selectedBags = key == current and activeBags or bags
        end
        if key == selected then bank = savedBank end
        if key ~= current then others = others + bags end
    end
    -- Include banks for every character once, including current character.
    local total = warband
    for key, data in pairs(db.characters) do
        if type(data) ~= "table" then data = {} end
        -- Never count both the live bags and their saved snapshot.
        total = total + (key == current and activeBags
            or ((data.bags and data.bags[itemID]) or 0))
        total = total + ((data.bank and data.bank[itemID]) or 0)
    end
    -- The active character might not have a snapshot yet.
    if current and not db.characters[current] then
        activeBags = LiveBagCount(itemID) or 0
        total = total + activeBags
        if selected == current then selectedBags = activeBags end
    end
    return {
        total = total, currentBags = activeBags, selectedBags = selectedBags,
        selectedBank = bank, otherBags = others, warband = warband,
        characters = db.characters,
    }
end

function Inventory:GetOwned(itemID, selected)
    return self:GetBreakdown(itemID, selected).total
end

function Inventory:ShowBreakdown(tooltip, itemID)
    local data = self:GetBreakdown(itemID)
    tooltip:AddLine('Account inventory breakdown', 1, .82, 0)
    local key = CharacterKey()
    if key then tooltip:AddDoubleLine('Current bags', tostring(data.currentBags), 1,1,1, 1,1,1) end
    local keys = {}
    for char in pairs(data.characters) do keys[#keys+1] = char end
    table.sort(keys)
    for _, char in ipairs(keys) do
        local v = data.characters[char]
        if type(v) ~= "table" then v = {} end
        if char ~= key and v.bags then
            tooltip:AddDoubleLine(char .. ' bags (saved)', tostring(v.bags[itemID] or 0), .7,.7,.7, 1,1,1)
        end
        if v.bank then
            tooltip:AddDoubleLine(char .. ' bank (saved)', tostring(v.bank[itemID] or 0), .7,.7,.7, 1,1,1)
        end
    end
    tooltip:AddDoubleLine('Warband bank (saved)', tostring(data.warband), .7,.7,.7, 1,1,1)
    tooltip:AddDoubleLine('Total', tostring(data.total), .3,1,.3, 1,1,1)
end

function Inventory:Initialize(callback)
    onChange = callback
    -- Import existing PLR 2.6 snapshots for characters not yet rescanned.
    local db = DB()
    for key, bags in pairs(PLRDB.plannerInventory or {}) do
        if type(bags) == "table" then
            if type(db.characters[key]) ~= "table" then db.characters[key] = {} end
            if type(db.characters[key].bags) ~= "table" then db.characters[key].bags = bags end
        end
    end
    local frame = CreateFrame('Frame')
    self.eventFrame = frame
    local events = {
        'PLAYER_ENTERING_WORLD', 'BAG_UPDATE_DELAYED', 'BANKFRAME_OPENED',
        'BANKFRAME_CLOSED', 'PLAYERBANKSLOTS_CHANGED', 'PLAYERREAGENTBANKSLOTS_CHANGED',
        'ACCOUNT_BANK_TAB_SLOTS_CHANGED', 'ACCOUNT_BANK_TAB_SELECTED',
        'ACCOUNT_BANK_PANEL_SHOW', 'ACCOUNT_BANK_PANEL_HIDE',
    }
    for _, event in ipairs(events) do pcall(frame.RegisterEvent, frame, event) end
    frame:SetScript('OnEvent', function(_, event)
        if event == 'BANKFRAME_OPENED' then
            bankOpen = true
            accountOpen = true -- account tabs are queried only if supported
        elseif event == 'BANKFRAME_CLOSED' then
            bankOpen = false
            accountOpen = false
        elseif event == 'ACCOUNT_BANK_PANEL_SHOW' then
            accountOpen = true
        elseif event == 'ACCOUNT_BANK_PANEL_HIDE' then
            accountOpen = false
        end
        if event == 'PLAYER_ENTERING_WORLD' or event == 'BAG_UPDATE_DELAYED' then
            Inventory:ScanBags()
        end
        if bankOpen and event ~= 'BANKFRAME_CLOSED' then Inventory:ScanBank() end
        if accountOpen and event ~= 'BANKFRAME_CLOSED' then Inventory:ScanWarband() end
    end)
    self:ScanBags()
end
