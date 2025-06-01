-- This is the entry file of Neovim. For aesthetics, this file only imports
-- configuration modules in order.

require 'config.neovide'
require 'config.early'
require 'config.lazy'
require 'config.late'
require 'config.enter'
require 'config.lsp'

-- vim.api.nvim_set_hl(0, 'NoiceCmdlinePopup', { bg = 'NONE', blend = 30 })
-- vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { bg = 'NONE', blend = 30 })
