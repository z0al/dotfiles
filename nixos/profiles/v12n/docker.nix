{
  users.users.z0al.extraGroups = [ "docker" ];

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };
}
