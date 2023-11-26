{ pkgs, user, ... }:

{
  imports = [
    ./yabai
    ./dock.nix
    ./finder.nix
    ./login.nix
    ./pkgs.nix
    ./safari.nix
    ./trackpad.nix
  ];

  system.stateVersion = 4;

  # User that runs the garbage collector.
  nix.gc.user = user;
  services.nix-daemon = {
    enable = true;
  };

  d.hm = [
    { imports = [ ./hm ]; }
    {
      targets.darwin.currentHostDefaults = {
        "com.apple.controlcenter" = {
          BatteryShowPercentage = true;
        };
      };
    }
  ];

  system.defaults.NSGlobalDomain = {
    AppleInterfaceStyle = "Dark";
    AppleMeasurementUnits = "Centimeters";
    AppleTemperatureUnit = "Celsius";
  };
}
