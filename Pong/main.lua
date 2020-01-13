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

PADDLE_SPEED = 200

-- Used to initialize the game
function love.load()
    -- Use nearest neighbor filter
    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont('font.ttf', 8)
    scoreFont = love.graphics.newFont('font.ttf', 32)

    love.graphics.setFont(smallFont)

    -- Initialize game using a virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    player1Score = 0
    player2Score = 0

    player1Y = 30
    player2Y = VIRTUAL_HEIGHT - 50
end

function love.update(dt)
    -- Player 1 movement
    if love.keyboard.isDown('w') then
        player1Y = player1Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('s') then
        player1Y = player1Y + PADDLE_SPEED * dt
    end

    -- Player 2 movement
    if love.keyboard.isDown('up') then
        player2Y = player2Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('down') then
        player2Y = player2Y + PADDLE_SPEED * dt
    end
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

    -- Clear the screen with the color rgb(40, 45, 52)
    love.graphics.clear(40/255, 45/255, 52/255, 1)

    -- DRAW UI

    love.graphics.setFont(smallFont)
    love.graphics.printf('Hello pong!', 0, 20, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 -50, VIRTUAL_HEIGHT / 3)

    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 +30, VIRTUAL_HEIGHT / 3)

    -- DRAW GAME OBJECTS

    -- Draw first paddle (left)
    love.graphics.rectangle('fill', 10, player1Y, 5, 20)

    -- Draw second paddle (right)
    love.graphics.rectangle('fill', VIRTUAL_WIDTH - 10, player2Y, 5, 20)

    -- Draw ball
    love.graphics.rectangle('fill', VIRTUAL_WIDTH / 2 - 2, VIRTUAL_HEIGHT / 2 - 2, 5, 5)

    -- End rendering in virtual resolution
    push:apply('end')
end