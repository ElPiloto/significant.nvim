local M = {}
local loop = vim.loop
local sprites = require('significant.sprites')
local utils = require('significant.utils')

M.started_timer = false
M.should_stop = false
M._loaded_signs = {}
--TODO(ElPiloto): Probably make this so that it doesn't return a
--defaulttable.
M._timers_by_bufnr = utils.defaulttable()
M._should_stop_timers_by_bufnr = utils.defaulttable()
M._animation_signs = utils.defaulttable()

local ANIM_SIGN_PREFIX = 'AnimationSign'

local text_hls = {
  'markdownH3',
  'markdownH4',
  'markdownH5',
  'markdownH6',
  'markdownH1',
  'markdownH2',
}

local function make_loading_signs(animation_name)
  local frames = sprites[animation_name]
  if M._loaded_signs[animation_name] then
    return M._loaded_signs[animation_name]
  end
  local sign_names = {}
  local i = 0
  for _, frame in ipairs(frames) do
    i = i + 1
    local sign_name = ANIM_SIGN_PREFIX .. '_' .. animation_name .. '_' .. tostring(i)
    --Remove unnecessary calls to vim functions if we can.
    if not M._loaded_signs[animation_name] then
      if vim.tbl_isempty(vim.fn.sign_getdefined(sign_name)) then
        vim.fn.sign_define(sign_name, { text = frame, texthl = text_hls[(i % #text_hls) + 1]})
      end
    end
    table.insert(sign_names, sign_name)
  end
  M._loaded_signs[animation_name] = sign_names
  return sign_names
end

function M._start_timer(animation_name, repeat_delay, sign_place_fn, bufnr, sign_id)
  if not vim.tbl_isempty(M._timers_by_bufnr[bufnr][sign_id]) then
    print('Aborting. TODO: Add option to force override timer.')
    --TODO(ElPiloto): Add log message saying we're not turning timer on b/c already on.
    return false
  end
  if not repeat_delay then
    repeat_delay = 50
  end
  if animation_name then
    M._animation_signs[bufnr][sign_id] = make_loading_signs(animation_name)
  end
  local timer = loop.new_timer()
  local frames = M._animation_signs[bufnr][sign_id]
  local count = 0

  local function on_interval()
    count = count + 1

    local should_stop = M._should_stop_timers_by_bufnr[bufnr][sign_id]['should_stop']
    local stop_options = M._should_stop_timers_by_bufnr[bufnr][sign_id]['stop_options']
    if count > 10000 or should_stop then
      timer:close()

      local finish_fn = nil
      if stop_options and stop_options['unplace_sign'] then
          finish_fn = function()
            local sign_group = stop_options['sign_group'] or ''
            vim.fn.sign_unplace(sign_group, {buffer=bufnr, id=sign_id})
          end

      elseif stop_options and stop_options['sign_name'] then
          finish_fn = function()
            sign_place_fn(stop_options['sign_name'], true)
          end

      else
        --Go back to first sign.
        local sign_name = frames[1]
        finish_fn = function()
          sign_place_fn(sign_name, true)
        end
      end
      vim.defer_fn(finish_fn, 100)
      M._should_stop_timers_by_bufnr[bufnr][sign_id]['should_stop'] = false
      M._timers_by_bufnr[bufnr][sign_id] = nil
    end
    local sign_name = frames[(count % #frames)+1]
    --Specify line number on first invocation only, for the subsequent
    --invocations we want to update the sign regardless of the line.
    local update_existing_sign = count ~= 1
    sign_place_fn(sign_name, update_existing_sign)
  end

  local launch_delay_ms = 500
  table.insert(M._timers_by_bufnr[bufnr][sign_id], true)
  M._should_stop_timers_by_bufnr[bufnr][sign_id]['should_stop'] = false
  timer:start(launch_delay_ms, repeat_delay, vim.schedule_wrap(on_interval))
end

function M.animate_existing_sign(sign_id, sign_group, animation_name, delay_ms)
  local bufnr = vim.api.nvim_get_current_buf()
  local function sign_placer(sign_name)
      vim.fn.sign_place(
        sign_id,
        sign_group,
        sign_name,
        bufnr
      )
  end
  M._start_timer(animation_name, delay_ms, sign_placer, bufnr, sign_id)
end

function M.start_animated_sign(lnum, animation_name, delay_ms)
  local bufnr = vim.api.nvim_get_current_buf()
  local sign_id = lnum
  local function sign_placer(sign_name, update_existing_sign)
    if not update_existing_sign then
      vim.fn.sign_place(
        sign_id,
        '',  -- use default sign group so we can share animation instances.
        sign_name,
        bufnr,
        {lnum=lnum, priority=100}
      )
    else
      vim.fn.sign_place(
        sign_id,
        '',
        sign_name,
        bufnr
      )
    end
  end
  M._start_timer(animation_name, delay_ms, sign_placer, bufnr, sign_id)
end

function M.stop_animated_sign(lnum, stop_options, bufnr)
  if not lnum and #M._timers_by_bufnr == 1 then
    print('Could maybe infer which buffer to stop, but not implemented yet.')
    return
  end
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  M._should_stop_timers_by_bufnr[bufnr][lnum] = {
    should_stop = true,
    stop_options = stop_options,
  }
  --M._should_stop_timers_by_bufnr[bufnr][lnum] = true
end

return M
