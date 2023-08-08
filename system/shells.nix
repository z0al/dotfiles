{ pkgs, lib, ... }:

let
  inherit (lib) mkIf;
  inherit (pkgs.stdenv) isLinux;
in

{
  environment = {
    shells = [ pkgs.fish ];

    variables = {
      EDITOR = "hx";
      BROWSER = "brave";
    };

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";

      grep = "rg";
      mkdir = "mkdir -p";
      open = mkIf isLinux "xdg-open &> $HOME/.xdg-open.log";
      xargs = mkIf isLinux "xargs -r";
    };
  };

  programs = {
    bash.enableCompletion = true;

    fish.enable = true;
    fish.vendor.completions.enable = true;
    fish.shellAliases = {
      unset = "set -e";
    };

    zsh.enable = true;
    zsh.enableCompletion = true;
  };
}
