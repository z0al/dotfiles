{ config, lib, ... }:

let
  cfg = config.d.windowManager.tiling;
in

{
  config = lib.mkIf cfg.enable {
    services.aerospace = {
      enable = true;

      settings = {
        default-root-container-layout = "tiles";
        after-startup-command = [ "layout tiles" ];

        gaps = {
          inner.horizontal = 8;
          inner.vertical = 8;
          outer.left = 7;
          outer.bottom = 7;
          outer.top = 7;
          outer.right = 7;
        };

        # https://github.com/pop-os/cosmic-comp/blob/master/data/keybindings.ron
        mode.main.binding = {
          alt-enter = ''
            exec-and-forget open -b "com.github.wez.wezterm"
          '';

          alt-h = "focus left";
          alt-j = "focus down";
          alt-k = "focus up";
          alt-l = "focus right";

          # alt-up = "focus up";
          # alt-down = "focus down";
          # alt-left = "focus left";
          # alt-right = "focus right";

          alt-shift-h = "move left";
          alt-shift-j = "move down";
          alt-shift-k = "move up";
          alt-shift-l = "move right";

          # alt-shift-up = "move up";
          # alt-shift-down = "move down";
          # alt-shift-left = "move left";
          # alt-shift-right = "move right";

          # Toggle layouts
          alt-s = "layout accordion tiles";
          alt-o = "layout horizontal vertical";
          alt-y = "layout tiles accordion";
          alt-g = "layout tiling floating";
          # https://github.com/nikitabobko/AeroSpace/issues/8
          # alt-x = "swap";

          alt-m = "fullscreen";

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

          alt-shift-1 = [ "move-node-to-workspace 1" "workspace 1" ];
          alt-shift-2 = [ "move-node-to-workspace 2" "workspace 2" ];
          alt-shift-3 = [ "move-node-to-workspace 3" "workspace 3" ];
          alt-shift-4 = [ "move-node-to-workspace 4" "workspace 4" ];
          alt-shift-5 = [ "move-node-to-workspace 5" "workspace 5" ];
          alt-shift-6 = [ "move-node-to-workspace 6" "workspace 6" ];
          alt-shift-7 = [ "move-node-to-workspace 7" "workspace 7" ];
          alt-shift-8 = [ "move-node-to-workspace 8" "workspace 8" ];
          alt-shift-9 = [ "move-node-to-workspace 9" "workspace 9" ];
          alt-shift-0 = [ "move-node-to-workspace 10" "workspace 10" ];

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

        # on-window-detected = [
        #   {
        #     "if".app-name-regex-substring = "chrome|firefox|safari";
        #     run = [ "move-node-to-workspace 1" ];
        #   }

        #   {
        #     "if".app-name-regex-substring = "code|wezterm|ghostty|terminal";
        #     run = [ "move-node-to-workspace 2" ];
        #   }

        #   {
        #     "if".app-name-regex-substring = "obsidian|slack";
        #     run = [ "move-node-to-workspace 3" ];
        #   }

        #   {
        #     "if".app-name-regex-substring = "zoom";
        #     run = [ "move-node-to-workspace 10" ];
        #   }
        # ];
      };
    };

    my.hm.config.targets.darwin.defaults = {
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
  };
}
