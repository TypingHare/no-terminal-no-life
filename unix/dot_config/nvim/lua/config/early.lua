--- This configuration module runs before lazy.nvim is loaded

-- Disable Neovim's built-in file explorer (netrw)
-- Must be disabled before lazy.vim is loaded
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Binds space to leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set tab style
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Indent by 4 spaces
vim.opt.tabstop = 4 -- A tab is displayed as 4 spaces
vim.opt.softtabstop = 4 -- A tab feels like 4 spaces when editing

-- Set cursor style
vim.opt.guicursor = {
  'n-v-c:block-Cursor',
  'i-ci:ver25-CursorInsert',
  'r-cr:hor20',
  'o:hor50',
  'a:blinkwait700-blinkon400-blinkoff250',
}

vim.api.nvim_set_hl(0, 'LineNr', { fg = '#5c6370' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#e06c75', bold = true })

vim.diagnostic.config {
  virtual_text = true,
  update_in_insert = false,
}

require 'utils.km'
