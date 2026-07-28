{ lib, osConfig, ... }:

{
  config = {
    programs.ruff.enable = lib.mkDefault osConfig.my.presets.python.enable;
  };
}
