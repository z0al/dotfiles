{ config, lib, ... }:

let
  cfg = config.my.programs.node;
in

{
  config = lib.mkIf cfg.enable {
    environment.shellAliases = {
      nvm = "fnm";
    };
  };
}
