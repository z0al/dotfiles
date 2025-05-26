{ config, lib, ... }:

let
  cfg = config.my.programs.wezterm;
  cfgFonts = config.my.fonts;

  mkLua = lib.generators.mkLuaInline;
in

{
  config.my.programs.wezterm = lib.mkIf cfg.enable {
    settings = {
      # Fonts
      font_size = cfgFonts.size;
      font = mkLua ''
        wz.font_with_fallback {
          "${cfgFonts.mono}",
          "${cfgFonts.symbol}",
          "${cfgFonts.emoji}",
        }
      '';

      allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace";
      adjust_window_size_when_changing_font_size = false;
      warn_about_missing_glyphs = false;

      # Colors
      color_scheme = cfg.theme;

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
    };
  };
}
