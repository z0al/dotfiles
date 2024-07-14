{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  environment.systemPackages = with pkgs.latest; [
    docker-compose
  ];

  my.osUser.extraGroups = [ "docker" ];

  d.fs.persisted = {
    directories = [ "/var/lib/docker/overlay2" ];
  };
}
