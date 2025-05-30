-- This happens when Vim resizes
vim.api.nvim_create_autocmd('VimResized', {
  callback = function()
    local new_width = math.max(32, math.floor(vim.o.columns * 0.25))
    print('New width: ' .. new_width)
    local winid =
      require('neo-tree.sources.manager').get_state('filesystem').winid
    if winid then
      vim.api.nvim_win_set_width(winid, new_width)
    end
  end,
})

-- Disable status columns
require('modules.screener').listen {
  group = 'UNEDITABLE_FILETYPES',
  event = 'WinEnter',
  callback = function()
    print 'Cleaning out columns'
    vim.wo.statuscolumn = ''
  end,
}
