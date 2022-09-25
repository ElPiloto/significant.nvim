local M = {}
M.defaulttable = {}

--TODO(ElPiloto): Figure out why we don't have access to vim.defaulttable.
function M.defaulttable(create)
  create = create or M.defaulttable
  return setmetatable({}, {
    __index = function(tbl, key)
      rawset(tbl, key, create())
      return rawget(tbl, key)
    end,
  })
end

return M
