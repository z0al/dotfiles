{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.fonts;
in

{
  options.d.fonts = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    mono = mkOption {
      type = types.enum [
        "Cascadia Code"
        "Fira Code"
        "JetBrains Mono"
      ];

      default = "JetBrains Mono";
    };
  };

  config = mkIf cfg.enable {
    fonts = {
      packages = with pkgs.latest; [
        cascadia-code
        fira-code
        jetbrains-mono
        powerline-symbols
        noto-fonts-color-emoji
        (nerdfonts.override {
          fonts = [
            "NerdFontsSymbolsOnly"
          ];
        })
      ];
    };
  };
}
