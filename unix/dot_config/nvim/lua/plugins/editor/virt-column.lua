return {
  'lukas-reineke/virt-column.nvim',
  config = function()
    require('virt-column').setup {
      char = '▏',
      virtcolumn = '81',
      priority = 1,
      highlight = 'VirtColumn',
      exclude = {
        filetypes = require('constants.groups').UNEDITABLE_FILETYPES,
      },
    }

    -- Make sure that the vertical column has the same style with the indent
    -- blanklines for visual coordination
    vim.api.nvim_set_hl(
      0,
      'VirtColumn',
      require('constants.highlight').VERTICAL_BAR
    )
  end,
}
