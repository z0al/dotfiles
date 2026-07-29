{ config, lib, ... }:

let
  cfg = config.my.programs.docker-cli;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [ "docker-desktop" ];
  };
}
