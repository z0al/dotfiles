{ pkgs, lib, ... }:

{
  environment.shellAliases = {
    ".." = "../";
    "..." = "../../";
    "...." = "../../../";

    clear = "tput reset";
    mkdir = "mkdir -p";

    open = lib.mkIf pkgs.stdenv.isLinux "xdg-open";
  };
}
