{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.shfmt;
in

{
  options.programs.shfmt.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.shfmt ];
  };
}
