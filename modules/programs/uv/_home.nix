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
