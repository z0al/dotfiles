{ pkgs, user, ... }:

{
  imports = [
    ./yabai
    ./dock.nix
    ./finder.nix
    ./login.nix
    ./pkgs.nix
    ./trackpad.nix
  ];

  system.stateVersion = 4;

  # User that runs the garbage collector.
  nix.gc.user = user;

  d.hm = [
    { imports = [ ./hm ]; }
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
