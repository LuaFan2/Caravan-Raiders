require 'assets'

require 'libs.viewer'

----------------------------------------
--            LOVE
----------------------------------------

function love.load(arg)
    asset.splash = love.graphics.newImage(asset.splash)
    
    viewer:addScene({'splash', 'menu', 'newchar', 'game'})
end

function love.update(dt)
  viewer:update(dt)
end

function love.draw()
  viewer:draw()
end

function love.keypressed(key, s, r)
    viewer:keypressed(key)
end

function love.textinput(key)
    viewer:textinput(key)
end

function love.mousepressed(x, y, button)
	viewer:mousepressed(x, y, button) -- pretty sure you want to register mouse events
end

function love.mousereleased(x, y, button)
	viewer:mousereleased(x, y, button)
end

function love.wheelmoved(x, y)
	viewer:wheelmoved(x, y)
end