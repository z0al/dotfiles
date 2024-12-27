{ pkgs, lib, ... }:

{
  environment.shellAliases = {
    ".." = "cd ../";
    "..." = "cd ../../";
    "...." = "cd ../../../";

    clear = "tput reset";
    mkdir = "mkdir -p";

    open = lib.mkIf pkgs.stdenv.isLinux "xdg-open";
  };
}
