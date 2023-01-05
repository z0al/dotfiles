{ pkgs, ... }:

{
  imports = [
    ./neovim
    ./vscode
    ./node.nix
    ./gh.nix
    ./git.nix
  ];

  home.packages = with pkgs; [
    nixpkgs-fmt
  ];
}
