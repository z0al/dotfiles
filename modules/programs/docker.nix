{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.docker;

  colimaHome = "${config.my.user.xdg.configHome}/colima";
in

{
  options.d.programs.docker = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.presets.devOps.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs.unstable; [
      colima
      docker-client
      docker-compose
      docker-credential-helpers

      # docker-up command
      (pkgs.writeScriptBin "docker-up" ''
        ${lib.getExe colima} start --cpu 8 --memory 12 --disk 120
      '')
    ];

    environment.variables = {
      DOCKER_HOST = "unix://${colimaHome}/default/docker.sock";
    };
  };
}
