{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.docker;
in

{
  options.my.programs.docker = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.devOps.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      docker-buildx
      docker-compose
      docker-credential-helpers
    ];
  };
}
