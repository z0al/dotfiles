{ config, pkgs, lib, ... }:

let
  cfg = config.d.windowManager.tiling;

  toTOML = (pkgs.formats.toml { }).generate;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.taps = [
      "nikitabobko/tap"
    ];

    homebrew.casks = [
      "aerospace"
    ];

    my.user.targets.darwin.defaults = {
      # https://nikitabobko.github.io/AeroSpace/guide#a-note-on-mission-control
      "com.apple.dock" = {
        expose-group-apps = true;
      };

      # https://nikitabobko.github.io/AeroSpace/guide#a-note-on-displays-have-separate-spaces
      "com.apple.spaces" = {
        spans-displays = false;
      };

      NSGlobalDomain = {
        # https://nikitabobko.github.io/AeroSpace/goodness#disable-open-animations
        NSAutomaticWindowAnimationsEnabled = false;
      };
    };

    # https://nikitabobko.github.io/AeroSpace/goodness#i3-like-config
    my.user.xdg.configFile = {
      "aerospace/aerospace.toml".source = toTOML "aerospace.toml" {
        start-at-login = true;
        default-root-container-layout = "tiles";
        default-root-container-orientation = "auto";

        # Normalizations eliminate all sorts of weird tree configurations that
        # don't make sense. Enable to use join-with command.
        enable-normalization-flatten-containers = false;
        enable-normalization-opposite-orientation-for-nested-containers = false;

        # Mouse follows focus when focused monitor changes
        on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

        gaps = {
          inner.horizontal = 4;
          inner.vertical = 4;
        };

        mode.main.binding = {
          alt-enter = ''exec-and-forget osascript -e '
            tell application id "com.github.wez.wezterm"
                do script
                activate
            end tell'
          '';

          alt-j = "focus left";
          alt-k = "focus down";
          alt-l = "focus up";
          alt-semicolon = "focus right";

          # alt-up = "focus up";
          # alt-down = "focus down";
          # alt-left = "focus left";
          # alt-right = "focus right";

          alt-shift-j = "move left";
          alt-shift-k = "move down";
          alt-shift-l = "move up";
          alt-shift-semicolon = "move right";

          # alt-shift-up = "move up";
          # alt-shift-down = "move down";
          # alt-shift-left = "move left";
          # alt-shift-right = "move right";

          # Consider using 'join-with' command as a 'split' replacement if you
          # have normalizations enabled.
          alt-h = "split horizontal";
          alt-v = "split vertical";

          # Toggle layouts
          alt-s = "layout v_accordion";
          alt-w = "layout h_accordion";
          alt-e = "layout tiles horizontal vertical";

          alt-shift-space = "layout floating tiling";

          alt-1 = "workspace 1";
          alt-2 = "workspace 2";
          alt-3 = "workspace 3";
          alt-4 = "workspace 4";
          alt-5 = "workspace 5";
          alt-6 = "workspace 6";
          alt-7 = "workspace 7";
          alt-8 = "workspace 8";
          alt-9 = "workspace 9";
          alt-0 = "workspace 10";

          alt-shift-1 = "move-node-to-workspace 1";
          alt-shift-2 = "move-node-to-workspace 2";
          alt-shift-3 = "move-node-to-workspace 3";
          alt-shift-4 = "move-node-to-workspace 4";
          alt-shift-5 = "move-node-to-workspace 5";
          alt-shift-6 = "move-node-to-workspace 6";
          alt-shift-7 = "move-node-to-workspace 7";
          alt-shift-8 = "move-node-to-workspace 8";
          alt-shift-9 = "move-node-to-workspace 9";
          alt-shift-0 = "move-node-to-workspace 10";

          alt-shift-c = "reload-config";
          alt-r = "mode resize";
        };

        mode.resize.binding = {
          h = "resize width -50";
          j = "resize height +50";
          k = "resize height -50";
          l = "resize width +50";

          left = "resize width -50";
          down = "resize height +50";
          up = "resize height -50";
          right = "resize width +50";

          enter = "mode main";
          esc = "mode main";
        };
      };
    };
  };
}


