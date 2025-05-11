{ pkgs, lib, ... }:

{
  options.my.fonts = with lib; {
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

    my.fonts.size = 13;
    my.fonts.mono = "JetBrains Mono";
    my.fonts.symbol = "Symbols Nerd Font Mono";
    my.fonts.emoji = "Noto Color Emoji";
  };
}
