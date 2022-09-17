{ config, pkgs, ... }:
let
  profile = import ./profile.nix;
in

{
  imports = [
    ./themes/catppuccin.nix
  ];

  programs.gnome-terminal = {
    enable = true;

    themeVariant = "dark";
    showMenubar = false;

    profile."${profile}" = {
      visibleName = "By home-manager";
      default = true;

      font = "FiraCode Nerd Font 10";
      cursorShape = "block";
      cursorBlinkMode = "on";

      scrollOnOutput = true;
      showScrollbar = false;
      scrollbackLines = 10000;


      loginShell = false;
      audibleBell = false;
    };
  };
}
