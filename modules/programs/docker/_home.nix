{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.docker-cli;
in

{
  config = {
    home.packages = lib.mkIf cfg.enable [
      pkgs.docker-buildx
      pkgs.docker-compose
      pkgs.docker-credential-helpers
    ];
  };
}
