local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "rose-pine"
config.window_background_opacity = 1

config.font = wezterm.font_with_fallback({
	{ family = "Iosevka Nerd Font", scale = 1.2, weight = "Medium" },
})

config.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

return config
