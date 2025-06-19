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
            args = {
              '-pdf',
              '-interaction=nonstopmode',
              '-synctex=1',
              --'-output-directory=build',
              '%f',
            },
            onSave = true,
            forwardSearchAfter = true,
          },
          -- forwardSearch = {
          --   executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
          --   args = {
          --     '-r',
          --     '%line',
          --     '%pdfPath',
          --     '%texPath',
          --   },
          -- },
          forwardSearch = {
            executable = 'open',
            args = {
              '-a',
              'Skim',
              '%pdfPath',
              -- '--args',
              -- '-r',
              -- '-g',
              -- '%line',
              -- '%texPath',
            },
            onSave = true,
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
