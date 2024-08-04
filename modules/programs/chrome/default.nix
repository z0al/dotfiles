{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.chrome;
in

{
  options.d.programs.chrome = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
