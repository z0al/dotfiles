{
  imports = [
    ./extensions
    ./gtk.nix
  ];

  dconf = {
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        clock-show-date = true;
        clock-show-weekday = true;
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,close";
      };
    };
  };
}
