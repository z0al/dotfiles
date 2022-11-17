{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fnm
  ];

  home.shellAliases = {
    "nvm" = "fnm";
  };
}
