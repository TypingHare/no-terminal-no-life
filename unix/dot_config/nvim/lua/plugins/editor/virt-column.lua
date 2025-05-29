return {
  'lukas-reineke/virt-column.nvim',
  config = function()
    require('virt-column').setup {
      char = '▏',
      virtcolumn = '81',
      priority = 1,
      highlight = 'VirtColumn',
    }

    vim.api.nvim_set_hl(
      0,
      'VirtColumn',
      require('constants.highlight').VERTICAL_BAR
    )

    require('modules.screener').set_file_type {
      group = 'UNEDITABLE_FILETYPES',
      callback = function()
        require('virt-column').setup { char = '' }
      end,
    }
  end,
}
