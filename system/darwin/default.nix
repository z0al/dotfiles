{
  imports = [
    ../.
    ./dock.nix
    ./finder.nix
    ./keyboard.nix
    ./login.nix
    ./pkgs.nix
    ./safari.nix
    ./trackpad.nix
  ];

  system.stateVersion = 5;

  my.hm.config = {
    targets.darwin.currentHostDefaults = {
      "com.apple.controlcenter" = {
        BatteryShowPercentage = true;
      };
    };
  };

  plist.appearance.theme = "dark";

  system.defaults.NSGlobalDomain = {
    AppleMeasurementUnits = "Centimeters";
    AppleTemperatureUnit = "Celsius";
  };
}
