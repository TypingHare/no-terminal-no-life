return {
  'neovim/nvim-lspconfig',
  config = function()
    -- Require pyright; install it with:
    -- npm install -g pyright
    require('lspconfig').pyright.setup({})
    require('lspconfig').tsserver.setup({})
  end,
}
