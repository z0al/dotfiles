{ lib, osConfig, ... }:

{
  config = {
    programs.awscli.enable = lib.mkDefault osConfig.my.presets.devOps.enable;
  };
}
