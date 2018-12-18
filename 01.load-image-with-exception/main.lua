-- main.lua

local ham = nil
local x_pos = 0
local y_pos = 0

function i_might_throw_exception()
	if something_is_wrong then
		error("Something is wrong")
	end
	ham = love.graphics.newImage("hamster.png") 
	return something
end
-- main code from http://ruoyusun.com/2013/03/30/pragmatic-lua-error-handling-oop-closure-and-coroutines.html

function love.load()
    
    -- try to load image 
    local success, result = pcall(i_might_throw_exception)
    if not success then
        print(result) -- print out error message
        return
    end    

    x_pos = 50
    y_pos = 50
end
  
function love.draw()
    if ham ~= nil then 
        love.graphics.draw(ham, x_pos, y_pos)
    else
        love.graphics.setColor(1, 0, 0)
        love.graphics.rectangle("fill", x_pos, y_pos, 100, 100) -- x_pos and y_pos is zero.   
    end
end
