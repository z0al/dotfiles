{ pkgs, ... }:

{
  imports = [
    ./node.nix
    ./python.nix
    ./react-native.nix
    ./rust.nix
  ];

  # Globally installed dev tools
  home.packages = with pkgs; [
    nixpkgs-fmt
    stylua
    shfmt
  ];
}
