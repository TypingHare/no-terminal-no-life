return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 100
  end,
  config = function()
    local which_key = require 'which-key'
    which_key.setup {
      preset = 'helix',
      delay = 0,
      sort = { 'alphanum' },
      icons = {
        rules = false,
      },
    }

    which_key.add {
      { '<leader>f', group = 'Find' },
      { '<leader>m', group = 'Neovim Modules' },
      { '<leader>g', group = 'Git' },
      { '<leader>c', group = 'Coding' },
      { '<leader>t', group = 'Terminal' },
      { '<leader>q', group = 'Quit' },
      { '<leader>cc', group = 'Copilot' },
    }
  end,
}
