local wz = require("wezterm")
local act = wz.action

local config = {
	-- Font
	font = wz.font_with_fallback({
		"JetBrains Mono",

		-- For Symbols
		{ family = "Symbols Nerd Font Mono", scale = 0.75 },
		{ family = "PowerlineSymbols", scale = 0.75 },
		{ family = "Noto Color Emoji", scale = 0.75 },
	}),

	font_size = 11.0,
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

	-- https://sw.kovidgoyal.net/kitty/keyboard-protocol/
	enable_kitty_keyboard = true,

	-- Window
	window_padding = {
		left = "0cell",
		right = "0cell",
		top = "0cell",
		bottom = "0cell",
	},

	window_close_confirmation = "NeverPrompt",

	-- Tabs
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,

	-- Linux
	enable_wayland = true,

	-- Keybindings
	disable_default_key_bindings = true,
	keys = {
		-- Copy
		{
			key = "c",
			mods = "CTRL",
			action = wz.action_callback(function(win, pane)
				local has_selection = win:get_selection_text_for_pane(pane) ~= ""

				if has_selection then
					win:perform_action(
						wz.action({
							CopyTo = "Clipboard",
						}),
						pane
					)
					win:perform_action("ClearSelection", pane)
				else
					win:perform_action(
						wz.action({
							SendKey = { key = "c", mods = "CTRL" },
						}),
						pane
					)
				end
			end),
		},
		{
			key = "c",
			mods = "SHIFT|CTRL",
			action = act.CopyTo("Clipboard"),
		},

		-- Paste
		{
			key = "v",
			mods = "CTRL",
			action = act.PasteFrom("Clipboard"),
		},
		{
			key = "v",
			mods = "SHIFT|CTRL",
			action = act.PasteFrom("Clipboard"),
		},

		-- Delete a word
		{
			key = "Backspace",
			mods = "CTRL",
			-- Relies on \b being configured to delete a word in the shell
			action = act.SendString("\b"),
		},

		-- Zoom In/Out
		{
			key = "+",
			mods = "CTRL",
			action = act.IncreaseFontSize,
		},
		{
			key = "+",
			mods = "SHIFT|CTRL",
			action = act.IncreaseFontSize,
		},
		{
			key = "-",
			mods = "CTRL",
			action = act.DecreaseFontSize,
		},
		{
			key = "_",
			mods = "SHIFT|CTRL",
			action = act.DecreaseFontSize,
		},
		{
			key = "0",
			mods = "CTRL",
			action = act.ResetFontSize,
		},

		-- Tabs
		{
			key = "t",
			mods = "SHIFT|CTRL",
			action = act.SpawnTab("CurrentPaneDomain"),
		},
		{
			key = "w",
			mods = "SHIFT|CTRL",
			action = act.CloseCurrentTab({
				confirm = false,
			}),
		},
		{
			key = "Tab",
			mods = "CTRL",
			action = act.ActivateTabRelative(1),
		},
		{
			key = "Tab",
			mods = "SHIFT|CTRL",
			action = act.ActivateTabRelative(-1),
		},

		-- New Window
		{
			key = "n",
			mods = "SHIFT|CTRL",
			action = act.SpawnWindow,
		},
	},
}

-- MacOS overrides
if string.match(wz.target_triple, "apple") then
	config.font_size = 13.0

	-- 	Use Command instead of Ctrl on MacOS
	-- 	for k, v in pairs(config.keys) do
	-- 		v.mods = string.gsub(v.mods, "CTRL", "CMD")
	-- 	end
end

return config
