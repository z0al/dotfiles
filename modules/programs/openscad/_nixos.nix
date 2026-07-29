{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.dot.programs.openscad;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      openscad
    ];
  };
}
