return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  config = function()
    local ui = require 'constants.ui'
    require('ibl').setup {
      indent = {
        char = ui.VERTICAL_BAR,
        tab_char = ui.VERTICAL_BAR,
      },
      scope = { enabled = false },
      exclude = {
        filetypes = require('constants.groups').UNEDITABLE_FILETYPES,
        buftypes = { 'terminal', 'nofile' },
      },
    }
  end,
}
