{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.openscad;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      openscad
    ];
  };
}
