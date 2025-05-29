local doorman = require 'modules.doorman'

-- When entering Neovim in the directory mode, open Neo-tree automatically and
-- clear the directory buffer
doorman.bind(doorman.mode.DIRECTORY, function(dir)
  require('neo-tree.command').execute {
    toggle = true,
    dir = vim.uv.cwd(),
  }

  -- Close the buffer opened for the directory
  vim.schedule(function()
    local bufnr = vim.fn.bufnr(dir)
    if bufnr ~= -1 then
      vim.api.nvim_buf_delete(bufnr, { force = true })
    end
    vim.cmd 'Neotree show'
  end)
end)
