return {
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'pyright', 'typos_lsp' }, -- Add desired servers
      })

      local lspconfig = require('lspconfig')
      local servers = { 'lua_ls', 'pyright', 'typos_lsp' }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({})
      end
    end,
  },
}
