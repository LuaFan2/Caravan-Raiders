local io = require 'api/io/main'
local serial = require 'api/tools/serializer'

require 'assets'

local World = {}

function World.generate()
    local world = {textures = asset.textures, props = {}, data = {}, general = {}}
    
    world.general["lighting"] = "255|255|255"
    
    world["data"] = {
        {{"water"},{"water"},{"water"},{"water"},{"water"},{"water"},{"water"},{"water"},{"water"},{"water"}},
        {{"grass"},{"grass"},{"grass"},{"grass"},{"grass"},{"grass"},{"grass"},{"grass"},{"grass"},{"grass"}},
        {{"water"},{"water"},{"water"},{"water"},{"water"},{"water"},{"water"},{"water"},{"water"},{"water"}}
    }
    
    return world
end

function World.create(folder)
    if type(folder) ~= 'string' then return false end
    
    local world = World.generate()
    io.createFile(folder .. '/' .. 'world.data')
    
    return love.filesystem.write(folder .. '/' .. 'world.data', serial.serialize(world))
end

return World