{ lib, ... }:

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

  system.stateVersion = 5;

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
      # Allow users to login to the machine as guests using the Guest
      # account. Default is true.
      GuestEnabled = false;

      # Hides the Restart button on the login screen. Default is false.
      RestartDisabled = true;

      # Hides the Shut Down button on the login screen. Default is false.
      ShutDownDisabled = true;

      # If set to true, the Power Off menu item will be disabled when the
      # user is logged in. Default is false.
      PowerOffDisabledWhileLoggedIn = true;

    };
  };
}
