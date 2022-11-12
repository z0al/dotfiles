{ config, pkgs, ... }:

{
  users.users.z0al = {
    description = "Ahmed T. Ali";
  };

  home-manager.users.z0al.home = {
    username = "z0al";
    inherit (config.system) stateVersion;
  };
}
