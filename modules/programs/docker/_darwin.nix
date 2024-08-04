{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.docker;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [ "docker" ];
  };
}
