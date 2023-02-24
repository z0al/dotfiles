{ pkgs, user, ... }:

{
  imports = [
    ./apps.nix
    ./dock.nix
    ./finder.nix
    ./login.nix
    ./touchpad.nix
  ];

  system.stateVersion = 4;

  # User that runs the garbage collector.
  nix.gc.user = user;

  home-manager.users.${user}.imports = [
    ./hm.nix
  ];

  services.nix-daemon = {
    enable = true;
  };

  system.defaults.NSGlobalDomain = {
    AppleInterfaceStyle = "Dark";
    AppleMeasurementUnits = "Centimeters";
    AppleTemperatureUnit = "Celsius";
  };
}
