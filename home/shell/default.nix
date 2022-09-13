{ config, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./bat.nix
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


