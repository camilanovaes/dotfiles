-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Color scheme
config.color_scheme = 'Catppuccin Mocha'

-- Only show the tab bar if there is more than one tab active
config.hide_tab_bar_if_only_one_tab = true
-- We can also disable the tab bar entirely using:
-- config.enable_tab_bar = false

-- Font
config.font_size = 11

-- and finally, return the configuration to wezterm
return config
