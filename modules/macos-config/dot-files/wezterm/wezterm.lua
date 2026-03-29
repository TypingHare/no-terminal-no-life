--------------------------------------------------------------------------------
--- Copyright 2025-2026 James Chen
---
--- This is a Wezterm configuration.
---
--- Last Updated: Mar 13, 2026
--- Wezterm version: 20250615-121431-d6c178f9
--------------------------------------------------------------------------------

local wezterm = require 'wezterm'

wezterm.on('window-config-reloaded', function(window)
    local scheme = 'Dark Pastel (Gogh)'
    -- local appearance = wezterm.gui.get_appearance()
    -- if not appearance:find 'Dark' then
    -- scheme = 'Solarized Light'
    -- end

    window:set_config_overrides { color_scheme = scheme }
end)

return {
    -- System
    automatically_reload_config = true,

    -- For more color schemes, see the following link:
    -- [https://wezterm.org/colorschemes/index.html]
    -- color_scheme = 'Dark Pastel (Gogh)',

    -- To check all the fonts WezTerm uses, run `wezterm ls-fonts`
    -- For more information, run `wezterm ls-fonts --text "Test"`
    font = wezterm.font_with_fallback {
        '0xProto Nerd Font',
        'psudoFont Liga Mono',
        'FiraCode Nerd Font',
        'JetBrainsMono Nerd Font Mono',
        'SF Mono',
    },

    -- Text style
    font_size = 14.0,
    line_height = 1.2,

    -- Window layout and styles
    window_background_opacity = 0.80,
    macos_window_background_blur = 25,
    window_decorations = 'RESIZE',
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    -- Initial window size
    initial_cols = 120,
    initial_rows = 30,

    -- Tab bar options
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,

    -- The number of lines WezTerm save in buffer
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
}
