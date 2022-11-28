{ pkgs, ... }:

{
  imports = [
    ./git.nix
    ./neovim
    ./node.nix
    ./vscode
  ];

  home.packages = with pkgs; [
    nixpkgs-fmt
    nodePackages_latest.prettier
  ];
}
