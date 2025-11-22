require 'config.early'
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
