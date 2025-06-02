return {
  'rcarriga/nvim-notify',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('notify').setup {
      stages = 'slide',
      timeout = 2000,
    }
    vim.notify = require 'notify'
  end,
}
