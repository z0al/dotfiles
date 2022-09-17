# https://github.com/catppuccin/gnome-terminal
{ config, pkgs, ... }:
let
  profile = import ../profile.nix;
in
{
  programs.gnome-terminal.profile."${profile}" = {
    colors = {
      foregroundColor = "#D7DAE0";
      backgroundColor = "#1E1E2E";
      boldColor = null;
      highlight = null;

      cursor = {
        foreground = "#1E1E2E";
        background = "#F5E0DC";
      };

      palette = [
        "#6E6C7C"
        "#F28FAD"
        "#ABE9B3"
        "#FAE3B0"
        "#96CDFB"
        "#DDB6F2"
        "#F5C2E7"
        "#D9E0EE"
        "#988BA2"
        "#F28FAD"
        "#ABE9B3"
        "#FAE3B0"
        "#96CDFB"
        "#DDB6F2"
        "#F5C2E7"
        "#D9E0EE"
      ];
    };
  };
}
