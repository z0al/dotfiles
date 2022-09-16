{ config, pkgs, lib, ... }:
let
  extensionPkgs = with pkgs.gnomeExtensions; [
    appindicator
    dash-to-dock
    desktop-icons-ng-ding
    pop-shell
    user-themes
  ];

  fetchExtension = id: version: sha256:
    pkgs.fetchzip {
      inherit sha256;
      stripRoot = false;
      url = "https://extensions.gnome.org/extension-data/${
        builtins.replaceStrings [ "@" ] [ "" ] id
      }.v${builtins.toString version}.shell-extension.zip";
    };
in
{
  # Install packages
  home.packages = extensionPkgs;

  ## Manually installed extensions
  home.file.".local/share/gnome-shell/extensions/rounded-window-corners@yilozt" = {
    recursive = true;
    source = fetchExtension "rounded-window-corners@yilozt" 7 "Qu4yB9woCHr+orW0Qqz3MOfxG1WjEFMLGpSZxngU+hs=";
  };

  # Enable extensions
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;

    enabled-extensions =
      (map (e: e.extensionUuid) extensionPkgs) ++
      [
        "rounded-window-corners@yilozt"
      ];
  };

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

  ## Pop Shell
  dconf.settings."org/gnome/shell/extensions/pop-shell" = {
    tile-by-default = true;
    show-title = true;
    gap-outer = 2;
  };
}
