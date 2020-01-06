isomap = require ("libs/isomap")

local game = {}

function game:load()
	--Variables
	x = 0
	y = 0
	zoomL = 1
	zoom = 1

	love.graphics.setBackgroundColor(0, 0, 69)
	love.graphics.setDefaultFilter("linear", "linear", 8)

	isomap.generatePlayField()
end

function game:update(dt)
	if love.keyboard.isDown("left") then x = x + 900*dt end
	if love.keyboard.isDown("right") then x = x - 900*dt end
	if love.keyboard.isDown("up") then y = y+900*dt end
	if love.keyboard.isDown("down") then y = y-900*dt end
	zoomL = lerp(zoomL, zoom, 0.05*(dt*300))
end

function game:draw()
	isomap.drawGround(x, y, zoomL)
	isomap.drawObjects(x, y, zoomL)
	info = love.graphics.getStats()
	love.graphics.print("FPS: "..love.timer.getFPS())
	love.graphics.print("Draw calls: "..info.drawcalls, 0, 12)
	love.graphics.print("Texture memory: "..((info.texturememory/1024)/1024).."mb", 0, 24)
	love.graphics.print("Zoom level: "..zoom, 0, 36)
	love.graphics.print("X: "..math.floor(x).." Y: "..math.floor(y), 0, 48)
end

function game:wheelmoved(x, y)
    if y > 0 then
      zoom = zoom + 0.1
    elseif y < 0 then
      zoom = zoom - 0.1
    end

	if zoom < 0.1 then zoom = 0.1 end
end

function lerp(a, b, rate) --EMPLOYEE OF THE MONTH
	local result = (1-rate)*a + rate*b
	return result
end

return game