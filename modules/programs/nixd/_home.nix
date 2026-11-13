{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.nixd;
in

{
  options.programs.nixd.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.nixd ];
  };
}
