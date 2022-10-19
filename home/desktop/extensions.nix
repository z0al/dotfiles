{ pkgs, pkgs-unstable, ... }:
let
  extensions = with pkgs-unstable.gnomeExtensions; [
    appindicator
    dash-to-dock
    desktop-icons-ng-ding
    native-window-placement
    pop-shell
    rounded-window-corners
  ];
in
{
  # Install packages
  home.packages = extensions;

  # Enable extensions
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = (map (e: e.extensionUuid) extensions);
  };

  # Configurations

  ## Dash to Dock
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

    # Appearance
    custom-theme-shrink = true;
    running-indicator-style = "DOTS";
    transparency-mode = "FIXED";
    background-opacity = 0.60;
    custom-background-color = false;
    background-color = "#000";
    disable-overview-on-startup = true;
  };

  ## Desktop Icons
  dconf.settings."org/gnome/shell/extensions/ding" = {
    icon-size = "standard";
    start-corner = "top-left";
    show-home = false;
    show-trash = false;
    show-volumes = false;
    show-network-volumes = false;
    show-drop-place = true;
    dark-text-in-labels = false;
  };

  ## Pop Shell
  dconf.settings."org/gnome/shell/extensions/pop-shell" = {
    tile-by-default = true;
    show-title = true;
    gap-outer = 1;
  };

  ## Rounded Window Corners
  dconf.settings."org/gnome/shell/extensions/rounded-window-corners" = {
    skip-libadwaita-app = true;
    skip-libhandy-app = true;

    global-rounded-corner-settings = {
      _type = "gvariant";
      type = "";
      value = "{'padding': <{'left': <uint32 1>, 'right': <uint32 1>, 'top': <uint32 1>, 'bottom': <uint32 1>}>, 'keep_rounded_corners': <{'maximized': <false>, 'fullscreen': <false>}>, 'border_radius': <uint32 8>, 'smoothing': <uint32 1>, 'enabled': <true>}";
      __toString = self:
        "@a{sv} ${self.value}";
    };
  };
}
