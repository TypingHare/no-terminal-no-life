require('config.lazy')

-- Config
require('config.terminal')
require('config.session')

-- Settings
require('settings.ui')
require('settings.indentation')
require('settings.spell')
require('settings.fzf')

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        vim.schedule(function()
            if vim.bo.filetype == 'neo-tree' then
                vim.cmd('wincmd l')
            end
        end)
    end,
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'neo-tree',
    callback = function()
        vim.keymap.set(
            'n',
            'e',
            '<Cmd>wincmd l<CR>',
            { buffer = true, silent = true }
        )
    end,
})

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap(
    'n',
    'gd',
    '<cmd>lua vim.lsp.buf.definition()<CR>',
    { noremap = true, silent = true }
)

vim.keymap.set('n', '<C-d>', function()
    local current_buf = vim.api.nvim_get_current_buf()
    vim.cmd('bnext')
    vim.cmd('bdelete ' .. current_buf)
end, { noremap = true, silent = true })

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        vim.keymap.set('n', '<C-a>', function()
            vim.cmd('e %')
        end, { noremap = true, silent = true })
    end,
})
