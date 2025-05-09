{ lib, ... }:

{
  imports = [
    ./themes
  ];

  options.d.style = with lib; {
    dark = mkOption {
      type = types.bool;
      default = true;
      description = "Use dark theme";
    };

    theme = mkOption {
      type = types.enum [
        "catppuccin"
        "poimandres"
      ];

      default = "catppuccin";
    };
  };
}

