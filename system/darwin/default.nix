{
  imports = [
    ../.
    ./finder.nix
    ./login.nix
    ./pkgs.nix
  ];

  my.hm.config = {
    targets.darwin.currentHostDefaults = {
      "com.apple.controlcenter" = {
        BatteryShowPercentage = true;
      };
    };
  };
}
