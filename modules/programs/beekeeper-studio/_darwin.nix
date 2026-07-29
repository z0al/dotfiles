{ config, lib, ... }:

let
  cfg = config.dot.programs.beekeeper-studio;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "beekeeper-studio"
    ];
  };
}
