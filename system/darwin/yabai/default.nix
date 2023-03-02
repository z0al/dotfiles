{ user, ... }:

{
  # brew services start yabai
  # https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)
  homebrew = {
    brews = [
      {
        name = "yabai";
        restart_service = "changed";
      }

      {
        name = "skhd";
        restart_service = "changed";
      }
    ];

    taps = [
      "koekeishiya/formulae"
    ];
  };

  home-manager.users.${user} = {
    xdg.configFile = {
      "yabai/yabairc" = {
        executable = true;
        source = ./yabairc;
      };
      "skhd/skhdrc" = {
        onChange = "/opt/homebrew/bin/skhd -r";
        source = ./skhdrc;
      };
    };
  };
}
