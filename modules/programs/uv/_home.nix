{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.uv;
in

{
  config = {
    programs.uv.enable = lib.mkDefault config.presets.python.enable;

    programs.fish.plugins = lib.mkIf cfg.enable (
      with pkgs.fishPlugins;
      [
        {
          name = "autopy";
          src = autopy.src;
        }
      ]
    );
  };
}
