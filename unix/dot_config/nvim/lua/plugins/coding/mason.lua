return {
  'williamboman/mason.nvim',
  build = ':MasonUpdate',
  config = function()
    require('mason').setup()
  end,
  keys = {
    { '<leader>M', ':Mason<CR>', desc = 'Open Mason', silent = true },
  },
}
