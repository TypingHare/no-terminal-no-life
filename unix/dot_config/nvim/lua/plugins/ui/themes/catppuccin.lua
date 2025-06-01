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

    -- Change the background highlight group to a uniform color.
    -- Note: this must be set up here
    local background_highlight_group = require('constants.ui').HL_BACKGROUND
    for _, group in
      ipairs(require('constants.groups').BACKGROUND_HIGHLIGHT_GROUPS)
    do
      vim.api.nvim_set_hl(0, group, background_highlight_group)
    end
  end,
}
