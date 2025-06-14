return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nvim-treesitter.configs').setup {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
