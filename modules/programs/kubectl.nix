{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.kubectl;
in

{
  options.my.programs.kubectl = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.devOps.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kubectl
    ];
  };
}
