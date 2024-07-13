{ pkgs, ... }:

{
  home.packages = with pkgs.latest; [
    python3
    python3.pkgs.pip
    black
  ];
}
