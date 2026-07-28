{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.dot.programs.bat;
in

{
  config = lib.mkIf cfg.enable {
    environment.shellAliases = {
      cat = lib.getExe pkgs.bat;
    };
  };
}
