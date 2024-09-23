{ config, pkgs, lib, ... }:

let
  cfg = config.d.windowManager.focus;
in

{
  options.d.windowManager.focus = with lib; {
    mode = mkOption {
      type = types.enum [
        "click"
        "sloppy"
      ];

      default = "click";
    };
  };
}
