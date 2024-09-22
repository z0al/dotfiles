{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.black;
in

{
  options.d.programs.black = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.presets.python.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python3.pkgs.black
    ];
  };
}
