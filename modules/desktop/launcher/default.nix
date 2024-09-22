{ config, pkgs, lib, ... }:

let
  cfg = config.d.desktop.launcher;
in

{
  options.d.desktop.launcher = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
