{
  # Required changes to system defaults
  # https://github.com/koekeishiya/yabai#requirements-and-caveats
  system.defaults = {
    # Whether to automatically rearrange spaces based on most recent
    # use. The default is true.
    dock.mru-spaces = false;

    # Apple menu > System Preferences > Mission Control > Displays have
    # separate Space
    spaces.spans-displays = false;
  };

  # https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)
  homebrew = {
    brews = [
      {
        name = "yabai";
      }
    ];

    taps = [
      "koekeishiya/formulae"
    ];
  };

  my.user = {
    xdg.configFile = {
      "yabai/yabairc" = {
        executable = true;
        source = ./yabairc;
        onChange = "/opt/homebrew/bin/yabai --restart-service";
      };
    };
  };
}
