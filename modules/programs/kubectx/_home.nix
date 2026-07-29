{ lib, osConfig, ... }:

{
  options.programs.kubectx.enable = lib.mkOption {
    type = lib.types.bool;
    default = osConfig.my.presets.devOps.enable;
  };
}
