{ config, lib, ... }:

let
  cfg = config.d.programs.direnv;
in

{
  config = lib.mkIf cfg.enable {
    d.fs.persisted = {
      directories = [ "~/.local/share/direnv" ];
    };
  };
}
