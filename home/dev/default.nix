{ pkgs, ... }:

{
  imports = [
    ./node.nix
    ./react-native.nix
  ];

  # Globally installed dev tools
  home.packages = with pkgs; [
    nixpkgs-fmt
    stylua
  ];
}
