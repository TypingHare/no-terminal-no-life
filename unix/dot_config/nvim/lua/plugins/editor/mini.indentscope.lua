return {
    'echasnovski/mini.indentscope',
    opts = {
        symbol = '▏',
        options = { try_as_border = true },
    },
    init = function()
        require('modules.screener').set {
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        }

        vim.api.nvim_create_autocmd('ColorScheme', {
            callback = function()
                vim.api.nvim_set_hl(
                    0,
                    'MiniIndentscopeSymbol',
                    { fg = '#56ab91' }
                )
            end,
        })
    end,
}
