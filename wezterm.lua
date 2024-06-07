-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

config.color_scheme = 'Catppuccin Mocha'
config.enable_tab_bar = false
config.window_padding = {
  left = '2px',
  right = '2px',
  top = '1px',
  bottom = '1px',
}
config.font =
    wezterm.font("SauceCodePro Nerd Font Mono", {
      weight = "Regular",
      stretch = "Normal",
      style = "Normal"
    })
config.font_size = 14

-- and finally, return the configuration to wezterm
return config
