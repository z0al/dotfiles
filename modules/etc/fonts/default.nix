{ config, pkgs, lib, ... }:

let
  monospace = with pkgs; [
    cascadia-code
    fira-code
    jetbrains-mono
  ];

  symbols = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "NerdFontsSymbolsOnly"
      ];
    })
  ];

  emoji = with pkgs; [
    noto-fonts-color-emoji
  ];
in

{
  options.d.fonts = with lib; {
    mono = mkOption {
      type = types.enum [
        "Cascadia Code"
        "Fira Code"
        "JetBrains Mono"
      ];

      default = "JetBrains Mono";
    };

    symbol = mkOption {
      type = types.enum [
        "Symbols Nerd Font Mono"
      ];

      default = "Symbols Nerd Font Mono";
    };

    emoji = mkOption {
      type = types.enum [
        "Noto Color Emoji"
      ];

      default = "Noto Color Emoji";
    };
  };

  config = {
    fonts.packages = monospace ++ symbols ++ emoji;
  };
}
