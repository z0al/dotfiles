{ config, ... }:

{
  nix.gc = {
    user = config.d.user.name;
    interval.Day = 7;
  };

  services.nix-daemon.enable = true;
}
