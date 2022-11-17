{ user, ... }:

{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  users.users.${user}.extraGroups = [ "docker" ];
}
