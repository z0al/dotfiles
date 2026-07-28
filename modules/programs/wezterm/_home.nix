{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfgFonts = config.fonts;

  mkLua = lib.generators.mkLuaInline;

  mod = if pkgs.stdenv.isDarwin then "CMD" else "CTRL";

  actions = {
    copy = mkLua "wezterm.action.CopyTo 'Clipboard'";
    paste = mkLua "wezterm.action.PasteFrom 'Clipboard'";
  };
in

{
  config = {
    programs.wezterm = {
      enable = lib.mkDefault true;

      settings = {
        # Fonts
        font_size = cfgFonts.size;
        font = mkLua ''
          wezterm.font_with_fallback {
            "${cfgFonts.mono}",
            "${cfgFonts.symbol}",
            "${cfgFonts.emoji}",
          }
        '';

        allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace";
        adjust_window_size_when_changing_font_size = false;
        warn_about_missing_glyphs = false;

        # Colors
        color_scheme = "Poimandres";

        # Cursor
        default_cursor_style = "BlinkingBlock";
        cursor_blink_ease_in = "Constant";
        cursor_blink_ease_out = "Constant";
        cursor_blink_rate = 500;

        scrollback_lines = 100000;

        # https://sw.kovidgoyal.net/kitty/keyboard-protocol/
        # https://github.com/wezterm/wezterm/issues/6982
        enable_kitty_keyboard = false;

        # Window
        enable_wayland = false;
        window_padding = {
          left = "5pt";
          right = "5pt";
          top = "2pt";
          bottom = "2pt";
        };

        window_close_confirmation = "NeverPrompt";
        window_decorations = "TITLE | RESIZE | MACOS_USE_BACKGROUND_COLOR_AS_TITLEBAR_COLOR";

        # Tabs
        use_fancy_tab_bar = false;
        hide_tab_bar_if_only_one_tab = true;

        # Keys
        disable_default_key_bindings = false;
        keys = lib.flatten [
          [
            # Copy
            {
              key = "Insert";
              mods = "CTRL";
              action = actions.copy;
            }

            {
              key = "c";
              mods = "${mod}|SHIFT";
              action = actions.copy;
            }

            # Paste
            {
              key = "Insert";
              mods = "SHIFT";
              action = actions.paste;
            }

            {
              key = "v";
              mods = "${mod}|SHIFT";
              action = actions.paste;
            }

            # Command palette
            {
              key = "p";
              mods = "${mod}|SHIFT";
              action = mkLua "wezterm.action.ActivateCommandPalette";
            }

            # Clear screen
            {
              key = "l";
              mods = mod;
              action = mkLua ''
                wezterm.action.Multiple {
                  wezterm.action.ClearScrollback 'ScrollbackAndViewport',
                  wezterm.action.SendKey { key = 'L', mods = 'CTRL' },
                }
              '';
            }

            # Windows
            {
              key = "n";
              mods = mod;
              action = mkLua "wezterm.action.SpawnWindow";
            }

            # Tabs
            {
              key = "t";
              mods = mod;
              action = mkLua "wezterm.action.SpawnTab 'DefaultDomain'";
            }

            {
              key = "w";
              mods = mod;
              action = mkLua "wezterm.action.CloseCurrentTab { confirm = true }";
            }

            {
              key = "Tab";
              mods = "CTRL";
              action = mkLua "wezterm.action.ActivateTabRelative(1)";
            }

            {
              key = "1";
              mods = mod;
              action = mkLua "wezterm.action.ActivateTab(0)";
            }

            {
              key = "2";
              mods = mod;
              action = mkLua "wezterm.action.ActivateTab(1)";
            }

            {
              key = "3";
              mods = mod;
              action = mkLua "wezterm.action.ActivateTab(2)";
            }

            {
              key = "4";
              mods = mod;
              action = mkLua "wezterm.action.ActivateTab(3)";
            }

            {
              key = "5";
              mods = mod;
              action = mkLua "wezterm.action.ActivateTab(4)";
            }

            {
              key = "6";
              mods = mod;
              action = mkLua "wezterm.action.ActivateTab(5)";
            }

            {
              key = "7";
              mods = mod;
              action = mkLua "wezterm.action.ActivateTab(6)";
            }

            {
              key = "8";
              mods = mod;
              action = mkLua "wezterm.action.ActivateTab(7)";
            }

            {
              key = "9";
              mods = mod;
              action = mkLua "wezterm.action.ActivateTab(-1)";
            }

            # Zoom
            {
              key = "=";
              mods = mod;
              action = mkLua "wezterm.action.IncreaseFontSize";
            }

            {
              key = "-";
              mods = mod;
              action = mkLua "wezterm.action.DecreaseFontSize";
            }

            {
              key = "0";
              mods = mod;
              action = mkLua "wezterm.action.ResetFontSize";
            }

            # Minimize
            {
              key = "m";
              mods = mod;
              action = mkLua "wezterm.action.Hide";
            }

            # Quit
            {
              key = "q";
              mods = mod;
              action = mkLua "wezterm.action.QuitApplication";
            }
          ]

          (lib.optionals pkgs.stdenv.isDarwin [
            {
              key = "c";
              mods = mod;
              action = actions.copy;
            }

            {
              key = "v";
              mods = mod;
              action = actions.paste;
            }

            {
              key = "h";
              mods = mod;
              action = mkLua "wezterm.action.HideApplication";
            }
          ])
        ];
      };
    };
  };
}
