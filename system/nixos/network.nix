{ user, ... }:

{
  users.users.${user}.extraGroups = [ "networkmanager" ];

  networking = {
    networkmanager.enable = true;

    # Causes frequent "Your connection was interrupted" errors
    enableIPv6 = false;
  };
}
