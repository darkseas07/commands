RegisterCommand('tpm', function (source)
    TriggerClientEvent('commands:TeleportToWayPoint', source, source)
end)

RegisterCommand('setHealth', function (source, args)
    TriggerClientEvent('commands:setHealth', source, source, args)
end)

RegisterCommand('setArmor', function (source, args)
    TriggerClientEvent('commands:setArmor', source, source, args)
end)

RegisterCommand('sc', function (source, args)
    TriggerClientEvent('commands:spawnCar', source, source, args)
end)