{ lib, osConfig, ... }:

{
  config = {
    programs.bun.enable = lib.mkDefault osConfig.my.presets.typescript.enable;
  };
}
