{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.python;
in

{
  options.d.programs.python = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.presets.python.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python3
      python3.pkgs.pip
    ];
  };
}
