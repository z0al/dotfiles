{ config, pkgs, lib, ... }:

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
  };

  config = {
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
