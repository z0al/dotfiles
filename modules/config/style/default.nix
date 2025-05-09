{ lib, ... }:

{
  imports = [
    ./catppuccin.nix
  ];

  options.d.style = with lib; {
    theme = mkOption {
      type = types.enum [
        "catppuccin"
        "poimandres"
      ];

      default = "catppuccin";
    };
  };
}

