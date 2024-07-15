{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.docker;
in

{
  config = lib.mkIf cfg.enable {
    # docker-compose is packaged with 'docker'
    d.programs.homebrew.casks = [ "docker" ];
  };
}
