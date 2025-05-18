-- Require typescript-language-server
-- npm install -g typescript typescript-language-server
return {
  -- Treesitter: ensures JS/TS support
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        'javascript',
        'typescript',
        'tsx',
      },
    },
  },

  -- LSP Config for tsserver
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tsserver = {},
      },
    },
  },
}
