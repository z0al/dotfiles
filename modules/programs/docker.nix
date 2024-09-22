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
    ];

    environment.variables = {
      DOCKER_HOST = "unix://${colimaHome}/default/docker.sock";
    };

    # my.user = {
    #   xdg.configFile."colima/default/colima.yaml".source = toYAML "colima.yaml" {
    #     cpu = 8;
    #     memory = 12;
    #     disk = 120;
    #     runtime = "docker";
    #     autoActivate = true;
    #   };
    # };
  };
}
