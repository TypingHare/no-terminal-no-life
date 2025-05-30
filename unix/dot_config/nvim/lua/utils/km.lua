local M = {}

---Set a keymap
---@param mode string
---@param opts { key: string, action: string | function, desc: string, silent: boolean }
M.set = function(mode, opts)
  local key = opts.key
  local action = opts.action
  local desc = opts.desc
  local silent = opts.silent or true

  vim.keymap.set(mode, key, action, { desc = desc, silent = silent })
end

---Set a normal mode keymap
---@param opts { key: string, action: string | function, desc: string, silent: boolean }
M.n = function(opts)
  M.set('n', opts)
end

---Set a virtual mode keymap
---@param opts { key: string, action: string | function, desc: string, silent: boolean }
M.v = function(opts)
  M.set('n', opts)
end

---Set an insert mode keymap
---@param opts { key: string, action: string | function, desc: string, silent: boolean }
M.i = function(opts)
  M.set('i', opts)
end

---Set a terminal mode keymap
---@param opts { key: string, action: string | function, desc: string, silent: boolean }
M.t = function(opts)
  M.set('t', opts)
end

_G.km = M

return M
