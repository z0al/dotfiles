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
  d.shell.variables = {
    TERMINAL = "wezterm";
  };

  home.packages = with pkgs; [
    wezterm
  ];

  xdg.configFile."wezterm/wezterm.lua".text = config;
}
