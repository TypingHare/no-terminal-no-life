return {
  'stevearc/conform.nvim',
  enabled = false,
  opts = {
    formatters_by_ft = {
      -- TOML formatter
      -- cargo install taplo-cli --locked
      toml = { 'taplo' },
      json = { 'prettier' },
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      -- Python formatter (black)
      python = { '.venv/bin/black' },
    },
  },
}
