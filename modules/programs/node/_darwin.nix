{ config, lib, ... }:

let
  cfg = config.dot.programs.node;
in

{
  config = lib.mkIf cfg.enable {
    environment.shellAliases = {
      nvm = "fnm";
    };
  };
}
