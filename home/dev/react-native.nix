{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.dev.react-native;
in

{
  options.d.dev.react-native = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    d.dev.node.enable = true;

    home.packages = with pkgs; [
      android-studio
      nodePackages.expo-cli
      watchman
    ];
  };
}
