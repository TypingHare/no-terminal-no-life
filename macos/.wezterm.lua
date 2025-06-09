local wezterm = require 'wezterm'

return {
  -- Color scheme, see: https://wezterm.org/colorschemes/index.html
  color_scheme = 'Adventure',

  -- To check all the fonts WezTerm uses, run `wezterm ls-font`
  -- Use `wezterm ls-font --text "Test"` for more detail info
  font = wezterm.font_with_fallback {
    'JetBrainsMonoNL Nerd Font',
    'FiraCode Nerd Font',
    'SF Mono',
  },

  -- The font size
  font_size = 15.0,

  -- The line height (the vertical space between lines of text)
  line_height = 1.2,

  -- Window
  window_background_opacity = 0.85,
  macos_window_background_blur = 20,
  window_decorations = 'RESIZE',

  -- Initial window size
  initial_cols = 120,
  initial_rows = 36,
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,

  -- Padding
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  -- How many lines WezTerm save in buffer so that users and can scroll back
  scrollback_lines = 10000,

  -- Keybindings
  keys = {
    -- Toggle full screen
    {
      key = 'Enter',
      mods = 'CMD',
      action = wezterm.action.ToggleFullScreen,
    },
  },

  automatically_reload_config = true,
}
