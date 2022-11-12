{ pkgs, ... }:

{
  shellAliases = {
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";

    g = "git";
    grep = "rg";
    mkdir = "mkdir -p";
    open = "xdg-open &> $HOME/.xdg-open.log";
  };
}
