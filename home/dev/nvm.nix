{ pkgs-unstable, ... }:

{
  home.packages = with pkgs-unstable; [
    fnm
  ];

  home.shellAliases = {
    "nvm" = "fnm";
  };
}
