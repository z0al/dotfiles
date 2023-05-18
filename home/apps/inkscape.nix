{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.inkscape;
in

{
  options.d.apps.inkscape = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      inkscape
    ];

    d.fs.persisted = {
      directories = [ ".config/inkscape" ];
    };
  };
}
