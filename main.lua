require 'assets'

require 'libs.viewer'

----------------------------------------
--            LOVE
----------------------------------------

function love.load(arg)
    asset.splash = love.graphics.newImage(asset.splash)
    
    viewer:addScene('splash')
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