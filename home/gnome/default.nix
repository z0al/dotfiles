{
  imports = [
    ./extensions
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

    # Use Dark mode for Legacy apps
    theme = {
      name = "Adwaita-dark";
    };
  };
}
