return {
  'rcarriga/nvim-notify',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('notify').setup {
      stages = 'slide',
      timeout = 3000,
    }
  end,
}
