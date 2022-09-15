{ config, pkgs, ... }:

{
  imports = [
    ./extensions.nix
  ];

  dconf = {
    settings = {
      "org/gnome/desktop/interface" = {
        # Use Dark style
        color-scheme = "prefer-dark";

        # gtk-theme = "Adwaita-dark";
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
