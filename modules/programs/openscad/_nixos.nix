{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.openscad;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      openscad
    ];
  };
}
