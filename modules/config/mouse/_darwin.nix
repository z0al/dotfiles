{ config, lib, ... }:

let
  cfgTrackpad = config.d.trackpad;
in

{
  config = lib.mkIf cfgTrackpad.naturalScrolling {
    homebrew.casks = [
      "scroll-reverser"
    ];

    system.defaults.CustomUserPreferences = {
      "com.pilotmoon.scroll-reverser" = {
        HideIcon = true;
        SUEnableAutomaticChecks = false;

        ReverseMouse = true;
        ReverseTrackpad = false;

        InvertScrollingOn = true;
        ReverseY = true;
        ReverseX = false;
      };
    };
  };
}
