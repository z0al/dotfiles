{ config, pkgs, ... }:

{
  home.shellAliases = {
    z = "__zoxide_zi";
  };

  programs.zoxide = {
    enable = true;
    options = [ "--no-cmd" ];

    enableBashIntegration = true;
    enableFishIntegration = true;
  };
}
