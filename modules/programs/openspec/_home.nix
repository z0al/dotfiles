{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.openspec;
in

{
  options.programs.openspec.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.openspec ];
  };
}
