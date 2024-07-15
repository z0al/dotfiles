{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.docker;
in

{

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      autoPrune.enable = true;
    };

    environment.systemPackages = with pkgs.latest; [
      docker-compose
    ];

    my.osUser.extraGroups = [ "docker" ];

    d.fs.persisted = {
      directories = [ "/var/lib/docker" ];
    };
  };
}
