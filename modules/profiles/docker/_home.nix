{ config, lib, ... }:

let
  cfg = config.profiles.docker;
in

{
  options.profiles.docker.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs.docker-cli.enable = lib.mkDefault true;
  };
}
