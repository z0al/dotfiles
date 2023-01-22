{ pkgs, ... }:

{
  home.packages = [
    (pkgs.writeScriptBin "up" (builtins.readFile ../../bin/up))
  ];
}
