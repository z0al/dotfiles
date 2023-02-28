{ user, ... }:

{
  # brew services start yabai
  # https://github.com/koekeishiya/yabai/wiki/Installing-yabai-(latest-release)
  homebrew = {
    brews = [
      "yabai"
    ];

    taps = [
      "koekeishiya/formulae"
    ];
  };

  home-manager.users.${user} = {
    xdg.configFile."yabai/yabairc" = {
      executable = true;
      text = ''
        # bsp or stack or float (default: float)
        yabai -m config layout bsp

        # New window spawns to the right if vertical split, or bottom if horizontal split
        yabai -m config window_placement second_child

        # on or off (default: off)
        yabai -m config auto_balance on

        # floating windows are always on top (default: off)
        yabai -m config window_topmost on

        # modify window shadows (default: on, options: on, off, float)
        # example: show shadows only for floating windows
        yabai -m config window_shadow float

        # Set all padding and gaps to 20pt (default: 0)
        yabai -m config top_padding    3
        yabai -m config bottom_padding 3
        yabai -m config left_padding   3
        yabai -m config right_padding  3
        yabai -m config window_gap     3
      '';
    };
  };
}
