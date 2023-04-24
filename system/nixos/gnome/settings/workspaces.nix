{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 10;
      workspace-names = [
        "1: web"
        "2: dev"
        "3: social"
        "4: notes"
        "5"
        "6"
        "7"
        "8"
        "9"
        "10: tmp"
      ];
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };

    # i3-like workspace indicator
    "org/gnome/shell/extensions/space-bar/behavior" = {
      show-empty-workspaces = false;
      position = "left";
      position-index = 0;
      scroll-wheel = "disabled";
      smart-workspace-names = false;
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
      enable-activate-workspace-shortcuts = false;
      enable-move-to-workspace-shortcuts = false;
      activate-empty-key = [ ];
      activate-previous-key = [ ];
      open-menu = [ ];
    };

    "org/gnome/shell/extensions/auto-move-windows" = {
      application-list = [
        # 1. Web (Browsers)
        "brave-browser.desktop:1"
        "firefox-devedition.desktop:1"

        # 2. Dev (Terminals, editors, ..etc)
        "code.desktop:2"
        "org.gnome.Console.desktop:2"
        "org.wezfurlong.wezterm.desktop:2"

        # 3. Social (Slack, Discord ..etc)

        # 4. Notes (Obsidian)
        "obsidian.desktop:4"

        # 10. Temporarily access (Spotify, 1Password, Settings ..etc)
        "1password.desktop:10"
        "org.gnome.Extensions.desktop:10"
        "org.gnome.Shell.Extensions.desktop:10"
        "spotify.desktop:10"
      ];
    };
  };
}
