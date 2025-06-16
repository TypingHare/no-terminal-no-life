return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    {
      'kristijanhusak/vim-dadbod-completion',
      ft = { 'sql', 'mysql', 'postgres' },
      lazy = true,
    },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1

    -- Automatically move DBUI window to the right side
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dbui',
      callback = function()
        -- Close DBUI window if already open on the left
        vim.cmd 'wincmd H' -- move to left
        vim.cmd 'wincmd L' -- move to right
      end,
    })
  end,
}
