return {
    'mfussenegger/nvim-lint',
    opts = {
        linters_by_ft = {},
    },
    config = function()
        require('lint').linters_by_ft = {
            javascript = { 'eslint' },
            typescript = { 'eslint' },
            json = { 'eslint' },
        }

        vim.api.nvim_create_autocmd(
            { 'BufWritePost', 'BufReadPost', 'InsertLeave' },
            {
                callback = function()
                    require('lint').try_lint()
                end,
            }
        )
    end,
}
