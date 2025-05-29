return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  init = function()
    require('modules.screener').set_file_type {
      group = 'UNEDITABLE_FILETYPES',
      callback = function()
        vim.b.indent_blankline_enabled = false
      end,
    }
  end,
  config = function()
    require('ibl').setup {
      indent = {
        char = '▏',
        tab_char = '▏',
      },
      scope = { enabled = false },
      exclude = {
        filetypes = require('modules.screener').get_elements_by_group 'UNEDITABLE_FILETYPES',
        buftypes = { 'terminal', 'nofile' },
      },
    }
  end,
}
