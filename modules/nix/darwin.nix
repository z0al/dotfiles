{ user, ... }:

{
  nix.gc = {
    inherit user;
    interval.Day = 7;
  };

  services.nix-daemon.enable = true;
}
