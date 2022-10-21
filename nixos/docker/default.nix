{ _, ... }:

{
  users.users.${_.username}.extraGroups = [ "docker" ];

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };
}
