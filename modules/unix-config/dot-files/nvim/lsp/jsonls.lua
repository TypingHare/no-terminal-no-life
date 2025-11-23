return {
  cmd = { 'json-lsp' },
  filetypes = { 'json', 'jsonc' },
  root_markers = { '.git' },
  settings = {
    json = {
      schemas = {
        require('schemastore').json.schemas(),
      },
      validate = { enable = true },
    },
  },
}
