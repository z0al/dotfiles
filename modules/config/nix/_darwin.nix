{ config, ... }:

{
  nix.gc = {
    user = config.my.user.name;
    interval.Day = 7;
  };

  services.nix-daemon.enable = true;
}
