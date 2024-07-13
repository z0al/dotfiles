{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.inkscape;
in

{
  options.d.apps.inkscape = {
    enable = mkOption {
      type = types.bool;
      default = pkgs.stdenv.isLinux;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs.latest; [
      inkscape
    ];

    d.fs.persisted = {
      directories = [ ".config/inkscape" ];
    };
  };
}
