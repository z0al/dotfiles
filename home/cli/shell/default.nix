{ pkgs, lib, ... }:

let
  inherit (lib) mkIf;
  inherit (pkgs.stdenv) isLinux;
in

{
  imports = [
    ./fish.nix
  ];

  home.sessionVariables = {
    EDITOR = "hx";
    BROWSER = "brave";
  };

  home.shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";

    clear = "tput reset";
    grep = "rg";
    mkdir = "mkdir -p";
    open = mkIf isLinux "xdg-open &> $HOME/.xdg-open.log";
    xargs = mkIf isLinux "xargs -r";
  };
}
