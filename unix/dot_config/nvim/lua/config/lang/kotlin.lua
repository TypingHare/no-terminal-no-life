require('polyglot').add_lang {
  name = 'Kotlin',
  patterns = { '*.kt', '*.kts' },
  lsp = {
    tool = 'kotlin-language-server',
    setup = {
      root_dir = require('lspconfig.util').root_pattern(
        'build.gradle.kts',
        'settings.gradle.kts',
        'pom.xml'
      ),
      on_attach = function(client, _)
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    },
  },
  formatter = {
    tool = 'ktlint',
    source = require('null-ls').builtins.formatting.ktlint,
  },
  format_on_save = true,
}
