{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.chromium;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.google-chrome
    ];

    environment.etc."opt/chrome/policies/managed/default.json" = {
      text = builtins.toJSON cfg.profile;
    };
  };
}
