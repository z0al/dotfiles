local wz = require("wezterm")
local act = wz.action

local config = {
	-- Font
	font = wz.font_with_fallback({
		"JetBrains Mono",

		-- For Symbols
		{ family = "Symbols Nerd Font Mono", scale = 0.8 },
		{ family = "PowerlineSymbols", scale = 0.8 },
		{ family = "Noto Color Emoji", scale = 0.8 },
	}),

	font_size = 13.0,
	allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
	adjust_window_size_when_changing_font_size = false,
	warn_about_missing_glyphs = false,

	-- Colors
	color_scheme = "@d.theme@",

	-- Cursor
	default_cursor_style = "BlinkingBlock",
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 500,

	scrollback_lines = 10000,

	-- https://sw.kovidgoyal.net/kitty/keyboard-protocol/
	enable_kitty_keyboard = true,

	-- Window
	enable_wayland = false,
	window_padding = {
		left = "0cell",
		right = "0cell",
		top = "0cell",
		bottom = "0cell",
	},

	window_close_confirmation = "NeverPrompt",
	window_decorations = "RESIZE",

	-- Tabs
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,

	-- Keybindings
	disable_default_key_bindings = false,
}

-- MacOS overrides
if string.match(wz.target_triple, "apple") then
	config.window_decorations = "TITLE | RESIZE"

	-- 	Use Command instead of Ctrl on MacOS
	-- 	for k, v in pairs(config.keys) do
	-- 		v.mods = string.gsub(v.mods, "CTRL", "CMD")
	-- 	end
end

return config
