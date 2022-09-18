{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./bat
    ./fzf
    ./terminal
    ./zellij
    ./bash.nix
    ./fish.nix
    ./localrc.nix
    ./starship.nix
    ./zap.nix
  ];

  home.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";

    open = "xdg-open &>/dev/null";
    mkdir = "mkdir -p";
  };
}


