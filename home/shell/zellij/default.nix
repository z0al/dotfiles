{ pkgs-unstable, theme, ... }:

{
  programs = {
    zellij = {
      enable = true;
      package = pkgs-unstable.zellij;

      settings = {
        inherit theme;

        default_mode = "locked";
        pane_frames = false;
        copy_on_select = false;
      };
    };

    # Bash
    bash.initExtra = ''
      if [ -n "$ZELLIJ" ]; then
        zellij
      fi
    '';

    # Fish
    fish.shellInit = ''
      if set -q ZELLIJ
      else
        zellij
      end
    '';
  };

  home.file = {
    ".config/zellij/themes" = {
      recursive = true;
      source = ./themes;
    };

    ".config/zellij/layouts" = {
      recursive = true;
      source = ./layouts;
    };
  };
}
