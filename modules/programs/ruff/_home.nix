{ lib, config, ... }:

{
  config = {
    programs.ruff.enable = lib.mkDefault config.presets.python.enable;
  };
}
