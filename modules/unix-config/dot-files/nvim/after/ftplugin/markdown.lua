require('hare-conf').fn.editor.set_lang_config({ 'markdown' }, {
  treesitter = { name = 'markdown' },
  lsp = { name = 'marksman' },
  linter = { name = 'markdownlint' },
  formatter = { name = 'prettier' },
  color_column = { enabled = false },
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*markdown*',
  callback = function(args)
    vim.schedule(function()
      vim.cmd 'Markview Disable'
    end)

    local buf = args.buf
    vim.keymap.set(
      'n',
      '<leader>em',
      '<cmd>Markview Toggle<CR>',
      { buffer = buf, desc = 'Toggle MarkView' }
    )
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.cmd 'SoftWrapMode'

    vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
    vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })
    vim.keymap.set('n', '^', 'g^', { noremap = true, silent = true })
    vim.keymap.set('n', '$', 'g$', { noremap = true, silent = true })
  end,
})
