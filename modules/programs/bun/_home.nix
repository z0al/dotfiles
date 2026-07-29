{ lib, config, ... }:

{
  config = {
    programs.bun.enable = lib.mkDefault config.presets.typescript.enable;
  };
}
