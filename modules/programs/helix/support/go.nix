{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.presets.go;
in

{
  config.my.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      delve
      gopls
    ];
  };
}
