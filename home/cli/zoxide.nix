{ pkgs, ... }:

{
  home.shellAliases = {
    j = "__zoxide_zi";
  };

  programs.zoxide = {
    enable = true;
    package = pkgs.latest.zoxide;
    enableFishIntegration = true;

    options = [ "--no-cmd" ];
  };

  d.fs.persisted = {
    directories = [ ".local/share/zoxide" ];
  };
}
