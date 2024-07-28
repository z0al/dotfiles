{ pkgs, ... }:

{
  home.packages = with pkgs; [
    python3
    python3.pkgs.pip
    black
  ];
}
