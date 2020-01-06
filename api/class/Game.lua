local io = require 'api/io/main'
local player = require 'api/class/Player'
local world = require 'api/class/World'

local Game = {}

function Game.create(data)
    if type(data) ~= 'table' then return false end
    if io.exists(data.name) then return false end
    
    io.createFolder(data.name)
    
    local ply = player.create({name = data.name})
    local world = world.create(data.name)
    
    return ply and world
end

return Game