local gui = require '../libs/gspot'

local menu = {}

function menu:load()
    local y, w = love.graphics.getHeight() / 2, love.graphics.getWidth()
    
    -- TODO: Add "active" button param
    gui:button('Caravan Raiders', {x = 0, y = 0, w = w, h = 40})
    
    local newGame = gui:button('New game', {x = 0, y = y - 100, w = w, h = 40})
    local settings = gui:button('Settings', {x = 0, y = y, w = w, h = 40})
    local quit = gui:button('Exit game', {x = 0, y = y + 100, w = w, h = 40})
    
    newGame.click = function() gui:clear() viewer:openScene('newchar') end
    quit.click = function() love.event.quit() end
end

function menu:draw()
	gui:draw()
end

function menu:update(dt)
	gui:update(dt)
end

function menu:mousepressed(x, y, button)
	gui:mousepress(x, y, button)
end

function menu:mousereleased(x, y, button)
	gui:mouserelease(x, y, button)
end

return menu