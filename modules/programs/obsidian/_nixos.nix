{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.obsidian;
in

{
  config = lib.mkIf cfg.enable {
    my.programs.obsidian.package = pkgs.obsidian;
  };
}
