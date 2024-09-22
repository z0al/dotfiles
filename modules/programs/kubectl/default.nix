{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.kubectl;
in

{
  options.d.programs.kubectl = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.presets.devOps.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kubectl
    ];
  };
}
