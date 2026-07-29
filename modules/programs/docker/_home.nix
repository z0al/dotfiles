{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  cfg = config.programs.docker-cli;
in

{
  config = {
    programs.docker-cli.enable = lib.mkDefault osConfig.my.presets.devOps.enable;

    home.packages = lib.mkIf cfg.enable [
      pkgs.docker-buildx
      pkgs.docker-compose
      pkgs.docker-credential-helpers
    ];
  };
}
