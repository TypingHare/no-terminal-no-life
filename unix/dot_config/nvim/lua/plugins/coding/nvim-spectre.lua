return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>sr',
      function()
        require('spectre').toggle()
      end,
      desc = 'Toggle Spectre (Search & Replace)',
    },
    {
      '<leader>sw',
      function()
        require('spectre').open_visual { select_word = true }
      end,
      desc = 'Spectre - Replace word under cursor',
    },
    {
      '<leader>sf',
      function()
        require('spectre').open_file_search()
      end,
      desc = 'Spectre - Search in current file',
    },
  },
  config = function()
    require('spectre').setup()
  end,
}
