{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.python;
in

{
  options.my.programs.python = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.python.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      python3
      python3.pkgs.pip
    ];
  };
}
