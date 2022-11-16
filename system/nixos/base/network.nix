{ _, ... }:

{
  networking.networkmanager.enable = true;
  users.users.${_.user}.extraGroups = [ "networkmanager" ];
}
