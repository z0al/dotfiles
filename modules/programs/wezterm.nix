{ config, pkgs, lib, ... }:

let
  cfgFonts = config.d.fonts;
  cfg = config.d.programs.wezterm;

  settings = with lib.generators; (
    toLua { } {
      # Fonts
      font_size = 13.0;
      font = mkLuaInline ''wz.font_with_fallback(${
        (toLua { indent = "  "; } [
          cfgFonts.mono
          { family = cfgFonts.symbol; scale = 0.8; }
          { family = cfgFonts.emoji; scale = 0.8; }
        ])
      })'';

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

      scrollback_lines = 10000;

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

      # Keybindings
      disable_default_key_bindings = false;
    });
in

{
  options.d.programs.wezterm = with lib;{
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    theme = mkOption {
      type = types.str;
      default = "Catppuccin Mocha";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs.unstable; [
      wezterm
    ];

    environment.variables = {
      TERMINAL = "wezterm";
    };

    my.user = {
      xdg.configFile."wezterm/wezterm.lua".text = /* lua */ ''
        local wz = require("wezterm")
        local act = wz.action

        return ${settings}
      '';
    };
  };
}
