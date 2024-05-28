local wezterm = require("wezterm")
local c = wezterm.config_builder()
local act = wezterm.action

c.color_scheme = "rose-pine"
c.window_background_opacity = 1

c.font = wezterm.font_with_fallback({
	{ family = "Iosevka Nerd Font", scale = 1.2, weight = "Medium" },
})

c.window_padding = {
	left = 2,
	right = 2,
	top = 10,
	bottom = 0,
}

c.use_dead_keys = false
c.scrollback_lines = 5000
c.hide_tab_bar_if_only_one_tab = true

-- Keys
c.disable_default_key_bindings = false
c.keys = {
	{ key = "j", mods = "ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "h", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "ALT", action = act.ActivatePaneDirection("Right") },

	{ key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },

	{ key = "f", mods = "ALT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "ALT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "x", mods = "ALT", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "w", mods = "CTRL", action = act.CloseCurrentTab({ confirm = false }) },
	{
		key = "p",
		mods = "ALT",
		action = wezterm.action.ActivateCommandPalette,
	},
	{
		key = "m",
		mods = "ALT",
		action = wezterm.action.TogglePaneZoomState,
	},
}

return c
