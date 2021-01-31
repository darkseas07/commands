fx_version 'cerulean'

games { 'rdr3', 'gta5' }

author 'Darkseas'
description 'Commands Script'
version '1.0.0'

client_scripts{
    'client/main.lua'
} 

server_scripts{
    'server/main.lua'
} 

exports {
    'commands:TeleportToWayPoint',
    'commands:setHealth',
    'commands:spawnCar'
}

client_exports{
    'commands:TeleportToWayPoint',
    'commands:setHealth',
    'commands:spawnCar'
}