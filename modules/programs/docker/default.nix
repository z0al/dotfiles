{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.docker;
in

{
  options.d.programs.docker = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.profiles.dev.ops.enable;
    };
  };
}
