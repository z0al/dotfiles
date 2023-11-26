{
  system.defaults.finder = {
    # Whether to show icons on the desktop or not. The default is true.
    CreateDesktop = false;

    # Whether to allow quitting of the Finder. The default is false.
    QuitMenuItem = true;

    # Whether to always show hidden files. The default is false.
    AppleShowAllFiles = true;

    # Whether to always show file extensions. The default is false.
    AppleShowAllExtensions = true;

    # Show status bar at bottom of finder windows with item/disk space
    # stats. The default is false.
    ShowStatusBar = true;

    # Whether to show the full POSIX filepath in the window title. The
    # default is false.
    _FXShowPosixPathInTitle = false;

    # Change the default finder view.
    # - “icnv” = Icon view (default)
    # - “Nlsv” = List view
    # - “clmv” = Column View
    # - “Flwv” = Gallery View
    FXPreferredViewStyle = "icnv";

    # Change the default search scope. Use “SCcf” to default to current
    # folder. The default is unset (“This Mac”).
    FXDefaultSearchScope = "SCcf";

    # Whether to show warnings when change the file extension of
    # files. The default is true.
    FXEnableExtensionChangeWarning = false;
  };

  d.hm = [{
    targets.darwin.currentHostDefaults = {
      "com.apple.finder" = {
        DisableAllAnimations = true;
      };
    };
  }];
}
