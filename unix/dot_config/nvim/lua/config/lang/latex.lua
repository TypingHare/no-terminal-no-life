require('polyglot').add_lang {
  name = 'LaTeX',
  filetypes = { 'tex' },
  treesitter = { tool = 'latex' },
  lsp = {
    tool = 'texlab',
    setup = {
      settings = {
        texlab = {
          build = {
            executable = 'latexmk',
            args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
            onSave = true,
          },
          -- forwardSearch = {
          --   executable = 'open',
          --   args = { '-a', 'Skim', '%p' },
          -- },
          forwardSearch = {
            executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
            args = { '%l', '%p', '%f' },
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
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  callback = function()
    km.n {
      key = '<leader>rf',
      action = function()
        local params = {
          command = 'texlab.forwardSearch',
          arguments = {
            {
              tex = vim.api.nvim_buf_get_name(0),
            },
          },
        }
        for _, client in ipairs(vim.lsp.get_clients { bufnr = 0 }) do
          if client.name == 'texlab' then
            client:request('workspace/executeCommand', params, nil, 0)
          end
        end
      end,
      desc = 'Texlab Forward Search',
    }
  end,
})
