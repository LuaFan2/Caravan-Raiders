function love.conf(game)
    game.title = "Caravan Raiders"
    game.version = "11.3"
    game.identity = "caravan-raiders"
    
    game.window.width = 480
    game.window.height = 800
    game.window.fullscreen = true
    game.window.icon = "assets/icon.png"
    
    game.modules.joystick = false
end