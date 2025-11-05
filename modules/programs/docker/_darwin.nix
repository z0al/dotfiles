{ config, lib, ... }:

let
  cfg = config.my.programs.docker;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [ "docker-desktop" ];
  };
}
