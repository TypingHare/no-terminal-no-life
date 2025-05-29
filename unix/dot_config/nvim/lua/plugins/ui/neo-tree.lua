return {
  'nvim-neo-tree/neo-tree.nvim',
  lazy = false,
  config = function()
    require('neo-tree').setup {
      filesystem = {
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
        },
      },
      window = {
        width = math.max(32, math.floor(vim.o.columns * 0.2)),
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
          ['h'] = {
            'close_node',
            desc = 'Close directory',
          },
          ['l'] = {
            'open',
            desc = 'Open directory',
          },
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
  keys = {
    {
      '<leader>e',
      function()
        vim.cmd 'Neotree focus'
      end,
      desc = 'Focus Neo-tree',
    },
  },
}
