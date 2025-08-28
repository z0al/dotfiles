{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.watchman;
in

{
  options.my.programs.watchman = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.react-native.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      watchman
    ];
  };
}
