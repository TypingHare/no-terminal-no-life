require('polyglot').add_lang {
  name = 'Markdown',
  filetypes = { 'markdown' },
  lsp = { tool = 'marksman' },
  formatter = { tool = 'prettier' },
  linter = { tool = 'markdownlint' },
  format_on_save = true,
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*markdown*',
  callback = function(args)
    local buf = args.buf
    vim.schedule(function()
      vim.cmd 'Markview Disable'
    end)

    vim.keymap.set(
      'n',
      '<leader>em',
      '<cmd>Markview Toggle<CR>',
      { buffer = buf, desc = 'Toggle MarkView' }
    )
    vim.keymap.set(
      'n',
      '<leader>ep',
      '<cmd>MarkdownPreviewToggle<CR>',
      { buffer = buf, desc = 'Toggle Markdown Preview' }
    )
  end,
})

-- Disable the vertical column for markdown files.
require('virt-column').update {
  exclude = {
    filetypes = { 'markdown' },
  },
}
