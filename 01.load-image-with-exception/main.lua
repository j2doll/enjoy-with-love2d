-- main.lua

local ham = nil

function i_might_throw_exception()
	if something_is_wrong then
		error("Something is wrong")
	end
	ham = love.graphics.newImage("hamster.png") 
	return something
end
-- code from http://ruoyusun.com/2013/03/30/pragmatic-lua-error-handling-oop-closure-and-coroutines.html

function love.load()
    
    -- try to load image 
    local success, result = pcall(i_might_throw_exception)
    if not success then
        print(result) -- print out error message
    end    

    x = 50
    y = 50
end
  
function love.draw()
    if ham ~= nil then 
        love.graphics.draw(ham, x, y)
    end 
end
