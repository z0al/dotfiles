{ config, lib, ... }:

let
  cfg = config.d.programs.kubectx;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.brews = [
      "kubectx"
    ];
  };
}
