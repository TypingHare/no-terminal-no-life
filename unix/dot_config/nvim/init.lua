require('config.lazy')
require('plugins')

require('settings.ui')
require('settings.indentation')
--require('settings.dashboard')

-- Use fzf and ripgrep for fuzzy search
require('fzf-lua').setup({
  files = { cmd = 'rg --files' },
})

-- Turn off spell checks, use typos instead
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.opt_local.spell = false
  end,
})
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', {
  undercurl = true,
  sp = '#A6E3A1',
})
