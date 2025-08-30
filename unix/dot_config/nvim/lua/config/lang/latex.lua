require('polyglot').add_lang {
  name = 'LaTeX',
  enable = false,
  filetypes = { 'tex' },
  treesitter = { tool = 'latex' },
  lsp = {
    tool = 'texlab',
    setup = {
      on_attach = function() end,
      settings = {
        texlab = {
          diagnostics = {
            enabled = false,
          },
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
    vim.opt_local.breakindent = true

    vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
    vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })
    vim.keymap.set('n', '^', 'g^', { noremap = true, silent = true })
    vim.keymap.set('n', '$', 'g$', { noremap = true, silent = true })

    -- Disable the spell check, use typos instead
    vim.opt_local.spell = false
  end,
})
