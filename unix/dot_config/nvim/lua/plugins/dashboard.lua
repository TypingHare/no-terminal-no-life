return {
  {
    'nvimdev/dashboard-nvim',
    config = function(_, opts)
      opts.config.header = { '' }
      opts.config.vertical_center = true
      opts.config.center = {
        {
          action = 'lua LazyVim.pick()()',
          desc = ' Find File',
          icon = ' ',
          key = 'f',
        },
        {
          action = 'lua LazyVim.pick("oldfiles")()',
          desc = ' Recent Files',
          icon = ' ',
          key = 'r',
        },
        {
          action = 'lua LazyVim.pick.config_files()()',
          desc = ' Config',
          icon = ' ',
          key = 'c',
        },
        {
          action = 'Lazy',
          desc = ' Lazy',
          icon = '󰒲 ',
          key = 'l',
        },
        {
          action = 'LazyExtras',
          desc = ' Lazy Extras',
          icon = ' ',
          key = 'x',
        },
        {
          action = function()
            vim.api.nvim_input('<cmd>qa<cr>')
          end,
          desc = ' Quit',
          icon = ' ',
          key = 'q',
        },
      }

      require('dashboard').setup(opts)
    end,
  },
}
