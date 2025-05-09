{
  imports = [
    ../.
    ./finder.nix
    ./login.nix
    ./pkgs.nix
    ./safari.nix
    ./trackpad.nix
  ];

  my.hm.config = {
    targets.darwin.currentHostDefaults = {
      "com.apple.controlcenter" = {
        BatteryShowPercentage = true;
      };
    };
  };
}
