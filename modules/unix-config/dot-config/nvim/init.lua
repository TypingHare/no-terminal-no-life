-- Local leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable Neovim's built-in file explorer (netrw). This must be set before
-- lazy.vim is loaded.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Use spaces instead of tabs. When set to true, multiple spaces would be typed
-- when users press the tab key.
vim.opt.expandtab = true

-- The number of spaces used to replace a tab (also known as tab width). It is
-- subject to reconfigure based on the style conventions of specific languages.
vim.opt.softtabstop = 2

-- The number of spaces are indented with "<<", ">>", "autoindent", etc.
vim.opt.shiftwidth = 2

-- The number of spaces used to display a real tab character. The IDE will
-- replace tab keys to the specific number of spaces on GUI.
vim.opt.tabstop = 2

-- Apply cursor line highlight. When set to true, the number of line that is
-- being edited will use different highlight group (CursorLineNr).
vim.opt.cursorline = true

vim.opt.fillchars:append { eob = ' ' }

require 'config.lazy'

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

-- Set the diagnostic settings.
vim.diagnostic.config {
  virtual_text = true,
  update_in_insert = true,
}
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn =
  [[%s%=%{v:virtnum == 0 ? (v:relnum ? v:relnum : v:lnum) : ''}   ]]
vim.opt.signcolumn = 'yes'

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function(args)
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(args.buf) then
        return
      end

      local buf = args.buf
      local ft = vim.bo[buf].filetype
      local bt = vim.bo[buf].buftype
      if ft == 'neo-tree' or bt == 'terminal' then
        vim.wo.number = false
        vim.wo.relativenumber = false
        vim.wo.statuscolumn = ''
        vim.wo.signcolumn = 'no'
      end
    end)
  end,
})

vim.cmd.colorscheme 'catppuccin'

vim.keymap.set('n', '<leader>n', ':Neotree<CR>')

vim.keymap.set('n', '<Esc>', '<Esc>:nohlsearch<CR>')
