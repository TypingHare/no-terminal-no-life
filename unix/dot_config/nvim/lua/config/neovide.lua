-- This configuration module is for Neovide.

if not vim.g.neovide then
  return false
end

-- Use true color (16 million colors).
vim.opt.termguicolors = true

-- Set up the Gui Font.
-- Download from: www.nerdfonts.com/font-downloads
vim.o.guifont = 'JetBrainsMonoNL Nerd Font:h13'

-- Set up the transparency.
vim.g.neovide_opacity = 0.7

-- When transparent is enabled
vim.g.neovide_window_blurred = true

-- Set up floating blurry
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0

-- Set up the cursor particle effect.
-- Options: railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
vim.g.neovide_cursor_vfx_mode = ''

-- The duraction of scroll animatoin
vim.g.neovide_scroll_animation_length = 0.3

-- Disable full screen on startup.
vim.g.neovide_fullscreen = false

-- Whether to use the previous window size on startup.
vim.g.neovide_remember_window_size = false

vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5

-- Set up window padding
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_left = 0
