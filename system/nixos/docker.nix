{ _, ... }:

{
  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  users.users.${_.user}.extraGroups = [ "docker" ];
}
