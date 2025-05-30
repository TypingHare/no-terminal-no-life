return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    { 'nvim-telescope/telescope-file-browser.nvim' },
  },
  config = function()
    require('telescope').setup {
      defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
          preview_width = 0.6,
        },
        sorting_strategy = 'descending',
        scroll_strategy = 'cycle',
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
        },
      },
    }

    -- Load extensions
    require('telescope').load_extension 'fzf'
    require('telescope').load_extension 'file_browser'
  end,
}
