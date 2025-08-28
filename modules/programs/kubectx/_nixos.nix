{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.kubectx;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kubectx
    ];
  };
}
