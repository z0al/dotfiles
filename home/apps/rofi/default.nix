{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.rofi;
in

{
  options.d.apps.rofi = {
    enable = mkOption {
      type = types.bool;
      default = pkgs.stdenv.isLinux;
    };
  };

  config = mkIf cfg.enable {
    home.packages = [
      pkgs.rofi
    ];
  };
}
