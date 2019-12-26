local splashy = require '../libs/splashy'

local splash = {}

function splash:load()
	splashy.addSplash(asset.splash)

	splashy.onComplete(function() viewer:openScene('menu') end)

end

function splash:keypressed(key)
    if key == "escape" then
		splashy.skipAll()
		return
	end
	
	splashy.skipSplash()
end

function splash:draw()
    splashy.draw()
end

function splash:update(dt)
    splashy.update(dt)
end

return splash