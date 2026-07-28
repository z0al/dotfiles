{ lib, ... }:

{
  options.fonts = with lib; {
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
    fonts.mono = "JetBrains Mono";
    fonts.symbol = "Symbols Nerd Font Mono";
    fonts.emoji = "Noto Color Emoji";
  };
}
