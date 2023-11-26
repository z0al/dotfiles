{
  system.defaults.dock = {
    # Whether to automatically hide and show the dock. The default
    # is false.
    autohide = true;

    # Position of the dock on screen. Must be one of “bottom”, “left”,
    # or “right”. The default is “bottom”
    orientation = "bottom";

    # Size of the icons in the dock. The default is 64.
    tilesize = 64;

    # Show recent applications in the dock. The default is true.
    show-recents = false;

    # Whether to display the appswitcher on all displays or only the
    # main one. The default is false.
    appswitcher-all-displays = true;

    # Whether to group windows by applic ation in Mission Control’s
    # Exposé. The default is true.
    expose-group-by-app = true;

    # Whether to minimize windows into their application icon. The
    # default is false.
    minimize-to-application = true;

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
