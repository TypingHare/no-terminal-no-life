return {
  'lukas-reineke/virt-column.nvim',
  config = function()
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'dashboard', 'alpha' },
      callback = function()
        require('virt-column').setup({ char = '' })
      end,
    })

    require('virt-column').setup({
      char = '│',
      virtcolumn = '81',
    })
  end,
}
