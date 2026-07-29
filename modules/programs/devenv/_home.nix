{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.devenv;
in

{
  options.programs.devenv.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.devenv ];
  };
}
