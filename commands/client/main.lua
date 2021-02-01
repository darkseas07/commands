RegisterNetEvent("commands:TeleportToWayPoint")
AddEventHandler("commands:TeleportToWayPoint", function (source)
    local playerSrc = GetPlayerPed(GetPlayerFromServerId(source))
    local WaypointHandle = GetFirstBlipInfoId(8)

    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
        for height = 1, 1000 do

            SetPedCoordsKeepVehicle(playerSrc, waypointCoords["x"], waypointCoords["y"], height + 0.0)

            local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

            if foundGround then
                SetPedCoordsKeepVehicle(playerSrc, waypointCoords["x"], waypointCoords["y"], height + 0.0)
            break
        end
            Citizen.Wait(5)
        end
        TriggerEvent('chat:addMessage', {
            color = {0, 255 ,0},
            multiline = true,
            args = {"Işınlandın!"}
        })
    else
        TriggerEvent('chat:addMessage', {
            color = {255, 0 ,0},
            multiline = true,
            args = {"Lütfen waypoint seçiniz!"}
        })
    end
end)

RegisterNetEvent("commands:setHealth")
AddEventHandler("commands:setHealth", function (source, args)
    if args[1] == nil then
        local playerSrc = GetPlayerPed(GetPlayerFromServerId(source))
        SetEntityHealth(playerSrc, 200)
        TriggerEvent('chat:addMessage', {
            color = {0, 0 ,0},
            multiline = true,
            args = {"~s~Canın fullendi!"}
        })
    else
    	local playerSrc = GetPlayerPed(GetPlayerFromServerId(source))
    	local healthNumber = tonumber(args[1])
        SetEntityHealth(playerSrc, healthNumber)
        TriggerEvent('chat:addMessage', {
            color = {0, 0 ,0},
            multiline = true,
            args = {"~s~Can değerin ~r~"..healthNumber.."~s~ yapıldı!"}
        })
    end
end)

RegisterNetEvent("commands:setArmor")
AddEventHandler("commands:setArmor", function (source, args)
    if args[1] == nil then
        local playerSrc = GetPlayerPed(GetPlayerFromServerId(source))
        SetPedArmour(playerSrc, 200)
        TriggerEvent('chat:addMessage', {
            color = {0, 0 ,0},
            multiline = true,
            args = {"~s~Armor fullendi!"}
        })
    else
    	local playerSrc = GetPlayerPed(GetPlayerFromServerId(source))
    	local armorNumber = tonumber(args[1])
        SetPedArmour(playerSrc, armorNumber)
        TriggerEvent('chat:addMessage', {
            color = {0, 0 ,0},
            multiline = true,
            args = {"~s~Armor değerin ~r~"..armorNumber.."~s~ yapıldı!"}
        })
    end
end)

RegisterNetEvent("commands:spawnCar")
AddEventHandler("commands:spawnCar", function (source, args)
    if args[1] == nil then
        TriggerEvent('chat:addMessage', {
            color = {255, 0 ,0},
            multiline = true,
            args = {"Araç ismi eksik girildi!"}
        })
        return
    end

    local playerSrc = GetPlayerPed(GetPlayerFromServerId(source))
    local car = GetHashKey(args[1])

    RequestModel(car)
    while not HasModelLoaded(car) do
        Citizen.Wait(1)
        RequestModel(car)
    end
    local x, y, z = table.unpack(GetEntityCoords(playerSrc))
    CreateVehicle(car, x ,y + 2 ,z + 0.5, GetEntityHeading(playerSrc), true, false)
    local carName = GetDisplayNameFromVehicleModel(car)
    TriggerEvent('chat:addMessage', {
        color = {0, 0 ,0},
        multiline = true,
        args = {"~g~"..carName.."~s~ isimli araç spawnlandı!"}
    })
end)
