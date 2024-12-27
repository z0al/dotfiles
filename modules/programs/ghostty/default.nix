{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.ghostty;
  fonts = config.d.style.fonts;

  mod = if pkgs.stdenv.isDarwin then "cmd" else "ctrl";
in

{
  options.d.programs.ghostty = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    theme = mkOption {
      type = types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    # TODO: waiting for https://github.com/NixOS/nixpkgs/pull/368404
    # environment.systemPackages = with pkgs; [
    #   ghostty
    # ];

    my.hm.config.xdg.configFile."ghostty/config".text = ''
      theme = ${cfg.theme}

      font-family = ${fonts.mono}
      font-size = 13

      window-padding-x = 5
      window-padding-y = 0
      window-padding-balance = true

      scrollback-limit = 10000

      confirm-close-surface = false

      macos-option-as-alt = true

      # Keybindings
      keybind = ctrl+insert=copy_to_clipboard
      keybind = ${mod}+shift+c=copy_to_clipboard

      keybind = shift+insert=paste_from_clipboard
      keybind = ${mod}+shift+v=paste_from_clipboard
    '';
  };
}
