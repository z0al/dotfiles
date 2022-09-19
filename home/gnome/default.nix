{ config, pkgs, ... }:

{
  imports = [
    ./extensions.nix
  ];

  dconf = {
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };

  gtk = {
    enable = true;

    # Use Dark mode for Legacy apps e.g. Alacritty
    theme = {
      name = "Adwaita-dark";
    };
  };
}
