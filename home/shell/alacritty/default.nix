{ pkgs-unstable, ... }:

{

  home.sessionVariables = {
    TERMINAL = "alacritty";
  };

  programs.alacritty = {
    enable = true;
    package = pkgs-unstable.alacritty;

    settings = {
      import = [
        "~/.config/alacritty/themes/catppuccin.yml"
      ];

      env = {
        TERM = "xterm-256color";
      };

      window.title = "Terminal";

      font = {
        size = 10;
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
    };
  };

  # Copy themes over to ~/.config/alacritty
  home.file.".config/alacritty/themes" = {
    source = ./themes;
    recursive = true;
  };
}
