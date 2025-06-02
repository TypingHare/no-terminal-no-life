-- This is the entry file of Neovim. For aesthetics, this file only imports
-- configuration modules in order.

require 'config.neovide'
require 'config.early'
require 'config.lazy'
require 'config.late'
require 'config.enter'

---@diagnostic disable-next-line: missing-fields
-- require('nvim-treesitter.configs').setup {
--   ensure_installed = { 'kotlin' },
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting = false,
--   },
-- }

vim.lsp.buf.format {
  filter = function(client)
    return client.name == 'null-ls'
  end,
  bufnr = vim.api.nvim_get_current_buf(),
}
