-- Local leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.clipboard = {
  name = 'macOS host clipboard',
  copy = {
    ['+'] = 'curl -s -X POST http://host.docker.internal:8377/ -d @-',
    ['*'] = 'curl -s -X POST http://host.docker.internal:8377/ -d @-',
  },
  paste = {
    ['+'] = 'curl -s http://host.docker.internal:8377/',
    ['*'] = 'curl -s http://host.docker.internal:8377/',
  },
  cache_enabled = 0,
}

vim.opt.clipboard = 'unnamedplus'

require 'config.lazy'
require('hare-config').setup()

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

-- Set the diagnostic settings.
vim.diagnostic.config {
  virtual_text = true,
  -- update_in_insert = true,
}

vim.opt.statuscolumn =
  [[%s%=%{v:virtnum == 0 ? (v:relnum ? v:relnum : v:lnum) : ''}   ]]

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

vim.keymap.set('n', '<leader>n', ':Neotree<CR>', { silent = true })

vim.keymap.set(
  'n',
  '<Esc>',
  '<Esc>:nohlsearch<CR>',
  { desc = 'Exit Current Mode', silent = true }
)

vim.keymap.set(
  'n',
  '<Tab>',
  ':BufferLineCycleNext<CR>',
  { desc = 'Next Buffer', silent = true }
)

vim.keymap.set(
  'n',
  '<S+Tab>',
  ':BufferLineCyclePrev<CR>',
  { desc = 'Previous Buffer', silent = true }
)

vim.keymap.set('n', '<leader>bo', function()
  vim.cmd 'wa'
  vim.cmd 'BufferLineCloseOthers'
end, { desc = 'Close Other Buffers' })
