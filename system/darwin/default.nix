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
  d.scripts.activateSettings = ''
    # activateSettings -u will reload the settings from the database and apply them to the current session,
    # so we do not need to logout and login again to make the changes take effect.
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  my.hm.config = {
    targets.darwin.currentHostDefaults = {
      "com.apple.controlcenter" = {
        BatteryShowPercentage = true;
      };
    };
  };

  system.defaults.NSGlobalDomain = {
    AppleInterfaceStyle = "Dark";
    AppleMeasurementUnits = "Centimeters";
    AppleTemperatureUnit = "Celsius";
  };
}
