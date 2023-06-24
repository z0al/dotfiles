{ lib, ... }:

with lib.hm.gvariant;

let
  toWorkspace = w: apps:
    map (name: "${name}.desktop:${toString w}") apps;
in

{
  dconf.settings = {
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 10;
      workspace-names = [
        # "1: web"
        # "2: dev"
        # "3: notes"
        # "4: social"
        # "5"
        # "6"
        # "7"
        # "8"
        # "9"
        # "10: tmp"
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
        "8"
        "9"
        "10"
      ];
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };

    # i3-like workspace indicator
    "org/gnome/shell/extensions/space-bar/behavior" = {
      show-empty-workspaces = false;
      position = "right";
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
      application-list =
        # 1. Web (Browsers)
        (toWorkspace 1 [
          "brave-browser"
          "firefox-devedition"
        ]) ++

        # 2. Dev (Terminals, editors, ..etc)
        (toWorkspace 2 [
          "code"
          "org.gnome.Console"
          "org.wezfurlong.wezterm"
        ]) ++

        # 3. Notes (Obsidian)
        (toWorkspace 3 [
          "obsidian"
        ]) ++

        # 4. Social (Slack, Discord ..etc)
        (toWorkspace 4 [
          "discord"
          "slack"
          "Zoom"
        ]) ++

        # 10. Temporarily access (Spotify, 1Password, Settings ..etc)
        (toWorkspace 10 [
          "1password"
          "bluetooth-sendto"
          "gcm-calibrate"
          "gcm-picker"
          "gnome-applications-panel"
          "gnome-background-panel"
          "gnome-bluetooth-panel"
          "gnome-color-panel"
          "gnome-datetime-panel"
          "gnome-default-apps-panel"
          "gnome-diagnostics-panel"
          "gnome-display-panel"
          "gnome-firmware-security-panel"
          "gnome-info-overview-panel"
          "gnome-keyboard-panel"
          "gnome-location-panel"
          "gnome-microphone-panel"
          "gnome-mouse-panel"
          "gnome-multitasking-panel"
          "gnome-network-panel"
          "gnome-notifications-panel"
          "gnome-online-accounts-panel"
          "gnome-power-panel"
          "gnome-printers-panel"
          "gnome-region-panel"
          "gnome-removable-media-panel"
          "gnome-screen-panel"
          "gnome-search-panel"
          "gnome-sharing-panel"
          "gnome-sound-panel"
          "gnome-system-monitor-kde"
          "gnome-thunderbolt-panel"
          "gnome-universal-access-panel"
          "gnome-usage-panel"
          "gnome-user-accounts-panel"
          "gnome-wacom-panel"
          "gnome-wifi-panel"
          "gnome-wwan-panel"
          "org.gnome.ColorProfileViewer"
          "org.gnome.Evince-previewer"
          "org.gnome.Extensions"
          "org.gnome.Settings"
          "org.gnome.Shell.Extensions"
          "org.gnome.tweaks"
          "spotify"
        ]);
    };
  };
}
