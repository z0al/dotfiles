{ config, lib, ... }:

{
  options.my.programs.kubectx = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.devOps.enable;
    };
  };
}
