{ config, pkgs, ... }:
let
  extensionPkgs = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.pop-shell
    gnomeExtensions.user-themes
  ];
in
{
  # Install packages
  home.packages = extensionPkgs;

  ## from GitHub
  home.file.".local/share/gnome-shell/extensions/rounded-window-corners@yilozt" = {
    recursive = true;
    source = pkgs.fetchzip {
      url = "https://github.com/yilozt/rounded-window-corners/releases/download/v7/rounded-window-corners@yilozt.shell-extension.zip";
      sha256 = "Qu4yB9woCHr+orW0Qqz3MOfxG1WjEFMLGpSZxngU+hs=";
      stripRoot = false;
    };
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

  ## Blur my shell
  dconf.settings."org/gnome/shell/extensions/blur-my-shell" = {
    panel-blur = true;
    overview-blur = true;
    dash-to-dock-blur = false;
    applications-blur = false;
    lockscreen-blur = false;
    screenshot-blur = false;
    window-list-blur = false;
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
    background-opacity = 0.40;
    custom-background-color = true;
    background-color = "rgb(36,21,49)";
  };

  ## Rounded Window Corners
  dconf.settings."org/gnome/shell/extensions/rounded-window-corners" = {
    skip-libadwaita-app = true;
    skip-libhandy-app = true;

    # Not supported by the dconf module
    # global-rounded-corner-settings = [
    #   { padding = { left = 1; right = 1; top = 1; bottom = 1; }; }
    #   { keep_rounded_corners = { maximized = false; fullscreen = false; }; }
    #   { border_radius = 8; }
    #   { smoothing = 1; }
    # ];
  };

  ## Pop Shell
  dconf.settings."org/gnome/shell/extensions/pop-shell" = {
    tile-by-default = true;
    show-title = true;
    gap-outer = 2;
  };
}
