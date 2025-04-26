{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.ghostty;
  fonts = config.d.style.fonts;

  format = pkgs.formats.keyValue {
    listsAsDuplicateKeys = true;
  };

  mod = if pkgs.stdenv.isDarwin then "cmd" else "ctrl";

  bindKey = key:
    lib.replaceStrings [ "-" "mod" ] [ "+" mod ] key;

  pairToList = conf:
    lib.mapAttrsToList (key: value: "${bindKey key}=${value}") conf;
in

{
  options.d.programs.ghostty = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };

    theme = mkOption {
      type = types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    my.hm.config.xdg.configFile."ghostty/config" = {
      source = format.generate "ghostty" {
        theme = cfg.theme;

        font-family = [
          fonts.mono
          fonts.symbol
          fonts.emoji
        ];

        font-size = fonts.size;

        window-padding-x = 5;
        window-padding-y = 2;
        window-padding-balance = true;
        window-padding-color = "extend";

        scrollback-limit = 100000;
        confirm-close-surface = false;

        macos-option-as-alt = true;
        macos-titlebar-style = "tabs";

        auto-update = "off";

        keybind = pairToList {
          ctrl-insert = "copy_to_clipboard";
          mod-shift-c = "copy_to_clipboard";

          shift-insert = "paste_from_clipboard";
          mod-shift-v = "paste_from_clipboard";
        };
      };
    };
  };
}
