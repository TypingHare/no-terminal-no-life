vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function()
        vim.opt_local.spell = false
    end,
})

-- Set the squiggly line color
-- vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', {
--   undercurl = true,
--   sp = '#A6E3A1',
-- })
