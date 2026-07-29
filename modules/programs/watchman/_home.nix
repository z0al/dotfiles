{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.watchman;
in

{
  options.programs.watchman.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.presets.react-native.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.watchman ];
  };
}
