{ pkgs, ... }:

{
  imports = [
    ./node.nix
  ];

  home.packages = with pkgs; [
    android-studio
    nodePackages.expo-cli
    watchman
  ];
}
