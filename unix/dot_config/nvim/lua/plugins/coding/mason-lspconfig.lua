return {
  'williamboman/mason-lspconfig.nvim',
  config = function()
    require('mason-lspconfig').setup {
      automatic_enable = false,
    }
  end,
}
