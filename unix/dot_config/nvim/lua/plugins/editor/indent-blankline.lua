return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
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
