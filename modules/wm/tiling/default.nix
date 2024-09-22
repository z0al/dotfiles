{ config, pkgs, lib, ... }:

let
  cfg = config.d.wm.tiling;
in

{
  options.d.wm.tiling = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };
}
