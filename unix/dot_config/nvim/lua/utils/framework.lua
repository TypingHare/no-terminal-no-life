local M = {}

--- Import all lua modules in a specifc directory.
---
--- @param dir string
M.import_all_modules = function(dir)
  local config_path = vim.fn.stdpath 'config'
  local scan_dir = config_path .. '/lua/' .. dir

  for _, file in ipairs(vim.fn.readdir(scan_dir)) do
    if file:match '%.lua$' and not file:match '^init%.lua$' then
      local module = dir:gsub('/', '.') .. '.' .. file:gsub('%.lua$', '')
      require(module)
    end
  end
end

--- Gets the path to lazy.nvim.
---
--- This function would clone lazy.nvim if it doesn't exist.
---
--- @return string
M.get_lazy_path = function()
  local lazy_path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
  if not vim.uv.fs_stat(lazy_path) then
    local lazy_repository = 'https://github.com/folke/lazy.nvim.git'
    local stdout = vim.fn.system {
      'git',
      'clone',
      '--filter=blob:none',
      '--branch=stable',
      lazy_repository,
      lazy_path,
    }
    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
        { stdout, 'WarningMsg' },
        { '\nPress any key to exit...' },
      }, true, {})
      vim.fn.getchar()
      os.exit(1)
    end
  end

  return lazy_path
end

_G.framework = M

return M
