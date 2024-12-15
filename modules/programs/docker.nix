{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.docker;

  cfgHome = config.my.hm.config.xdg.configHome;

  wrapped = with pkgs.unstable;
    let
      runtime = lib.getExe colima;
      docker = lib.getExe docker-client;

      wrapper = writeShellScriptBin "docker" ''
        set -uo pipefail

        { err=$(exec ${docker} "$@" 2>&1 1>&$out); } {out}>&1

        if [[ $err =~ "Is the docker daemon running?" ]]; then
          ${runtime} start \
            --cpu 8 \
            --memory 12 \
            --disk 120 \
            --save-config=false &> /dev/null
          exec ${docker} "$@"
        elif [[ $err ]]; then
          >&2 echo "$err"
          exit 1
        fi
      '';
    in
    symlinkJoin {
      name = "docker";
      paths = [
        wrapper
        docker-client
      ];
    };
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
      wrapped
      docker-compose
      docker-credential-helpers
    ];

    environment.variables = {
      COLIMA_SAVE_CONFIG = "0";
      DOCKER_HOST = "unix://${cfgHome}/colima/default/docker.sock";
    };
  };
}
