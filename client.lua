local RSGCore = exports['rsg-core']:GetCoreObject()
local Config = require 'config'
local activeBag = nil

---@param model string The model name of the handbag to attach
---@return number|nil The entity handle of the created prop, or nil if failed
local function attachHandbag(model)
    -- Delete any existing bag first
    if activeBag and DoesEntityExist(activeBag) then
        DeleteObject(activeBag)
        activeBag = nil
    end
    
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    
    -- Request and load the model
    local modelHash = GetHashKey(model)
    RequestModel(modelHash)
    
    -- Wait for model to load with a timeout
    local timeout = 500
    while not HasModelLoaded(modelHash) and timeout > 0 do
        Wait(10)
        timeout = timeout - 10
    end
    
    -- Check if model loaded successfully
    if not HasModelLoaded(modelHash) then
        lib.notify({
            title = Config.Notifications.error.title,
            description = Config.Notifications.error.modelLoad,
            type = 'error'
        })
        return nil
    end
    
    -- Create the object
    local prop = CreateObject(modelHash, coords.x, coords.y, coords.z, true, true, true)
    if not DoesEntityExist(prop) then
        lib.notify({
            title = Config.Notifications.error.title,
            description = Config.Notifications.error.createBag,
            type = 'error'
        })
        return nil
    end
    
    -- Set as mission entity to prevent automatic cleanup
    SetEntityAsMissionEntity(prop, true, true)
    
    -- Build attachment data from config
    local attachData = {}
    for _, handbag in ipairs(Config.Handbags) do
        attachData[handbag.model] = {
            bone = handbag.bone,
            pos = handbag.pos,
            rot = handbag.rot
        }
    end
    
    -- Get attachment data for the model
    local data = attachData[model]
    
    if not data then
        lib.notify({
            title = Config.Notifications.error.title,
            description = Config.Notifications.error.unknownModel,
            type = 'error'
        })
        DeleteObject(prop)
        return nil
    end
    
    -- Attach the object to the player
    local boneIndex = GetEntityBoneIndexByName(player, data.bone)
    AttachEntityToEntity(
        prop, player, boneIndex,
        data.pos.x, data.pos.y, data.pos.z,
        data.rot.x, data.rot.y, data.rot.z,
        true, true, false, true, 1, true
    )
    
    return prop
end

---@param bagType string The type of handbag to equip
RegisterNetEvent('bs-handbags:client:toggleBag', function(modelName)
    -- If we already have a bag equipped
    if activeBag and DoesEntityExist(activeBag) then
        -- Remove the current bag
        DeleteObject(activeBag)
        activeBag = nil
        lib.notify({
            title = Config.Notifications.success.title,
            description = Config.Notifications.success.stowed,
            type = 'inform'
        })
    else
        -- Equip the new bag
        activeBag = attachHandbag(modelName)
        if activeBag then
            lib.notify({
                title = Config.Notifications.success.title,
                description = Config.Notifications.success.equipped,
                type = 'success'
            })
        end
    end
end)

-- Handle resource stop to clean up props
AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    
    if activeBag and DoesEntityExist(activeBag) then
        DeleteObject(activeBag)
        activeBag = nil
    end
end)

-- Update core object when it changes
RegisterNetEvent('RSGCore:Client:UpdateObject', function()
    RSGCore = exports['rsg-core']:GetCoreObject()
end)