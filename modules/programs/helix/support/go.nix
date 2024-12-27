{ config, pkgs, lib, ... }:

let
  cfg = config.d.presets.go;
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      delve
      gopls
    ];
  };
}
