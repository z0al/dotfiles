{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.kubectl;
in

{
  options.programs.kubectl.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.presets.devOps.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.kubectl ];
  };
}
