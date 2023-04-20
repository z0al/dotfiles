{ user, ... }:

{
  networking.networkmanager.enable = true;
  users.users.${user}.extraGroups = [ "networkmanager" ];
}
