local wezterm = require("wezterm")
local theme = require("lua/rose-pine").main

local c = {}
if wezterm.config_builder then
	c = wezterm.config_builder()
	c:set_strict_mode(true)
end

-- COLORS
c.use_fancy_tab_bar = false
c.show_new_tab_button_in_tab_bar = false
c.color_scheme = "rose-pine"

c.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}
return c
