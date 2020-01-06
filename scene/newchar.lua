local gui = require '../libs/gspot'
local game = require 'api/class/Game'

local menu = {}

function menu:load()
    local y, w = love.graphics.getHeight() / 4, love.graphics.getWidth()
    
    gui:button('Character creation', {x = 0, y = 0, w = w, h = 40})
    
    name = gui:input('name', {0, y - 100, w, 40})
    name.value = "Character name"
    name.keyrepeat = true -- this is the default anyway
    
    local cButton = gui:button('Create character', {x = 0, y = love.graphics.getHeight() - 40, w = w, h = 40})
    
    cButton.click = function() game.create({name = name.value}) gui:clear() viewer:openScene('game') end
end

function menu:draw()
	gui:draw()
end

function menu:update(dt)
	gui:update(dt)
end

function menu:keypressed(key)
	if gui.focus then
		gui:keypress(key)
	end
end

function menu:textinput(key)
	if gui.focus then
		gui:textinput(key)
	end
end

function menu:mousepressed(x, y, button)
	gui:mousepress(x, y, button)
end

function menu:mousereleased(x, y, button)
	gui:mouserelease(x, y, button)
end

return menu