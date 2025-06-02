return {
  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    dependencies = {
      'saghen/blink.cmp',
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_browser = ''
    end,
  },
}
