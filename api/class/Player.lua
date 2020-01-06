local io = require 'api/io/main'
local serializer = require 'api/tools/serializer'

local Player = {}

function Player.create(data)
    if type(data) ~= 'table' then return false end
    
    io.createFile(data.name .. '/' .. 'player.data')
    
    return love.filesystem.write(data.name .. '/' .. 'player.data', serializer.serialize(data))
end

return Player