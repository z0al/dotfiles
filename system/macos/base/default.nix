{ pkgs, ... }:

{
  imports = [
    ./apps.nix
    ./dock.nix
    ./finder.nix
    ./login.nix
    ./touchpad.nix
  ];

  system.defaults.NSGlobalDomain = {
    AppleInterfaceStyle = "Dark";
    AppleMeasurementUnits = "Centimeters";
    AppleTemperatureUnit = "Celsius";
  };
}
