return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  enabled = false,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('flash').setup {
      search = {
        enabled = false,
      },
    }
  end,
  keys = {
    {
      'f',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
      noremap = true,
    },
    {
      'F',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
      noremap = true,
    },
  },
}
