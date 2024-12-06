{ config, lib, ... }:

let
  cfg = config.d.windowManager.tiling;

  meh = "ctrl-alt-cmd";
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
          "${meh}-b" = ''
            exec-and-forget open -b "com.google.Chrome"
          '';

          "${meh}-e" = ''
            exec-and-forget open -b "com.microsoft.VSCode"
          '';

          "${meh}-t" = ''
            exec-and-forget open -b "com.github.wez.wezterm"
          '';

          "${meh}-slash" = ''
            exec-and-forget open -b "com.raycast.macos"
          '';

          "${meh}-h" = "focus left";
          "${meh}-j" = "focus down";
          "${meh}-k" = "focus up";
          "${meh}-l" = "focus right";

          "${meh}-up" = "focus up";
          "${meh}-down" = "focus down";
          "${meh}-left" = "focus left";
          "${meh}-right" = "focus right";

          "${meh}-shift-h" = "move left";
          "${meh}-shift-j" = "move down";
          "${meh}-shift-k" = "move up";
          "${meh}-shift-l" = "move right";

          "${meh}-shift-up" = "move up";
          "${meh}-shift-down" = "move down";
          "${meh}-shift-left" = "move left";
          "${meh}-shift-right" = "move right";

          # Toggle layouts
          "${meh}-s" = "layout accordion tiles";
          "${meh}-o" = "layout horizontal vertical";
          "${meh}-y" = "layout tiles accordion";
          "${meh}-g" = "layout tiling floating";
          # https://github.com/nikitabobko/AeroSpace/issues/8
          # "${meh}-x" = "swap";

          "${meh}-m" = "fullscreen";

          "${meh}-1" = "workspace 1";
          "${meh}-2" = "workspace 2";
          "${meh}-3" = "workspace 3";
          "${meh}-4" = "workspace 4";
          "${meh}-5" = "workspace 5";
          "${meh}-6" = "workspace 6";
          "${meh}-7" = "workspace 7";
          "${meh}-8" = "workspace 8";
          "${meh}-9" = "workspace 9";
          "${meh}-0" = "workspace 10";

          "${meh}-shift-1" = [ "move-node-to-workspace 1" "workspace 1" ];
          "${meh}-shift-2" = [ "move-node-to-workspace 2" "workspace 2" ];
          "${meh}-shift-3" = [ "move-node-to-workspace 3" "workspace 3" ];
          "${meh}-shift-4" = [ "move-node-to-workspace 4" "workspace 4" ];
          "${meh}-shift-5" = [ "move-node-to-workspace 5" "workspace 5" ];
          "${meh}-shift-6" = [ "move-node-to-workspace 6" "workspace 6" ];
          "${meh}-shift-7" = [ "move-node-to-workspace 7" "workspace 7" ];
          "${meh}-shift-8" = [ "move-node-to-workspace 8" "workspace 8" ];
          "${meh}-shift-9" = [ "move-node-to-workspace 9" "workspace 9" ];
          "${meh}-shift-0" = [ "move-node-to-workspace 10" "workspace 10" ];

          "${meh}-shift-c" = "reload-config";
          "${meh}-r" = "mode resize";
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
