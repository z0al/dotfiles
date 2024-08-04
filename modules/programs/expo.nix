{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.expo;
in

{
  options.d.programs.expo = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.profiles.dev.react-native.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nodePackages.expo-cli
    ];
  };
}
