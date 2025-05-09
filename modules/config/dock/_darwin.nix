{ config, ... }:

let
  cfg = config.d.dock;
in

{
  plist.dock = {
    position = cfg.position;
    autoHide.enable = cfg.autoHide;
    showRecentApps = false;
    minimize.effect = "scale";
    minimize.toApplicationIcon = true;
  };

  system.defaults.dock = {
    # Whether to display the appswitcher on all displays or only the
    # main one. The default is false.
    appswitcher-all-displays = true;

    # Whether to group windows by application in Mission Control’s
    # Exposé. The default is true.
    expose-group-apps = true;

    # Hot corner actions. Valid values include:
    #   1: Disabled
    #   2: Mission Control
    #   3: Application Windows
    #   4: Desktop
    #   5: Start Screen Saver
    #   6: Disable Screen Saver
    #   7: Dashboard
    #   10: Put Display to Sleep
    #   11: Launchpad
    #   12: Notification Center
    #   13: Lock Screen
    #   14: Quick Note
    wvous-bl-corner = 1;
    wvous-br-corner = 1;
    wvous-tl-corner = 1;
    wvous-tr-corner = 1;
  };
}

