{ pkgs, lib, theme, ... }:

let
  wzTheme = builtins.replaceStrings [ "-" ] [ " " ] theme;
  config = builtins.replaceStrings
    [ "$WZ_THEME" ] [ wzTheme ]
    (lib.readFile ./config.lua);
in

{
  home.sessionVariables = {
    TERMINAL = "wezterm";
  };

  home.packages = with pkgs; [
    wezterm
  ];

  xdg.configFile."wezterm/wezterm.lua".text = config;
}
