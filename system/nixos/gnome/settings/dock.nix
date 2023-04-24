{
  dconf.settings."org/gnome/shell/extensions/dash-to-dock" = {
    # Position and size
    dock-position = "BOTTOM";
    dock-fixed = false;

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
