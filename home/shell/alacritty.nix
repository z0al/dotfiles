{ config, pkgs, ... }:

{

  home.sessionVariables = {
    TERMINAL = "alacritty";
  };

  programs.alacritty = {
    enable = true;

    settings = {
      window.title = "Terminal";

      font = {
        size = 11;
        normal = {
          family = "FiraCode Nerd Font";
        };
      };

      cursor = {
        style = {
          shape = "Block";
          blinking = "On";
        };
      };

      # Theme Poimandres
      colors = {
        # Default colors
        primary = {
          background = "0x1b1e28";
          foreground = "0xa6accd";
        };

        # Cursor colors
        cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };

        # Search colors
        #
        # Colors used for the search bar and match highlighting.
        search = {
          # Allowed values are "CellForeground"/"CellBackground", which reference the
          # affected cell, or hexadecimal colors like #ff00ff.
          matches = {
            foreground = "0x1b1e28";
            background = "0xadd7ff";
          };

          focused_match = {
            foreground = "0x1b1e28";
            background = "0xadd7ff";
          };

          bar = {
            foreground = "0x1b1e28";
            background = "0xadd7ff";
          };
        };

        # Selection colors
        #
        # Colors which should be used to draw the selection area.
        #
        # Allowed values are "CellForeground"/"CellBackground", which reference the
        # affected cell, or hexadecimal colors like #ff00ff.
        selection = {
          text = "CellForeground";
          background = "0x303340";
        };

        # Vi mode cursor colors
        #
        # Colors for the cursor when the vi mode is active.
        #
        # Allowed values are "CellForeground"/"CellBackground", which reference the
        # affected cell, or hexadecimal colors like #ff00ff.
        vi_mode_cursor = {
          text = "CellBackground";
          cursor = "CellForeground";
        };

        # Normal colors
        normal = {
          black = "0x1b1e28";
          red = "0xd0679d";
          green = "0x5de4c7";
          yellow = "0xfffac2";
          blue = "0x89ddff";
          magenta = "0xfcc5e9";
          cyan = "0xadd7ff";
          white = "0xffffff";
        };

        # Bright colors
        bright = {
          black = "0xa6accd";
          red = "0xd0679d";
          green = "0x5de4c7";
          yellow = "0xfffac2";
          blue = "0xadd7ff";
          magenta = "0xfae4fc";
          cyan = "0x89ddff";
          white = "0xffffff";
        };
      };
    };
  };
}
