local M = {}
local api = vim.api
local loop = vim.loop
local pl = require('pl.import_into')()
local loaders = require('significant.loaders')

local ANIM_SIGN_PREFIX = 'AnimationSign'
local DUMMY_ID = 'dummy_id'

M.started_timer = false
M.should_stop = false

local function make_progress_bar(frames)
  local sign_names = {}
  local i = 0
  for _, frame in ipairs(frames) do
    i = i + 1
    local sign_name = ANIM_SIGN_PREFIX .. '_' .. tostring(i)
    if vim.tbl_isempty(vim.fn.sign_getdefined(sign_name)) then
      vim.fn.sign_define(sign_name, { text = frame })
    end
    table.insert(sign_names, sign_name)
  end
  return sign_names
end

M.ANIMATION_SIGNS = make_progress_bar(loaders.vert_drop)

local function place_dummy_sign(sign_name)
  print('Doing dummy stuff on: ' .. sign_name)
  vim.fn.sign_place(
    DUMMY_ID,
    '',  -- sign_group
    sign_name,
    1,
    {lnum=3, priority=100}
  )
end

function M.start_timer()
  local timer = loop.new_timer()
  local count = 0
  local function on_interval()
    count = count + 1
    if count > 1000 or M.should_stop then
      timer:close()
      M.started_timer = false
    end
    local sign_name = M.ANIMATION_SIGNS[(count % #M.ANIMATION_SIGNS)+1]
    print(sign_name)
    place_dummy_sign(sign_name)
  end
  local launch_delay = 500 -- ms
  local repeat_delay = 350 -- ms
  timer:start(launch_delay, repeat_delay, vim.schedule_wrap(on_interval))
end

if not M.started_timer then
  M.started_timer = true
  M.start_timer()
end

return M
