{ config, lib, ... }:

let
  cfg = config.dot.programs.docker-cli;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [ "docker-desktop" ];
  };
}
