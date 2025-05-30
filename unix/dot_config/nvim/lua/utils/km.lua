local M = {}

---Set a keymap
---@param mode string
---@param opts { key: string, action: string | function, desc: string, silent?: boolean, noremap?: boolean }
M.set = function(mode, opts)
  vim.keymap.set(mode, opts.key, opts.action, {
    desc = opts.desc,
    silent = opts.silent or true,
    noremap = opts.noremap or true,
  })
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
