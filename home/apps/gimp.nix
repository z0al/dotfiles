{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.gimp;
in

{
  options.d.apps.gimp = {
    enable = mkOption {
      type = types.bool;
      default = pkgs.stdenv.isLinux;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      gimp
    ];
  };
}
