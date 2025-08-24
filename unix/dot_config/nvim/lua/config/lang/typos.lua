-- Typos is a source-code-aware spell checker. It detects typos in code and
-- docs, with low false-positive rate. Implemented with Rust, it is also fast
-- and scalable.
--
-- GitHub page: https://github.com/crate-ci/typos

require('polyglot').add_lang {
  name = 'typos',
  lsp = {
    tool = 'typos-lsp',
    -- setup = {
    --   cmd = { 'typos-lsp', '--config', 'typos.toml' },
    --   filetypes = { '*' },
    -- },
  },
  format_on_save = false,
}
