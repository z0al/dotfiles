{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.programs.docker-cli;
in

{
  config.environment.systemPackages = lib.mkIf cfg.enable [
    pkgs.docker-client
  ];

  config.my.services.colima = {
    enable = cfg.enable;

    profiles.default = {
      isActive = true;
      isService = true;
      setDockerHost = true;
      settings = {
        memory = 8;
        disk = 256;
      };
    };
  };
}
