{ config, pkgs, ... }:

{
  home.shellAliases = {
    g = "__zoxide_zi";
  };

  programs.zoxide = {
    enable = true;
    options = [
      "--no-cmd"
    ];

    enableBashIntegration = true;
    enableFishIntegration = true;
  };
}
