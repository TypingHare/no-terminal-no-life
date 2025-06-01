-- Disable the vertical column for markdown files.
require('virt-column').update {
  exclude = {
    filetypes = { 'markdown' },
  },
}
