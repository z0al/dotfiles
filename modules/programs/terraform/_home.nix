{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.terraform;
in

{
  options.programs.terraform.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.presets.devOps.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.terraform ];
  };
}
