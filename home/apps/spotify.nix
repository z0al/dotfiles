{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.spotify;
in

{
  options.d.apps.spotify = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      spotify
    ];

    d.autostart.spotify = {
      exec = "spotify";
    };

    d.fs.persisted = {
      directories = [
        ".config/spotify"
        ".cache/spotify"
      ];
    };
  };
}
