return {
  'machakann/vim-highlightedyank',
  event = 'TextYankPost',
  config = function()
    vim.g.highlightedyank_highlight_duration = 128
  end,
}
