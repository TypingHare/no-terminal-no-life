return {
  'folke/noice.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  event = 'VeryLazy',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('noice').setup {
      notify = {
        enabled = true,
      },
      views = {
        history = {
          view = 'popup', -- can also use "split" or other
          enabled = true,
        },
      },
    }
  end,
}
