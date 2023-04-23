{ pkgs, ... }:

let
  extensions = with pkgs.gnomeExtensions; [
    appindicator
    dash-to-dock
    gtk-title-bar
    hide-universal-access
    pop-shell
    rounded-window-corners
    user-themes
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
