{ config, lib, ... }:

let
  cfg = config.dot.programs.parallels;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "parallels"
    ];
  };
}
