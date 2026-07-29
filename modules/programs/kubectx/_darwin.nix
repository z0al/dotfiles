{ config, lib, ... }:

let
  cfg = config.dot.programs.kubectx;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.brews = [
      "kubectx"
    ];
  };
}
