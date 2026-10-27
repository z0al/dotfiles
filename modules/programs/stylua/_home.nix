{
  config,
  lib,
  ...
}:

{
  programs.stylua = {
    enable = lib.mkDefault config.presets.lua.enable;
  };
}
