require('polyglot').add_lang {
  name = 'Make',
  filetypes = { 'make' },
  treesitter = { tool = 'make' },
  lsp = { tool = 'bash-language-server' },
  linter = { tool = 'checkmake' },
  -- formatter = { tool = 'shfmt' },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'make',
  callback = function()
    vim.bo.expandtab = false
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 0
  end,
})
