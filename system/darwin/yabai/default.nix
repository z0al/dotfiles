{
  # brew services start yabai
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

  d.hm = [{
    xdg.configFile = {
      "yabai/yabairc" = {
        executable = true;
        source = ./yabairc;
        onChange = "/opt/homebrew/bin/yabai --restart-service";
      };
    };
  }];
}
