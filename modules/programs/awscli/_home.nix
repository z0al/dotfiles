{ lib, config, ... }:

{
  config = {
    programs.awscli.enable = lib.mkDefault config.presets.devOps.enable;
  };
}
