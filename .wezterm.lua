-- Pull in the wezterm API
local wezterm = require("wezterm")

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#000000"
custom.tab_bar.background = "#040404"
custom.tab_bar.inactive_tab.bg_color = "#0f0f0f"
custom.tab_bar.new_tab.bg_color = "#080808"

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Tema automático baseado no sistema
function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Frappe" -- Mocha Macchiato, Frappe, Latte
  else
    return "Catppuccin Latte"
  end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())

-- Fonte
-- config.font = wezterm.font("JetBrains Mono")
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 16

-- Janela
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10

return config