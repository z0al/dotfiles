{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  cfg = config.programs.stylua;
in

{
  options.programs.stylua.enable = lib.mkOption {
    type = lib.types.bool;
    default = osConfig.my.presets.lua.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.stylua ];
  };
}
