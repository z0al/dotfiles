{ config, pkgs, lib, ... }:

let
  cfg = config.d.desktop.launcher;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      raycast
    ];
  };
}
