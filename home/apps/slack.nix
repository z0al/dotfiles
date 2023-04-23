{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.slack;
in

{
  options = {
    d.apps.slack = {
      enable = mkOption {
        type = types.bool;
        default = false;
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ pkgs.slack ];

    d.autostart.slack = {
      exec = "slack -u";
    };
  };
}
