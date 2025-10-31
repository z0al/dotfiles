{ config, lib, ... }:

let
  cfg = config.my.programs.zed;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "zed"
    ];
  };
}
