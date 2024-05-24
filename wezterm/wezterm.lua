local wezterm = require("wezterm")
local theme = require("lua/rose_pine").moon

local c = {}
if wezterm.config_builder then
	c = wezterm.config_builder()
	c:set_strict_mode(true)
end

-- COLORS
c.use_fancy_tab_bar = false
c.show_new_tab_button_in_tab_bar = false

-- c.colors = theme.colors()
c.color_scheme = "tokyonight_storm"
c.window_frame = theme.window_frame()

c.window_padding = {
	left = 2,
	right = 2,
	top = 0,
	bottom = 0,
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local palette = config.resolved_palette.tab_bar
	local colors = {
		bg = palette.background,
		tab = tab.is_active and palette.active_tab.bg_color or palette.inactive_tab.bg_color,
		fg = tab.is_active and palette.active_tab.fg_color or palette.inactive_tab.fg_color,
	}

	return {
		{ Background = { Color = colors.bg } },
		{ Foreground = { Color = colors.tab } },
		{ Text = wezterm.nerdfonts.ple_lower_right_triangle },
		{ Background = { Color = colors.tab } },
		{ Foreground = { Color = colors.fg } },
		{ Text = tab.active_pane.title },
		{ Background = { Color = colors.tab } },
		{ Foreground = { Color = colors.bg } },
		{ Text = wezterm.nerdfonts.ple_upper_right_triangle },
	}
end)

-- OPEN NEW TERM IN SAME DIR
-- Function to get the working directory of the first terminal
local function getInitialDir(window_config, pane_config, window, pane)
	local pid = pane:pid()
	if pid then
		local dir = wezterm.get_child_process_cwd(pid)
		return dir
	end
	return nil
end

return c
