{ config, lib, ... }:

let
  cfg = config.my.programs.kubectx;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.brews = [
      "kubectx"
    ];
  };
}
