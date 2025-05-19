local RSGCore = exports['rsg-core']:GetCoreObject()
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
            title = 'Error',
            description = 'Error loading model',
            type = 'error'
        })
        return nil
    end
    
    -- Create the object
    local prop = CreateObject(modelHash, coords.x, coords.y, coords.z, true, true, true)
    if not DoesEntityExist(prop) then
        lib.notify({
            title = 'Error',
            description = 'Error creating handbag',
            type = 'error'
        })
        return nil
    end
    
    -- Set as mission entity to prevent automatic cleanup
    SetEntityAsMissionEntity(prop, true, true)
    
    -- Define attachment positions based on model
    local attachData = {
        ["s_pursefancy01x"] = {bone = "Skel_L_Hand", pos = {x = 0.3, y = -0.0, z = 0.1}, rot = {x = 69.8, y = 188.2, z = 90.0}},
        ["mp004_p_cs_jessicapurse01x"] = {bone = "Skel_L_Hand", pos = {x = 0.43, y = 0.02, z = 0.19}, rot = {x = 69.4, y = 176.5, z = 89.8}},
        ["s_pursefancy02x"] = {bone = "Skel_L_Hand", pos = {x = 0.4, y = 0.02, z = 0.11}, rot = {x = 69.8, y = 188.2, z = 90.0}},
        ["s_penelopepurse01x"] = {bone = "Skel_L_Hand", pos = {x = 0.35, y = -0.0, z = 0.1}, rot = {x = 80.0, y = 180.0, z = 90.0}},
        ["p_bag01x"] = {bone = "Skel_L_Hand", pos = {x = 0.39, y = -0.0, z = 0.2}, rot = {x = 66.0, y = 185.0, z = 95.0}},
        ["p_cs_bagstrauss01x"] = {bone = "Skel_L_Hand", pos = {x = 0.40, y = -0.0, z = 0.2}, rot = {x = 70.0, y = 178.0, z = 95.0}},
        ["p_cane01x"] = {bone = "Skel_L_Hand", pos = {x = 0.9, y = -0.0, z = 0.38}, rot = {x = 66.0, y = 182.0, z = 92.0}},
        ["p_bag_leather_doctor"] = {bone = "Skel_L_Hand", pos = {x = 0.28, y = 0.03, z = 0.12}, rot = {x = 70.0, y = 178.0, z = 95.0}}
    }
    
    -- Get attachment data for the model
    local data = attachData[model]
    
    if not data then
        lib.notify({
            title = 'Error',
            description = 'Unknown handbag model',
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
            title = 'Handbag',
            description = 'Handbag stowed',
            type = 'inform'
        })
    else
        -- Equip the new bag
        activeBag = attachHandbag(modelName)
        if activeBag then
            lib.notify({
                title = 'Handbag',
                description = 'Handbag equipped',
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