{ config, lib, ... }:

{
  options.d.programs.kubectx = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.presets.devOps.enable;
    };
  };
}
