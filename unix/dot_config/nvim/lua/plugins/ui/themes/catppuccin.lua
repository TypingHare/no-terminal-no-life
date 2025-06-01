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

    -- for _, d in ipairs(require('constants.groups').)
    -- require('modules.screener').set_highlight_group {
    --   group = 'BACKGROUND_HIGHLIGHT_GROUPS',
    --   highlight = { bg = 'None' },
    -- }
  end,
}
