{ config, lib, ... }:

let
  cfg = config.d.programs.wezterm;
  fonts = config.d.style.fonts;

  mkLua = lib.generators.mkLuaInline;
in

{
  config.d.programs.wezterm = lib.mkIf cfg.enable {
    settings = {
      # Fonts
      font_size = fonts.size;
      font = mkLua ''
        wz.font_with_fallback {
          "${fonts.mono}",
          { family = "${fonts.symbol}", scale = 0.8 },
          { family = "${fonts.emoji}", scale = 0.8 },
        }
      '';

      allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace";
      adjust_window_size_when_changing_font_size = false;
      warn_about_missing_glyphs = false;

      front_end = "WebGpu";
      webgpu_power_preference = "HighPerformance";

      # Colors
      color_scheme = cfg.theme;

      # Cursor
      default_cursor_style = "BlinkingBlock";
      cursor_blink_ease_in = "Constant";
      cursor_blink_ease_out = "Constant";
      cursor_blink_rate = 500;

      scrollback_lines = 100000;

      # https://sw.kovidgoyal.net/kitty/keyboard-protocol/
      enable_kitty_keyboard = true;

      # Window
      enable_wayland = false;
      window_padding = {
        left = "0cell";
        right = "0cell";
        top = "0cell";
        bottom = "0cell";
      };

      window_close_confirmation = "NeverPrompt";
      window_decorations = "TITLE | RESIZE";

      # Tabs
      use_fancy_tab_bar = false;
      hide_tab_bar_if_only_one_tab = true;
    };
  };
}
