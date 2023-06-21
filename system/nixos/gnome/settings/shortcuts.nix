{ pkgs, lib, ... }:

let
  # Custom shortcuts
  shortcuts = [
    {
      name = "Terminal";
      command = "${pkgs.wezterm}/bin/wezterm";
      binding = "<Super>Return";
    }
    {
      name = "Launcher";
      command = "${pkgs.rofi}/bin/rofi -show drun";
      binding = "<Super>d";
    }
    {
      name = "Sleep";
      command = "${pkgs.systemd}/bin/systemctl suspend";
      binding = "<Control><Super>z";
    }
  ];

  customPrefix = "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings";

  customKeybindings = map
    (sh: "/${customPrefix}/${sh.name}/")
    shortcuts;

  customSettings = lib.listToAttrs (map
    (sh: { name = "${customPrefix}/${sh.name}"; value = sh; })
    shortcuts);
in

{
  dconf.settings = customSettings // {
    "org/gnome/desktop/wm/keybindings" = {
      activate-window-menu = [ ];
      begin-move = [ ];
      begin-resize = [ ];
      close = [ "<Super>q" ];
      cycle-group = [ ];
      cycle-group-backward = [ ];
      cycle-panels = [ ];
      cycle-panels-backward = [ ];
      cycle-windows = [ ];
      cycle-windows-backward = [ ];
      lower = [ ];
      maximize = [ ];
      maximize-horizontally = [ ];
      maximize-vertically = [ ];
      minimize = [ "<Shift><Super>m" ];
      move-to-monitor-down = [ ];
      move-to-monitor-left = [ ];
      move-to-monitor-right = [ ];
      move-to-monitor-up = [ ];
      move-to-workspace-1 = [ "<Shift><Super>1" "<Shift><Super>KP_1" ];
      move-to-workspace-2 = [ "<Shift><Super>2" "<Shift><Super>KP_2" ];
      move-to-workspace-3 = [ "<Shift><Super>3" "<Shift><Super>KP_3" ];
      move-to-workspace-4 = [ "<Shift><Super>4" "<Shift><Super>KP_4" ];
      move-to-workspace-5 = [ "<Shift><Super>5" "<Shift><Super>KP_5" ];
      move-to-workspace-6 = [ "<Shift><Super>6" "<Shift><Super>KP_6" ];
      move-to-workspace-7 = [ "<Shift><Super>7" "<Shift><Super>KP_7" ];
      move-to-workspace-8 = [ "<Shift><Super>8" "<Shift><Super>KP_8" ];
      move-to-workspace-9 = [ "<Shift><Super>9" "<Shift><Super>KP_9" ];
      move-to-workspace-last = [ "<Shift><Super>0" "<Shift><Super>KP_0" ];
      move-to-workspace-left = [ ];
      move-to-workspace-right = [ ];
      panel-run-dialog = [ "<Alt>F2" ];
      raise = [ ];
      raise-or-lower = [ ];
      show-desktop = [ ];
      switch-applications = [ "<Super>Tab" ];
      switch-applications-backward = [ "<Shift><Super>Tab" ];
      switch-group = [ "<Super>grave" ];
      switch-group-backward = [ "<Shift><Super>grave" ];
      switch-input-source = [ "<Super>space" ];
      switch-input-source-backward = [ "<Shift><Super>space" ];
      switch-panels = [ ];
      switch-panels-backward = [ ];
      switch-to-workspace-1 = [ "<Super>1" "<Super>KP_1" ];
      switch-to-workspace-2 = [ "<Super>2" "<Super>KP_2" ];
      switch-to-workspace-3 = [ "<Super>3" "<Super>KP_3" ];
      switch-to-workspace-4 = [ "<Super>4" "<Super>KP_4" ];
      switch-to-workspace-5 = [ "<Super>5" "<Super>KP_5" ];
      switch-to-workspace-6 = [ "<Super>6" "<Super>KP_6" ];
      switch-to-workspace-7 = [ "<Super>7" "<Super>KP_7" ];
      switch-to-workspace-8 = [ "<Super>8" "<Super>KP_8" ];
      switch-to-workspace-9 = [ "<Super>9" "<Super>KP_9" ];
      switch-to-workspace-last = [ "<Super>0" "<Super>KP_0" ];
      switch-to-workspace-left = [ ];
      switch-to-workspace-right = [ ];
      switch-windows = [ ];
      switch-windows-backward = [ ];
      toggle-fullscreen = [ "F11" ];
      toggle-maximized = [ "<Super>m" ];
      toggle-on-all-workspaces = [ ];
      unmaximize = [ ];
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [ ];
      toggle-tiled-right = [ ];
    };

    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = [ ];
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      calculator = [ ];
      control-center = [ ];
      decrease-text-size = [ ];
      eject = [ ];
      email = [ ];
      help = [ ];
      home = [ ];
      increase-text-size = [ ];
      logout = [ "<Shift><Super>e" ];
      magnifier = [ ];
      magnifier-zoom-in = [ ];
      magnifier-zoom-out = [ ];
      media = [ ];
      mic-mute = [ ];
      next = [ "AudioNext" ];
      on-screen-keyboard = [ ];
      pause = [ ];
      play = [ "AudioPlay" ];
      previous = [ "AudioPrev" ];
      screenreader = [ ];
      screensaver = [ "<Control><Super>q" ];
      search = [ ];
      stop = [ ];
      toggle-contrast = [ ];
      volume-down = [ "AudioLowerVolume" ];
      volume-mute = [ "AudioMute" ];
      volume-up = [ "AudioRaiseVolume" ];
      www = [ ];
      custom-keybindings = customKeybindings;
    };

    "org/gnome/shell/keybindings" = {
      focus-active-notification = [ ];
      open-application-menu = [ ];
      screenshot = [ ];
      screenshot-window = [ ];
      show-screen-recording-ui = [ ];
      show-screenshot-ui = [ ];
      switch-to-application-1 = [ ];
      switch-to-application-2 = [ ];
      switch-to-application-3 = [ ];
      switch-to-application-4 = [ ];
      switch-to-application-5 = [ ];
      switch-to-application-6 = [ ];
      switch-to-application-7 = [ ];
      switch-to-application-8 = [ ];
      switch-to-application-9 = [ ];
      toggle-application-view = [ ];
      toggle-message-tray = [ ];
      toggle-overview = [ ];
    };
  };
}
