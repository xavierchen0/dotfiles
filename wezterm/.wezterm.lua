-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
local config = wezterm.config_builder()

-- #######################
--
-- MY CONFIG GOES HERE
--
-- #######################

-- Colorscheme
config.color_scheme = "rose-pine"

-- Font
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12.0
-- disable ligatures
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
config.font_rules = {
	{
		intensity = "Bold",
		font = wezterm.font({
			family = "JetBrains Mono",
			weight = "ExtraBold", -- Much thicker than default Bold
		}),
	},
	{
		italic = true,
		font = wezterm.font({
			family = "JetBrains Mono",
			style = "Italic",
		}),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({
			family = "JetBrains Mono",
			weight = "ExtraBold",
			style = "Italic",
		}),
	},
}

-- Keyboard
-- Below is to disable dead key processing so that ^ can be used with a single keypress
config.use_dead_keys = false

-- Remove the macos bar at the top with the 3 buttons
config.window_decorations = "RESIZE"

-- Tabs
config.hide_tab_bar_if_only_one_tab = true

-- Scrollback
config.keys = {
	{ key = "U", mods = "CTRL|SHIFT", action = wezterm.action.ScrollByPage(-0.5) },
	{ key = "D", mods = "CTRL|SHIFT", action = wezterm.action.ScrollByPage(0.5) },
}

config.max_fps = 120

-- Minimise window_padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
