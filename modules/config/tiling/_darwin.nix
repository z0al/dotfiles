let
  mod = "ctrl-alt-cmd";
in

{
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
        "${mod}-h" = "focus left";
        "${mod}-j" = "focus down";
        "${mod}-k" = "focus up";
        "${mod}-l" = "focus right";

        "${mod}-up" = "focus up";
        "${mod}-down" = "focus down";
        "${mod}-left" = "focus left";
        "${mod}-right" = "focus right";

        "${mod}-shift-h" = "move left";
        "${mod}-shift-j" = "move down";
        "${mod}-shift-k" = "move up";
        "${mod}-shift-l" = "move right";

        "${mod}-shift-up" = "move up";
        "${mod}-shift-down" = "move down";
        "${mod}-shift-left" = "move left";
        "${mod}-shift-right" = "move right";

        # Toggle layouts
        "${mod}-s" = "layout accordion tiles";
        "${mod}-o" = "layout horizontal vertical";
        "${mod}-y" = "layout tiles accordion";
        "${mod}-g" = "layout tiling floating";
        "${mod}-x" = "swap --wrap-around dfs-next";

        "${mod}-m" = "fullscreen";

        "${mod}-1" = "workspace 1";
        "${mod}-2" = "workspace 2";
        "${mod}-3" = "workspace 3";
        "${mod}-4" = "workspace 4";
        "${mod}-5" = "workspace 5";
        "${mod}-0" = "workspace 10";

        "${mod}-shift-1" = [
          "move-node-to-workspace 1"
          "workspace 1"
        ];
        "${mod}-shift-2" = [
          "move-node-to-workspace 2"
          "workspace 2"
        ];
        "${mod}-shift-3" = [
          "move-node-to-workspace 3"
          "workspace 3"
        ];
        "${mod}-shift-4" = [
          "move-node-to-workspace 4"
          "workspace 4"
        ];
        "${mod}-shift-5" = [
          "move-node-to-workspace 5"
          "workspace 5"
        ];
        "${mod}-shift-0" = [
          "move-node-to-workspace 10"
          "workspace 10"
        ];

        "${mod}-shift-c" = "reload-config";
        "${mod}-r" = "mode resize";
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

      on-window-detected = [
        {
          "if".app-name-regex-substring = "chrome|firefox|safari|brave";
          run = [ "move-node-to-workspace 1" ];
        }

        {
          "if".app-name-regex-substring =
            "code|cursor|zed|wezterm|ghostty|terminal";
          run = [ "move-node-to-workspace 2" ];
        }

        {
          "if".app-name-regex-substring = "obsidian|slack";
          run = [ "move-node-to-workspace 3" ];
        }

        {
          "if".app-name-regex-substring = "zoom";
          run = [ "move-node-to-workspace 10" ];
        }
      ];

      workspace-to-monitor-force-assignment = {
        "1" = "main";
        "2" = "main";
        "3" = "main";
        "4" = "main";
        "5" = "main";
        "10" = [
          "secondary"
          "main"
        ];
      };
    };
  };

  system.defaults.CustomUserPreferences = {
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
}
