{ pkgs, user, ... }:

{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  environment.systemPackages = with pkgs.latest; [
    docker-compose
  ];

  users.users.${user}.extraGroups = [ "docker" ];

  d.fs.persisted = {
    directories = [ "/var/lib/docker/overlay2" ];
  };
}
