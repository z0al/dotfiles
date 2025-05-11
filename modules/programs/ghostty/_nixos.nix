{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.ghostty;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      ghostty
    ];
  };
}
