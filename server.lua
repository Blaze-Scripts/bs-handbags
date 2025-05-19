local RSGCore = exports['rsg-core']:GetCoreObject()

---@class HandbagItem
---@field model string The model name of the handbag
---@field item string The item name in the inventory
---@field label string The display name of the handbag
---@field weight number Weight of the item
---@field description string Description of the item

-- Define all available handbags
local handbags = {
    { 
        model = "mp004_p_cs_jessicapurse01x", 
        item = "bs_handbag_fancy", 
        label = "Elegant Handbag",
        weight = 150,
        description = "An elegant handbag for special occasions"
    },
    { 
        model = "s_penelopepurse01x", 
        item = "bs_handbag_penelope", 
        label = "Penelope Handbag",
        weight = 150,
        description = "A fine handbag in Penelope style"
    },
    { 
        model = "s_pursefancy01x", 
        item = "bs_handbag_purse1", 
        label = "Fine Handbag",
        weight = 150,
        description = "A fine handbag for the lady of society"
    },
    { 
        model = "s_pursefancy02x", 
        item = "bs_handbag_purse2", 
        label = "Ornate Handbag",
        weight = 150,
        description = "A beautifully ornate handbag"
    },
    { 
        model = "p_bag01x", 
        item = "bs_handbag_workbag", 
        label = "Work Bag",
        weight = 250,
        description = "A robust bag for daily work"
    },
    { 
        model = "p_cs_bagstrauss01x", 
        item = "bs_handbag_classy", 
        label = "Classy Bag",
        weight = 200,
        description = "A classic bag with timeless design"
    },
    { 
        model = "p_bag_leather_doctor", 
        item = "bs_handbag_doctor", 
        label = "Doctor's Bag",
        weight = 300,
        description = "A bag for medical supplies"
    },
    { 
        model = "p_cane01x", 
        item = "bs_handbag_cane", 
        label = "Walking Cane",
        weight = 200,
        description = "An elegant cane for the distinguished gentleman"
    },
}

-- Register all handbags dynamically
CreateThread(function()
    -- First add all items to the shared items
    local itemsToAdd = {}
    
    for _, handbag in ipairs(handbags) do
        itemsToAdd[handbag.item] = {
            name = handbag.item,
            label = handbag.label,
            weight = handbag.weight,
            type = 'item',
            image = handbag.item .. '.png',
            unique = false,
            useable = true,
            shouldClose = true,
            description = handbag.description
        }
    end
    
    -- Add items to shared items
    exports['rsg-core']:AddItems(itemsToAdd)
    
    -- Register all handbags as usable items
    for _, handbag in ipairs(handbags) do
        RSGCore.Functions.CreateUseableItem(handbag.item, function(source, item)
            local src = source
            local Player = RSGCore.Functions.GetPlayer(src)
            
            if not Player then return end
            
            -- Toggle the handbag on the player
            TriggerClientEvent('bs-handbags:client:toggleBag', src, handbag.model)
        end)
    end
    
    -- Log that the script has initialized
    print('^2[bs-handbags]^7 Initialized with ' .. #handbags .. ' handbags')
end)
