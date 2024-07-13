{ pkgs, theme, ... }:

{
  d.shell.aliases = {
    "cat" = "bat";
  };

  programs.bat = {
    enable = true;
    package = pkgs.latest.bat;
    config = {
      inherit theme;
      style = "plain";
    };
  };

  home.file.".config/bat/themes" = {
    recursive = true;
    source = ./themes;
    onChange = "${pkgs.bat}/bin/bat cache --build";
  };
}
