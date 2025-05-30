return {
  'echasnovski/mini.indentscope',
  opts = {
    symbol = require('constants.ui').VERTICAL_BAR,
    options = { try_as_border = true },
  },
  init = function()
    require('modules.screener').listen {
      group = 'ALL',
      event = 'WinEnter',
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    }
  end,
}
