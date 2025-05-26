vim.opt.wrap = true

vim.cmd([[
  highlight LineNr guifg=#888888
  highlight CursorLineNr guifg=#95d5b2 gui=bold
]])

-- Disable the default color column
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    vim.opt_local.colorcolumn = {}
  end,
})

-- Change the color of the vertical column
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function()
    vim.api.nvim_set_hl(0, 'VirtColumn', { fg = '#FF0000', bg = 'NONE' })
  end,
})
