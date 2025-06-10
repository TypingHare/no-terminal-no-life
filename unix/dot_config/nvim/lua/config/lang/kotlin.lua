require('polyglot').add_lang {
  name = 'Kotlin',
  filetypes = { 'kotlin' },
  lsp = {
    tool = 'kotlin-language-server',
    setup = {
      root_dir = require('lspconfig.util').root_pattern(
        'build.gradle.kts',
        'settings.gradle.kts',
        'pom.xml'
      ),
    },
  },
  formatter = { tool = 'ktlint' },
  format_on_save = true,
}
