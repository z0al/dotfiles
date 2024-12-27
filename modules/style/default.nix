{ lib, ... }:

{
  options.d.style = with lib; {
    fonts = {
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
  };
}

