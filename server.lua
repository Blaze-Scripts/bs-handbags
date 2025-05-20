local RSGCore = exports['rsg-core']:GetCoreObject()
local Config = require 'config'

---@class HandbagItem
---@field model string The model name of the handbag
---@field item string The item name in the inventory
---@field label string The display name of the handbag
---@field weight number Weight of the item
---@field description string Description of the item

-- Register all handbags dynamically
CreateThread(function()
    -- First add all items to the shared items
    local itemsToAdd = {}
    
    for _, handbag in ipairs(Config.Handbags) do
        itemsToAdd[handbag.item] = {
            name = handbag.item,
            label = handbag.label,
            weight = handbag.weight,
            type = 'item',
            image = handbag.model .. '.png',
            unique = false,
            useable = true,
            shouldClose = true,
            description = handbag.description
        }
    end
    
    -- Add items to shared items
    exports['rsg-core']:AddItems(itemsToAdd)
    
    -- Register all handbags as usable items
    for _, handbag in ipairs(Config.Handbags) do
        RSGCore.Functions.CreateUseableItem(handbag.item, function(source, item)
            local src = source
            local Player = RSGCore.Functions.GetPlayer(src)
            
            if not Player then return end
            
            -- Toggle the handbag on the player
            TriggerClientEvent('bs-handbags:client:toggleBag', src, handbag.model)
        end)
    end
    
    -- Log that the script has initialized
    print('^2[bs-handbags]^7 Initialized with ' .. #Config.Handbags .. ' handbags')
end)
