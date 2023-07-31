{ user, ... }:

{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  users.users.${user}.extraGroups = [ "docker" ];

  d.fs.persisted = {
    directories = [ "/var/lib/docker/overlay2" ];
  };
}
