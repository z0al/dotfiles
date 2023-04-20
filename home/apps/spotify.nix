{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.spotify;
in

{
  options.d.apps.spotify = {
    enable = mkOption {
      type = types.bool;
      default = pkgs.stdenv.isLinux;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}
