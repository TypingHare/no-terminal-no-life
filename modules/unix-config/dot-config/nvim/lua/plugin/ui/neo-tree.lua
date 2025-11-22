return {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  event = 'VeryLazy',
  init = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      callback = function(data)
        if vim.fn.isdirectory(data.file) == 1 then
          vim.cmd.cd(data.file)
          vim.cmd.enew()
          require('neo-tree.command').execute {
            source = 'filesystem',
            dir = data.file,
            position = 'left',
            toggle = false,
            reveal = false,
          }
        end
      end,
    })
  end,
  opts = {
    sources = {
      'filesystem',
      'buffers',
      'git_status',
      'document_symbols',
    },
    filesystem = {
      group_empty_dirs = true,
      filtered_items = {
        hide_dotfiles = true,
        hide_gitignored = true,
        always_show = { '.gitignore', '.gitkeep' },
        never_show = { '__pycache__' },
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
      ---@type table<string, boolean | string | any>
      mappings = {
        ['#'] = false,
        ['f'] = false,
        ['<space>'] = false,
        ['.'] = false,
        ['<'] = false,
        ['<C-b>'] = false,
        ['<C-f>'] = false,
        ['<C-x>'] = false,
        ['<bs>'] = false,
        ['<cr>'] = false,
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
        ['O'] = {
          function(state)
            local path = state.tree:get_node():get_id()
            vim.fn.jobstart { 'open', path }
          end,
          desc = 'Open with the operating system',
        },
      },
    },
  },
}
