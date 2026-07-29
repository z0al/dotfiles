{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  cfg = config.programs.kubectl;
in

{
  options.programs.kubectl.enable = lib.mkOption {
    type = lib.types.bool;
    default = osConfig.my.presets.devOps.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.kubectl ];
  };
}
