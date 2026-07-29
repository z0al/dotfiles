{ config, lib, ... }:

let
  cfg = config.dot.programs.docker-cli;
in

{
  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      autoPrune.enable = true;
    };

    my.user.extraGroups = [ "docker" ];
  };
}
