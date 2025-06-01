if not vim.g.neovide then
  return false
end

-- Command + v is `paste` on macOS.
km.set({ 'n', 'i', 'o', 't' }, {
  key = '<D-v>',
  action = '<Esc>p',
  desc = 'Neovide + macOS Paste',
})

-- Toggle full screen.
km.n {
  key = '\\f',
  action = function()
    if vim.g.neovide_fullscreen then
vim.g.neovide_fullscreen = false
    else
vim.g.neovide_fullscreen = true 
    end
  end,
  desc = 'Toggle Full Screen',
}
