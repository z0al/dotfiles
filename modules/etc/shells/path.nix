{ config, pkgs, lib, ... }:

let
  path = [
    # https://github.com/LnL7/nix-darwin/issues/122
    "/run/current-system/sw/bin"
  ];
in

{
  environment.interactiveShellInit = ''
    export PATH="${lib.concatStringsSep ":" path}:$PATH"
  '';
}


