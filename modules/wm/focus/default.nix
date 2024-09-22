{ config, pkgs, lib, ... }:

let
  cfg = config.d.wm.focus;
in

{
  options.d.wm.focus = with lib; {
    mode = mkOption {
      type = types.enum [
        "click"
        "sloppy"
      ];

      default = "sloppy";
    };
  };
}
