return {
  'tyru/open-browser.vim',
  keys = {
    {
      '<leader>eb',
      '<Plug>(openbrowser-open)',
      mode = 'n',
      desc = 'Open URL under cursor',
    },
    {
      '<leader>eb',
      '<Plug>(openbrowser-open)',
      mode = 'v',
      desc = 'Open Selected URL',
    },
  },
  lazy = false,
}
