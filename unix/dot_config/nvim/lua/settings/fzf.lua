-- Use fzf and ripgrep for fuzzy search
require('fzf-lua').setup({
  files = { cmd = 'rg --files' },
})
