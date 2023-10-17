local wezterm = require 'wezterm'

local fonts = {}

function fonts.big_blue_term437_font()
   return wezterm.font("BigBlueTerm437 Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
end

function fonts.big_blue_term_plus_font()
  return wezterm.font("BigBlueTermPlus Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
end

function fonts.blex_mono_font_and_rules()
  -- local font = wezterm.font("BlexMono Nerd Font Propo", {weight="Thin", stretch="Normal", style="Normal"})
  -- local font = wezterm.font("BlexMono Nerd Font Propo", {weight="ExtraLight", stretch="Normal", style="Normal"})
  local font = wezterm.font("BlexMono Nerd Font Propo", {weight="Light", stretch="Normal", style="Normal"})
  -- local font = wezterm.font("BlexMono Nerd Font Propo", {weight="Medium", stretch="Normal", style="Normal"})
  -- local font = wezterm.font("BlexMono Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
  -- font = wezterm.font("BlexMono Nerd Font Propo", {weight=450, stretch="Normal", style="Normal"})
  local font_rules = { 
    {
      italic = true,
      -- font = wezterm.font("BlexMono Nerd Font Propo", {weight="Thin", stretch="Normal", style="Italic"})
      -- font = wezterm.font("BlexMono Nerd Font Propo", {weight="ExtraLight", stretch="Normal", style="Italic"})
      font = wezterm.font("BlexMono Nerd Font Propo", {weight="Light", stretch="Normal", style="Italic"})
      -- font = wezterm.font("BlexMono Nerd Font Propo", {weight="Regular", stretch="Normal", style="Italic"}),
      -- font = wezterm.font("BlexMono Nerd Font Propo", {weight="Medium", stretch="Normal", style="Italic"})
      -- font = wezterm.font("BlexMono Nerd Font Propo", {weight=450, stretch="Normal", style="Italic"})
    },
    {
      intensity = "Bold",
      -- font = wezterm.font("BlexMono Nerd Font Propo", {weight="DemiBold", stretch="Normal", style="Normal"})
      font = wezterm.font("BlexMono Nerd Font Propo", {weight="Bold", stretch="Normal", style="Normal"}),
    },
    {
      italic = true, intensity = "Bold",
      -- font = wezterm.font("BlexMono Nerd Font Propo", {weight="DemiBold", stretch="Normal", style="Italic"})
      font = wezterm.font("BlexMono Nerd Font Propo", {weight="Bold", stretch="Normal", style="Italic"}),
    },
  }
  return font, font_rules
end

function fonts.caskaydia_cove_font_and_rules()
  -- local font = wezterm.font("CaskaydiaCove Nerd Font Propo", {weight="ExtraLight", stretch="Normal", style="Normal"})
  -- local font = wezterm.font("CaskaydiaCove Nerd Font Propo", {weight="Light", stretch="Normal", style="Normal"})
  local font = wezterm.font("CaskaydiaCove Nerd Font Propo", {weight="DemiLight", stretch="Normal", style="Normal"})
  -- local font = wezterm.font("CaskaydiaCove Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
  
  local font_rules = { 
    {
      italic = true,
      -- font = wezterm.font("CaskaydiaCove Nerd Font Propo", {weight="ExtraLight", stretch="Normal", style="Italic"})
      -- font = wezterm.font("CaskaydiaCove Nerd Font Propo", {weight="Light", stretch="Normal", style="Italic"})
      font = wezterm.font("CaskaydiaCove Nerd Font Propo", {weight="DemiLight", stretch="Normal", style="Italic"}),
      -- font = wezterm.font("CaskaydiaCove Nerd Font Propo", {weight="Regular", stretch="Normal", style="Italic"})
    },
    {
      intensity = "Bold",
      -- font = wezterm.font("CaskaydiaCove Nerd Font Propo", {weight="DemiBold", stretch="Normal", style="Normal"})
      font = wezterm.font("CaskaydiaCove Nerd Font Propo", {weight="Bold", stretch="Normal", style="Normal"}),
    },
    {
      italic = true, intensity = "Bold",
      -- font = wezterm.font("CaskaydiaCove Nerd Font Propo", {weight="DemiBold", stretch="Normal", style="Italic"})
      font = wezterm.font("CaskaydiaCove Nerd Font Propo", {weight="Bold", stretch="Normal", style="Italic"}),
    },
  }
  return font, font_rules
end

function fonts.code_new_roman_font_and_rules()
  local font = wezterm.font("CodeNewRoman Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
  
  local font_rules = {
    {
      italic = true,
      font = wezterm.font("CodeNewRoman Nerd Font Propo", {weight="Regular", stretch="Normal", style="Italic"}),
    },
    {
      intensity = "Bold",
      font = wezterm.font("CodeNewRoman Nerd Font Propo", {weight="Bold", stretch="Normal", style="Normal"})
    },
  }

  return font, font_rules
end

function fonts.fira_mono_font_and_rules()
  font = wezterm.font("FiraMono Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
  -- wezterm.font("FiraMono Nerd Font Propo", {weight="Medium", stretch="Normal", style="Normal"})

  local font_rules = {
    {
      intensity = "Bold",
      font = wezterm.font("FiraMono Nerd Font Propo", {weight="Bold", stretch="Normal", style="Normal"})
    },
  }
  return font, font_rules
end

function fonts.hack_font_and_rules()
  local font = wezterm.font("Hack Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})

  local font_rules = {
    {
      italic = true,
      font = wezterm.font("Hack Nerd Font Propo", {weight="Regular", stretch="Normal", style="Italic"})
    },
    {
      intensity = "Bold",
      font = wezterm.font("Hack Nerd Font Propo", {weight="Bold", stretch="Normal", style="Normal"})
    },
    {
      italic = true, intensity = "Bold",
      font = wezterm.font("Hack Nerd Font Propo", {weight="Bold", stretch="Normal", style="Italic"})
    },
  }
  return font, font_rules
end

function fonts.lilex_font()
  -- wezterm.font("Lilex Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
  -- wezterm.font("Lilex Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
  font = wezterm.font("Lilex Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})

  -- local font_rules = {
  --   {
  --     italic = true,
  --
  --   },
  --   {
  --     intensity = "Bold",
  --
  --   },
  --   {
  --     italic = true, intensity = "Bold",
  --
  --   },
  -- }
  return font
end

function fonts.mononoki_font_and_rules()
  local font = wezterm.font("Mononoki Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})

  local font_rules = {
    {
      italic = true,
      font = wezterm.font("Mononoki Nerd Font Propo", {weight="Regular", stretch="Normal", style="Italic"})
    },
    {
      intensity = "Bold",
      font = wezterm.font("Mononoki Nerd Font Propo", {weight="Bold", stretch="Normal", style="Normal"})
    },
    {
      italic = true, intensity = "Bold",
      font = wezterm.font("Mononoki Nerd Font Propo", {weight="Bold", stretch="Normal", style="Italic"})
    },
  }

  return font, font_rules
end

function fonts.noto_sans_m_font_and_rules()
  -- local font = wezterm.font("NotoSansM Nerd Font Propo", {weight="Thin", stretch="Normal", style="Normal"})
  -- local font = wezterm.font("NotoSansM Nerd Font Propo", {weight="ExtraLight", stretch="Normal", style="Normal"})
  -- local font = wezterm.font("NotoSansM Nerd Font Propo", {weight="Light", stretch="Normal", style="Normal"})
  local font = wezterm.font("NotoSansM Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
  -- local font = wezterm.font("NotoSansM Nerd Font Propo", {weight="Medium", stretch="Normal", style="Normal"})

  local font_rules = {
    {
      intensity = "Bold",
      -- font = wezterm.font("NotoSansM Nerd Font Propo", {weight="DemiBold", stretch="Normal", style="Normal"})
      -- font = wezterm.font("NotoSansM Nerd Font Propo", {weight="Bold", stretch="Normal", style="Normal"})
      -- font = wezterm.font("NotoSansM Nerd Font Propo", {weight="ExtraBold", stretch="Normal", style="Normal"})
      font = wezterm.font("NotoSansM Nerd Font Propo", {weight="Black", stretch="Normal", style="Normal"})
    },
  }
  return font, font_rules
end

function fonts.roboto_font_and_rules()
  -- local font = wezterm.font("RobotoMono Nerd Font Propo", {weight="Light", stretch="Normal", style="Normal"})
  -- local font = wezterm.font("RobotoMono Nerd Font Propo", {weight=250, stretch="Normal", style="Normal"})
  local font = wezterm.font("RobotoMono Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
  -- local font = wezterm.font("RobotoMono Nerd Font Propo", {weight="Medium", stretch="Normal", style="Normal"})

  local font_rules = {
    {
      italic = true,
      -- font = wezterm.font("RobotoMono Nerd Font Propo", {weight=250, stretch="Normal", style="Italic"})
      -- font = wezterm.font("RobotoMono Nerd Font Propo", {weight="Light", stretch="Normal", style="Italic"})
      font = wezterm.font("RobotoMono Nerd Font Propo", {weight="Regular", stretch="Normal", style="Italic"})
      -- font = wezterm.font("RobotoMono Nerd Font Propo", {weight="Medium", stretch="Normal", style="Italic"})
    },
    {
      intensity = "Bold",
      -- font = wezterm.font("RobotoMono Nerd Font Propo", {weight="DemiBold", stretch="Normal", style="Normal"})
      font = wezterm.font("RobotoMono Nerd Font Propo", {weight="Bold", stretch="Normal", style="Normal"})
    },
    {
      italic = true, intensity = "Bold",
      -- font = wezterm.font("RobotoMono Nerd Font Propo", {weight="Bold", stretch="Normal", style="Italic"})
      font = wezterm.font("RobotoMono Nerd Font Propo", {weight="DemiBold", stretch="Normal", style="Italic"})
    },
  }

  return font, font_rules
end

function fonts.sauce_code_pro_font_and_rules()
  -- local font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="ExtraLight", stretch="Normal", style="Normal"})
  -- local font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="Light", stretch="Normal", style="Normal"})
  local font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="Regular", stretch="Normal", style="Normal"})
  -- wezterm.font("SauceCodePro Nerd Font Propo", {weight="Medium", stretch="Normal", style="Normal"})

  local font_rules = {
    {
      italic = true,
      -- font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="ExtraLight", stretch="Normal", style="Italic"})
      -- font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="Light", stretch="Normal", style="Italic"})
      font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="Regular", stretch="Normal", style="Italic"})
      -- font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="Medium", stretch="Normal", style="Italic"})
    },
    {
      intensity = "Bold",
      -- font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="Bold", stretch="Normal", style="Normal"})
      -- font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="DemiBold", stretch="Normal", style="Normal"})
      font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="Black", stretch="Normal", style="Normal"})
    },
    {
      italic = true, intensity = "Bold",
      -- font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="DemiBold", stretch="Normal", style="Italic"})
      -- font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="Bold", stretch="Normal", style="Italic"})
      font = wezterm.font("SauceCodePro Nerd Font Propo", {weight="Black", stretch="Normal", style="Italic"})
    },
  }
  return font, font_rules
end

-- function fonts._font_and_rules()
--
--   local font_rules = {
--     {
--       italic = true,
--     },
--     {
--       intensity = "Bold",
--     },
--     {
--       italic = true, intensity = "Bold",
--     },
--   }
--   return font, font_rules
-- end

return fonts
