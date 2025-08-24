local wezterm = require("wezterm")

local config = wezterm.config_builder()
config.font = wezterm.font_with_fallback({
	{ family = "FiraCode Nerd Font" },
	{ family = "MesloLGS Nerd Font" },
})
config.font_size = 12
config.line_height = 1.0
config.term = "xterm-256color"
config.inactive_pane_hsb = {
	saturation = 1.0,
	brightness = 1.0,
}

config.use_resize_increments = true
config.enable_tab_bar = false
config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.window_decorations = "RESIZE"
config.front_end = "Software"

config.window_background_opacity = 0.80
config.macos_window_background_blur = 0

config.window_padding = {
	left = 0,
	right = 0,
	top = 18,
	bottom = 6,
}

config.colors = {
	foreground = "#CBE0F0",
	background = "#011423",
	cursor_bg = "#47FF9C",
	cursor_border = "#47FF9C",
	cursor_fg = "#011423",
	selection_bg = "#033259",
	selection_fg = "#CBE0F0",
	ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
	brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
}

-- Toggle background command
wezterm.on("toggle-background", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if overrides.background then
		-- Remove background
		overrides.background = nil
	else
		-- Set background
		overrides.background = {
			{
				source = {
					File = "/Users/gavin/.config/.background.jpg", -- Make sure this file exists!
				},
				opacity = 0.3,
				hsb = {
					hue = 1.0,
					saturation = 0.8,
					brightness = 1.0,
				},
			},
		}
	end
	window:set_config_overrides(overrides)
end)

-- Keybinding to toggle background
config.keys = {
	{
		key = "B",
		mods = "CTRL|SHIFT",
		action = wezterm.action.EmitEvent("toggle-background"),
	},
}

return config
