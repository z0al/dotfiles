{ lib, config, ... }:

{
  options.programs.kubectx.enable = lib.mkOption {
    type = lib.types.bool;
    default = config.presets.devOps.enable;
  };
}
