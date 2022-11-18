{ pkgs, ... }:

let
  extensions = with pkgs.gnomeExtensions; [
    appindicator
    blur-my-shell
    dash-to-dock
    desktop-icons-ng-ding
    native-window-placement
    pop-shell
    rounded-window-corners
  ];
in

{
  imports = [
    ./blur-my-shell.nix
    ./dash-to-dock.nix
    ./desktop-icons.nix
    ./pop-shell.nix
    ./rounded-window-corners.nix
  ];

  # Install packages
  home.packages = extensions;

  # Enable extensions
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = (map (e: e.extensionUuid) extensions);
  };
}
