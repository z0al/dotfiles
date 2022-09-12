{ config, pkgs, ... }:

{
  home.shellAliases = {
    open  = "xdg-open &>/dev/null";
  };

  programs.fish = {
    enable = true;

    shellInit =
      ''
      # Disable greeting message
      set -U fish_greeting

      # Bind CTRL+Backspace to delete a word
      bind \b backward-kill-word
      '';

    shellAbbrs = {
      ".."  = "cd ..";
      "..." = "cd ../..";
    };

    functions = {
      mkd = "mkdir -p $argv && cd $argv";
    };

    # Move these to their own modules e.g. ./fzf.nix & z.nix
    plugins = [
      {
        name  = "fzf";
        src   = pkgs.fetchFromGitHub {
          owner   = "PatrickF1";
          repo    = "fzf.fish";
          rev     = "v9.1";
          sha256  = "OLmPtgUVX+/uiZg6lMl1xF4MHGVZUpTVota68coexWw=";
        };
      }

      {
        name  = "z";
        src   = pkgs.fetchFromGitHub {
          owner   = "jethrokuan";
          repo    = "z";
          rev     = "85f863f20f24faf675827fb00f3a4e15c7838d76";
          sha256  = "+FUBM7CodtZrYKqU542fQD+ZDGrd2438trKM0tIESs0=";
        };
      }
    ];
  };
}
