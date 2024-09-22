{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.watchman;
in

{
  options.d.programs.watchman = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.presets.react-native.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      watchman
    ];
  };
}
