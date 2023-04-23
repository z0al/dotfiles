{ pkgs, ... }:

let
  extensions = with pkgs.gnomeExtensions; [
    appindicator
    dash-to-dock
    desktop-icons-ng-ding
    pop-shell
    rounded-window-corners
    user-themes
    gtk-title-bar
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
}
