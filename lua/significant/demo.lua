local significant = require('significant')
local sprites = require('significant.sprites')

local line = 1
for animation_name, _ in pairs(sprites) do
  significant.start_animated_sign(line, animation_name, 100) 
  line = line + 1
end

--[[
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--]]

