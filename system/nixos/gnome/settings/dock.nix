{
  dconf.settings."org/gnome/shell" = {
    favorite-apps = [
      "org.gnome.Nautilus.desktop"
      "google-chrome.desktop"
      "code.desktop"
      "1password.desktop"
    ];
  };

  dconf.settings."org/gnome/shell/extensions/dash-to-dock" = {
    # Position and size
    dock-position = "BOTTOM";
    dock-fixed = false;
    dash-max-icon-size = 54;

    # Launchers
    show-trash = false;
    show-mounts = false;

    # Behavior
    scroll-action = "do-nothing";
    click-action = "focus-minimize-or-previews";
    intellihide-mode = "ALL_WINDOWS";
    hot-keys = false;

    # Appearance
    custom-theme-shrink = true;
    running-indicator-style = "DOTS";
    transparency-mode = "FIXED";
    background-opacity = 1.0;
    custom-background-color = false;
    background-color = "#1e1e2e";
    disable-overview-on-startup = true;
  };
}
