{ config, lib, ... }:

let
  cfg = config.my.programs.claude;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "claude"
    ];
  };
}
