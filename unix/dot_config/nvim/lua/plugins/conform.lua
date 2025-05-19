-- TOML formatter
-- cargo install taplo-cli --locked
return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      toml = { 'taplo' },
    },
  },
}
