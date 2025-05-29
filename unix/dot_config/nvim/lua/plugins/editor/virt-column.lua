return {
    'lukas-reineke/virt-column.nvim',
    config = function()
        require('virt-column').setup {
            char = '▏',
            virtcolumn = '81',
            priority = 1,
            highlight = 'VirtColumn',
        }

        vim.api.nvim_set_hl(
            0,
            'VirtColumn',
            require('constants.highlight').VERTICAL_BAR
        )

        -- Disable virt-column on some filetypes
        vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'dashboard' },
            callback = function()
                require('virt-column').setup {
                    char = '',
                }
            end,
        })
    end,
}
