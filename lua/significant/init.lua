local M = {}
local api = vim.api
local loop = vim.loop
local pl = require('pl.import_into')()

local DUMMY_SIGN = 'DummySign'
local DUMMY_SIGN2 = 'DummySign2'
local ANIM_SIGN_PREFIX = 'AnimationSign'
local DUMMY_ID = 'dummy_id'

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

local dots = {"⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"}
local eyes = {"◡◡", "⊙⊙", "◠◠"}
local wedges = {"◴", "◷", "◶", "◵",}
local horizontal_bar = { "▉", "▊", "▋", "▌", "▍", "▎"," ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", }
local diamonds = {"◇", "◈", "◆","◈", "◇"} 
local running_man = { 'ﰌ',  '省'          }
local semi_circles =  {"◜ ", " ◝", " ◞", "◟ "}
local equals = {"≔", "≒", "≓", "≕","≓", "≒", "≔" }
local circles = {"⊶", "⊷"}
local smilers = {"☺", "☻"}
local vert_drop = {"䷀", "䷪",  "䷍", "䷈", "䷉", "䷌", "䷫"}
--Unicode graveyard:
--  ⎆ ⎈ ⎔ ⏣ ☢ ☠ ⚛ ⚖ ⬣

M.ANIMATION_SIGNS = make_progress_bar(vert_drop)

local function define_dummy_sign()
  if vim.tbl_isempty(vim.fn.sign_getdefined(DUMMY_SIGN)) then
    vim.fn.sign_define(DUMMY_SIGN, { text = 'ﰌ', l} )
  end
  if vim.tbl_isempty(vim.fn.sign_getdefined(DUMMY_SIGN2)) then
    vim.fn.sign_define(DUMMY_SIGN2, { text = '省',} )
  end
end

define_dummy_sign()

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

--place_dummy_sign(DUMMY_SIGN2)

local function start_timer()
  local timer = loop.new_timer()
  local count = 0
  local function on_interval()
    count = count + 1
    if count > 100000 or M.should_stop then
      timer:close()
    end
    local sign_name = M.ANIMATION_SIGNS[(count % #M.ANIMATION_SIGNS)+1]
    print(sign_name)
    place_dummy_sign(sign_name)
  end
  local launch_delay = 500 -- ms
  local repeat_delay = 350 -- ms
  timer:start(launch_delay, repeat_delay, vim.schedule_wrap(on_interval))
end

start_timer()

return M
