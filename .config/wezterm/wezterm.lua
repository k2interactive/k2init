local wezterm = require 'wezterm'
local fonts = require 'wezfonts'
local kb_shortcuts = require 'kb-shortcuts'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- set for key diagnostice
-- config.debug_key_events = true

-- may cause some compat issues to work on :-P
config.term = 'wezterm'


config.send_composed_key_when_right_alt_is_pressed = false

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- config.color_scheme = 'tokyonight_night'
-- config.color_scheme = 'Catppuccin Mocha (Gogh)'
config.color_scheme = 'nightfox'
-- config.color_scheme = 'duskfox'
config.bold_brightens_ansi_colors = 'BrightAndBold'
config.window_background_gradient = {
    colors = {
        '#2a152f',
        '#010005',
    },
    -- orientation = 'Vertical',
    orientation = {
        Radial = {
            cx = 0.5,
            cy = 0.9,
            radius = 0.80,
        },
    },
}

config.adjust_window_size_when_changing_font_size = false

config.font_size = 13
config.command_palette_font_size = 14
-- config.font = fonts.big_blue_term437_font()
-- config.font = fonts.big_blue_term_plus_font()
-- config.font, config.font_rules = fonts.blex_mono_font_and_rules()
config.font, config.font_rules = fonts.caskaydia_cove_font_and_rules()
-- config.font, config.font_rules = fonts.code_new_roman_font_and_rules()
-- config.font, config.font_rules = fonts.fira_mono_font_and_rules()
-- config.font, config.font_rules = fonts.hack_font_and_rules()
-- config.font = fonts.lilex_font()
-- config.font, config.font_rules = fonts.mononoki_font_and_rules()
-- config.font, config.font_rules = fonts.noto_sans_m_font_and_rules()
-- config.font, config.font_rules = fonts.roboto_font_and_rules()
-- config.font, config.font_rules = fonts.sauce_code_pro_font_and_rules()

config.cursor_thickness = "250%"
default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 600

config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.6,
}

config.audible_bell = 'Disabled'
config.colors = {
  visual_bell = '#202020',
  background = '#0e050f',
}
    
config.keys = kb_shortcuts

wezterm.on('user-var-changed', function(window, pane, name, value)
  local overrides = window:get_config_overrides() or {}
  if name == "ZEN_MODE" then
    local incremental = value:find("+")
    local number_value = tonumber(value)
    if incremental ~= nil then
      while (number_value > 0) do
        window:perform_action(wezterm.action.IncreaseFontSize, pane)
        number_value = number_value - 1
      end
      overrides.enable_tab_bar = false
    elseif number_value < 0 then
      window:perform_action(wezterm.action.ResetFontSize, pane)
      overrides.font_size = nil
      overrides.enable_tab_bar = true
    else
      overrides.font_size = number_value
      overrides.enable_tab_bar = false
    end
  end
  window:set_config_overrides(overrides)
end)

-- and finally, return the configuration to wezterm
return config
