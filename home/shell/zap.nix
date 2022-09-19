{ pkgs-unstable, ... }:

{
  home.shellAliases = {
    z = "__zoxide_zi";
  };

  programs.zoxide = {
    enable = true;
    package = pkgs-unstable.zoxide;

    options = [ "--no-cmd" ];

    enableBashIntegration = true;
    enableFishIntegration = true;
  };
}
