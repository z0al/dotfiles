{ config, lib, user, ... }:

{
  imports = [
    ./keymap
    ./karabiner.nix
    ./shells.nix
  ];

  targets.darwin.currentHostDefaults = {
    "com.apple.controlcenter" = {
      BatteryShowPercentage = true;
    };
    "com.apple.finder" = {
      DisableAllAnimations = true;
    };
    "com.apple.Safari" = {
      IncludeDevelopMenu = true;
    };
  };
}
