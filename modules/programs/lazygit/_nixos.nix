{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.dot.programs.git;
in

{
  config = lib.mkIf cfg.enable {
    environment.shellAliases = {
      lz = lib.getExe pkgs.lazygit;
    };
  };
}
