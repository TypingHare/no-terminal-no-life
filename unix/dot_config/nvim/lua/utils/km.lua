local M = {}

---Set a normal keymap
---@param opts { key: string, action: string | function, desc: string, silent: boolean }
M.n = function(opts)
  local key = opts.key
  local action = opts.action
  local desc = opts.desc
  local silent = opts.silent or true

  vim.keymap.set('n', key, action, { desc = desc, silent = silent })
end

_G.km = M

return M
