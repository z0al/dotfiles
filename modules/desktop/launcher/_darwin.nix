{ config, pkgs, lib, ... }:

let
  cfg = config.d.desktop.launcher;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "raycast"
    ];
  };
}
