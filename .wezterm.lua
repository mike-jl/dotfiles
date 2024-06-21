local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

local config = {}
-- config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
-- config.front_end = "OpenGL"
config.font = wezterm.font("JetBrains Mono", { weight = "DemiBold" })
config.font_size = 15
-- config.freetype_render_target = "HorizontalLcd"
config.cell_width = 0.9

config.window_decorations = "RESIZE"
config.tab_bar_at_bottom = true
config.color_scheme = "Catppuccin Mocha"
config.window_frame = {
	-- The font used in the tab bar.
	-- Roboto Bold is the default; this font is bundled
	-- with wezterm.
	-- Whatever font is selected here, it will have the
	-- main font setting appended to it to pick up any
	-- fallback fonts you may have used there.
	font = wezterm.font({ family = "Roboto", weight = "Bold" }),

	-- The size of the font in the tab bar.
	-- Default to 10.0 on Windows but 12.0 on other systems
	font_size = 14.0,

	-- The overall background color of the tab bar when
	-- the window is focused
	active_titlebar_bg = "#1E1E2E",

	-- The overall background color of the tab bar when
	-- the window is not focused
	inactive_titlebar_bg = "#1E1E2E",
}
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 5,
	right = 5,
	top = 5,
	bottom = 5,
}
config.native_macos_fullscreen_mode = true
config.default_prog = { "/opt/homebrew/bin/tmux", "new", "-As0" }
config.window_close_confirmation = "NeverPrompt"
return config
