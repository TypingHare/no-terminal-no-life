require 'config.early'
require 'config.lazy'
require 'config.late'

-- Set the diagnostic settings.
vim.diagnostic.config {
  virtual_text = true,
  update_in_insert = true,
}
