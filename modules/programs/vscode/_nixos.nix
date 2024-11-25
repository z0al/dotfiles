{ config, lib, ... }:

let
  cfg = config.d.programs.vscode;
in

{
  config = lib.mkIf cfg.enable {
    d.fs.persisted = lib.mkIf cfg.enable {
      directories = [ "~/.config/Code/User" ];
    };
  };
}
