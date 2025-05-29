return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha',
      transparent_background = true,
      integrations = { bufferline = true },
    }

    require('modules.screener').set_highlight_group {
      highlight = { fg = '#ff0000', bg = 'None' },
    }
  end,
}
