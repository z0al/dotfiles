{ config, pkgs, ... }:

{
  dconf = {
    settings = {
      "org/gnome/desktop/interface" = {
        # Use Dark style
        color-scheme = "prefer-dark";

        # Use Dark mode for Legacy apps e.g. Alacritty
        gtk-theme = "Adwaita-dark";
      };
    };
  };
}
