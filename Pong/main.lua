-- push is a library that will allow us to draw our game at a virtual
-- resolution, instead of however large our window is; used to provide
-- a more retro aesthetic
--
-- https://github.com/Ulydev/push
push = require 'push'

WINDOW_WIDTH = 1360
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 456
VIRTUAL_HEIGHT = 243

-- Used to initialize the game
function love.load()
    -- Use nearest neighbor filter
    love.graphics.setDefaultFilter('nearest', 'nearest')
    -- Initialize game using a virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()    
    end
end

-- Called each frame after update
function love.draw()
    -- Start rendering in virtual resolution
    push:apply('start')

    love.graphics.printf('Hello pong', 0, VIRTUAL_HEIGHT / 2 - 6, VIRTUAL_WIDTH, 'center')
    
    -- End rendering in virtual resolution
    push:apply('end')
end