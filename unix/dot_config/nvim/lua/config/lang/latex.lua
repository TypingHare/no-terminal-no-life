require('polyglot').add_lang {
  name = 'LaTeX',
  filetypes = { 'tex' },
  treesitter = { tool = 'latex' },
  lsp = {
    tool = 'texlab',
    setup = {
      on_attach = function() end,
      settings = {
        texlab = {
          build = {
            executable = '',
            args = {},
            onSave = false,
            forwardSearchAfter = false,
          },
          forwardSearch = {
            executable = '',
            args = {},
          },
        },
      },
    },
  },
  formatter = {
    tool = 'latexindent',
  },
  format_on_save = true,
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true

    vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
    vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })
    vim.keymap.set('n', '^', 'g^', { noremap = true, silent = true })
    vim.keymap.set('n', '$', 'g$', { noremap = true, silent = true })
  end,
})
