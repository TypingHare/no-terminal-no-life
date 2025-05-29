return {
  'echasnovski/mini.indentscope',
  opts = {
    symbol = '▏',
    options = { try_as_border = true },
  },
  init = function()
    require('modules.screener').set_file_type {
      group = 'UNEDITABLE_FILETYPES',
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    }

    -- Change the color of the vertical line
    vim.api.nvim_set_hl(
      0,
      'MiniIndentscopeSymbol',
      require('constants.highlight').ACTIVATE_VERTICAL_BARE
    )
  end,
}
