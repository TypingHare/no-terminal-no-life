-- This is the entry file of Neovim. For aesthetics, this file only imports
-- configuration modules in order.

require 'config.early'
require 'config.lazy'
require 'config.bufferline'
require 'config.lsp'

vim.opt.guicursor = {
  'n-v-c:block-Cursor',
  'i-ci:ver25-CursorInsert',
  'r-cr:hor20',
  'o:hor50',
  'a:blinkwait700-blinkon400-blinkoff250',
}
