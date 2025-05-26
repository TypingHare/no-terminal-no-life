return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            -- TOML formatter
            -- cargo install taplo-cli --locked
            toml = { 'taplo' },
            -- npm install -g prettier
            json = { 'prettier' },
            javascript = { 'prettier' },
            typescript = { 'prettier' },
            -- Python formatter (black)
            python = { '.venv/bin/black' },
        },
    },
}
