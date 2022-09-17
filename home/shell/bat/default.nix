{ config, pkgs, ... }:

{
  home.shellAliases = {
    "cat" = "bat";
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "Catppuccin-mocha";
    };
  };

  home.file.".config/bat/themes" = {
    recursive = true;
    source = ./themes;
    onChange = "bat cache --build";
  };
}
