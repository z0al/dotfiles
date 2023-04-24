{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.zoom;
in

{
  options = {
    d.apps.zoom = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.zoom-us ];
  };
}
