{ pkgs, ... }:

{
  imports = [
    ./neovim
    ./vscode
    ./node.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    nixpkgs-fmt
  ];
}
