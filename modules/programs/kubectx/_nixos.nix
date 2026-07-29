{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.dot.programs.kubectx;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kubectx
    ];
  };
}
