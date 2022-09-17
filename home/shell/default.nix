{ config, pkgs, ... }:

{
  imports = [
    ./alacritty
    ./bat
    ./terminal
    ./bash.nix
    ./fish.nix
    ./fzf.nix
    ./localrc.nix
    ./starship.nix
    ./z.nix
  ];

  home.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";

    open = "xdg-open &>/dev/null";
    mkdir = "mkdir -p";
  };
}


