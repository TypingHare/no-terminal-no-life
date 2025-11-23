require 'config.early'
require 'config.lazy'
require 'config.late'

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
