{
  my.osUser.extraGroups = [ "networkmanager" ];

  networking = {
    networkmanager.enable = true;

    # Causes frequent "Your connection was interrupted" errors
    enableIPv6 = false;
  };

  d.fs.persisted = {
    directories = [ "/etc/NetworkManager/system-connections" ];
  };
}
