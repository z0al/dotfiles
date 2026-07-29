{ config, lib, ... }:

let
  cfg = config.my.programs.parallels;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "parallels"
    ];
  };
}
