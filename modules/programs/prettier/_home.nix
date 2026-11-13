{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.prettier;
in

{
  options.programs.prettier.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.prettier ];
  };
}
