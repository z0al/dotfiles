{ config, pkgs, lib, ... }:

let
  cfg = config.d.windowManager.tiling;
in

{
  options.d.windowManager.tiling = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
