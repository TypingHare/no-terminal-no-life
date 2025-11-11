return {
  cmd = { 'json-lsp' },
  filetypes = { 'json', 'jsonc' },
  root_markers = { '.git' },
  settings = {
    json = {
      schemas = {
        -- require('schemastore').json.schemas(),
        {
          description = 'Hare Configuration',
          fileMatch = { 'neoconf.json' },
          url = 'file://' .. vim.fn.expand '~/.config/nvim/schemas/hare.json',
        },
      },
      validate = { enable = true },
    },
  },
}
