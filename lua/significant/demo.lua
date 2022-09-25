local significant = require('significant')
local sprites = require('significant.sprites')
local lnum = 10
for animation_name, _ in pairs(sprites) do
  vim.api.nvim_buf_set_lines(0, lnum-1, lnum, false, {animation_name})
  significant.start_animated_sign(lnum, animation_name, 100) 
  lnum = lnum + 1
end

