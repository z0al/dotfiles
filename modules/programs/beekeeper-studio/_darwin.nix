{ config, lib, ... }:

let
  cfg = config.my.programs.beekeeper-studio;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "beekeeper-studio"
    ];
  };
}
