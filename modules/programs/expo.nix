{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.expo;
in

{
  options.my.programs.expo = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.react-native.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nodePackages_latest.expo-cli
    ];
  };
}
