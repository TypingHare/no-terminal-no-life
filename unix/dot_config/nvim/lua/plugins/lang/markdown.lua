return {
  {
    'OXY2DEV/markview.nvim',
    dependencies = {
      'saghen/blink.cmp',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('markview').setup {
        experimental = {
          check_rtp = false,
        },
      }
    end,
  },
}
