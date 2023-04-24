{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = mkUint32 10;
      workspace-names = [
        "1: web"
        "2: dev"
        "3: social"
        "4"
        "5"
        "6"
        "7"
        "8"
        "9"
        "10. fun"
      ];
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = mkVariant false;
    };

    "org/gnome/shell/extensions/space-bar/behavior" = {
      show-empty-workspaces = mkVariant false;
      position = "right";
      position-index = mkUint32 0;
      scroll-wheel = "disabled";
      smart-workspace-names = mkVariant false;
    };
    "org/gnome/shell/extensions/space-bar/appearance" = {
      workspaces-bar-padding = mkUint32 12;
      workspace-margin = mkUint32 4;
      active-workspace-text-color = "rgb(0,0,0)";
      active-workspace-background-color =
        "rgb(187,160,232)";
      inactive-workspace-border-radius = mkUint32 4;
      inactive-workspace-font-weight = "700";
      inactive-workspace-background-color = "rgba(255,255,255,0.0)";
      inactive-workspace-text-color = "rgb(192,191,188)";
    };
    "org/gnome/shell/extensions/space-bar/shortcuts" = {
      enable-activate-workspace-shortcuts = mkVariant false;
      enable-move-to-workspace-shortcuts = mkVariant false;
      activate-empty-key = [ ];
      activate-previous-key = [ ];
      open-menu = [ ];
    };
  };
}
