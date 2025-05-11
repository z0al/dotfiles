{ config, lib, ... }:

let
  cfg = config.my.desktop.launcher;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "raycast"
    ];
  };
}
