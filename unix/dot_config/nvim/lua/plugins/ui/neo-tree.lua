return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  init = function()
    -- Changes the width of Neo-tree when resizing
    vim.api.nvim_create_autocmd('VimResized', {
      callback = function()
        ui.resize_neo_tree(ui.get_neo_tree_width())
      end,
    })
  end,
  config = function()
    require('neo-tree').setup {
      handlers = {
        {
          event = 'neo_tree_buffer_enter',
          handler = function()
            vim.opt_local.statuscolumn = ''
            vim.opt_local.signcolumn = 'no'
          end,
        },
      },
      filesystem = {
        group_empty_dirs = true,
        always_show = {
          '.gitignored',
          '.gitkeep',
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added = 'A',
            deleted = 'D',
            modified = 'M',
            renamed = 'R',
            untracked = '?',
            ignored = 'I',
            unstaged = 'U',
            staged = 'S',
            conflict = 'C',
          },
          indent = {
            indent_marker = require('constants.ui').VERTICAL_BAR,
          },
        },
      },
      window = {
        width = require('utils.ui').get_neo_tree_width(),
        ---@type table<string, boolean | string | any>
        mappings = {
          ['#'] = false,
          ['<space>'] = false,
          ['.'] = false,
          ['<'] = false,
          ['<2-LeftMouse>'] = false,
          ['<C-b>'] = false,
          ['<C-f>'] = false,
          ['<C-x>'] = false,
          ['<bs>'] = false,
          ['<cr>'] = false,
          ['<esc>'] = false,
          ['>'] = false,
          ['[g'] = false,
          [']g'] = false,
          ['C'] = false,
          ['D'] = false,
          ['S'] = false,
          ['s'] = false,
          ['t'] = false,
          ['w'] = false,
          ['h'] = { 'close_node', desc = 'Close directory' },
          ['l'] = { 'open', desc = 'Open File/Directory' },
          ['e'] = {
            function()
              vim.cmd 'wincmd l'
            end,
            desc = 'Focus Editor',
          },
          ['y'] = {
            function(state)
              local path = state.tree:get_node():get_id()
              local relative_path = vim.fn.fnamemodify(path, ':.')
              vim.fn.setreg('+', relative_path)
              vim.print('Copied relative path: ' .. relative_path)
            end,
            desc = 'Copy Relative Path',
          },
        },
      },
    }
  end,
}
