local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- set for key diagnostice
-- config.debug_key_events = true

config.send_composed_key_when_right_alt_is_pressed = false

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

config.color_scheme = 'tokyonight_night'
--config.color_scheme = 'Catppuccin Mocha' 

config.font_size = 16
config.command_palette_font_size = 14
config.bold_brightens_ansi_colors = 'BrightAndBold'

config.cursor_thickness = "300%"
default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 600

config.inactive_pane_hsb = {
  saturation = 0.1,
  brightness = 0.1,
}

config.colors = {
  visual_bell = '#202020',
  background = '#050013',
}

config.audible_bell = 'Disabled'
    
local act = wezterm.action
config.keys = {
  { key = '\\',        mods = 'SUPER',       action = act.SplitVertical{ domain = 'CurrentPaneDomain' }, },
  { key = '|',         mods = 'SUPER',       action = act.SplitHorizontal{ domain = 'CurrentPaneDomain' }, },
  { key = 'UpArrow',   mods = 'SUPER',       action = act.ScrollByLine(-1) },
  { key = 'UpArrow',   mods = 'SUPER|SHIFT', action = act.ScrollByLine(-15) },
  { key = 'DownArrow', mods = 'SUPER',       action = act.ScrollByLine(1) },
  { key = 'DownArrow', mods = 'SUPER|SHIFT', action = act.ScrollByLine(15) },
  { key = 'p',         mods = 'SUPER|SHIFT', action = act.ActivateCommandPalette },
  { key = 'p',         mods = 'ALT|SHIFT',   action = act.ActivateCommandPalette },
}

-- and finally, return the configuration to wezterm
return config
