WINDOW_WIDTH = 1360
WINDOW_HEIGHT = 720

-- Used to initialize the game
function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

-- Called each frame after update
function love.draw()
    love.graphics.printf(
        'Hello pong',          
        0,                        
        WINDOW_HEIGHT / 2 - 6,
        WINDOW_WIDTH,
        'center'
    )
end