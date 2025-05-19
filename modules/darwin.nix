{ config, lib, ... }:

let
  darwinModules = lib.fileset.toList (
    lib.fileset.fileFilter
      (file: file.name == "_darwin.nix")
      ./.
  );
in

{
  imports = darwinModules ++ [
    ./shared.nix
  ];

  system.primaryUser = config.my.user.name;
  system.stateVersion = config.system.maxStateVersion;

  # Random settings that don't fit anywhere else
  system.defaults.CustomUserPreferences = {
    "com.apple.controlcenter" = {
      BatteryShowPercentage = true;
    };

    # Require password immediately after sleep or screen saver begins
    "com.apple.screensaver" = {
      askForPassword = 1;
      askForPasswordDelay = 0;
    };

    "com.apple.loginwindow" = {
      GuestEnabled = false;
    };
  };
}
