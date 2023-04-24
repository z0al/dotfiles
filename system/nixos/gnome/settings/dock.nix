{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings."org/gnome/shell/extensions/dash-to-dock" = {
    # Position and size
    dock-position = "BOTTOM";
    dock-fixed = mkVariant false;

    # Launchers
    show-trash = mkVariant false;
    show-mounts = mkVariant false;

    # Behavior
    scroll-action = "do-nothing";
    click-action = "focus-minimize-or-previews";
    intellihide-mode = "ALL_WINDOWS";
    hot-keys = mkVariant false;

    # Appearance
    custom-theme-shrink = mkVariant true;
    running-indicator-style = "DOTS";
    transparency-mode = "FIXED";
    background-opacity = 1.0;
    custom-background-color = mkVariant false;
    background-color = "#1e1e2e";
    disable-overview-on-startup = mkVariant true;
  };
}
