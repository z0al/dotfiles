{ config, pkgs, lib, ... }:

let
  cfg = config.d.profiles.dev.go;
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs.unstable; [
      delve
      gopls
    ];
  };
}
