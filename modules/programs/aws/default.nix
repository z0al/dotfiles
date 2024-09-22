{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.aws;
in

{
  options.d.programs.aws = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.presets.devOps.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      awscli2
    ];
  };
}
