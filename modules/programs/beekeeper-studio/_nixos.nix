{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.dot.programs.beekeeper-studio;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.beekeeper-studio
    ];
  };
}
