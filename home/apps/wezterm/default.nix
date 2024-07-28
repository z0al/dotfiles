{ pkgs, lib, theme, ... }:

let
  themes = {
    "catppuccin" = "Catppuccin Mocha";
  };

  config = builtins.replaceStrings
    [ "@d.theme@" ] [ themes.${theme} ]
    (lib.readFile ./config.lua);
in

{
  home.sessionVariables = {
    TERMINAL = "wezterm";
  };

  home.packages = with pkgs.latest; [
    wezterm
  ];

  xdg.configFile."wezterm/wezterm.lua".text = config;
}
