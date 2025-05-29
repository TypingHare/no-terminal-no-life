-- Binds space to leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Indent by 4 spaces
vim.opt.tabstop = 4 -- A tab is displayed as 4 spaces
vim.opt.softtabstop = 4 -- A tab feels like 4 spaces when editing

local mason = require 'mason'
mason.setup()

require 'config.lang.lua'
