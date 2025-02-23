-- bootstrap lazy.nvim, LazyVim and plugins
require("config.lazy")

-- Enable transparent background
vim.cmd([[
    highlight Normal ctermbg=none guibg=none
    highlight NonText ctermbg=none guibg=none
]])

-- Set the tab to 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- Enable soft wrapping
vim.opt.wrap = true

--
vim.opt.colorcolumn = "80"
