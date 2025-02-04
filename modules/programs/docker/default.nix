{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.docker;
in

{
  options.d.programs.docker = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.presets.devOps.enable;
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
