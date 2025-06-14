return {
  'echasnovski/mini.indentscope',
  opts = {
    symbol = require('constants.ui').VERTICAL_BAR,
    options = { try_as_border = true },
  },
  config = function(_, opts)
    require('mini.indentscope').setup(opts)

    -- Disable in terminal buffers
    vim.api.nvim_create_autocmd('TermOpen', {
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}
