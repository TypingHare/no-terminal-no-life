require('hare-conf').fn.editor.set_lang_config('tex', {
  treesitter = { name = 'latex' },
  lsp = { name = 'texlab' },
  linter = { enabled = false },
  formatter = { name = 'latexindent' },
})

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

    vim.schedule(function()
      if vim.bo.filetype == 'tex' then
        vim.opt_local.wrap = true
      end
    end)
  end,
})
