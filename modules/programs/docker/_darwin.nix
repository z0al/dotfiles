{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.docker;
in

{
  config = lib.mkIf cfg.enable {
    d.programs.homebrew.casks = [ "docker" ];
  };
}
