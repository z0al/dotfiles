{ pkgs, lib, ... }:

{
  options.d.fonts = with lib; {
    size = mkOption {
      type = types.int;
    };

    mono = mkOption {
      type = types.enum [
        "Cascadia Code"
        "Fira Code"
        "JetBrains Mono"
      ];
    };

    symbol = mkOption {
      type = types.enum [
        "Symbols Nerd Font Mono"
      ];
    };

    emoji = mkOption {
      type = types.enum [
        "Noto Color Emoji"
      ];
    };
  };

  config = {
    fonts.packages = with pkgs; [
      cascadia-code
      fira-code
      jetbrains-mono

      nerd-fonts.symbols-only
      noto-fonts-color-emoji
    ];

    d.fonts.size = 13;
    d.fonts.mono = "JetBrains Mono";
    d.fonts.symbol = "Symbols Nerd Font Mono";
    d.fonts.emoji = "Noto Color Emoji";
  };
}
