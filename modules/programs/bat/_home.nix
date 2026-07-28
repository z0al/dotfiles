{ pkgs, lib, ... }:

{
  config = {
    home.packages = [ pkgs.bat ];

    home.sessionVariables = {
      BAT_STYLE = "plain";
      BAT_THEME = "base16";
    };

    programs.fish.shellAliases.cat = lib.getExe pkgs.bat;
    programs.bash.shellAliases.cat = lib.getExe pkgs.bat;
  };
}
