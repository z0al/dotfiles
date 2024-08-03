{ config, lib, ... }:

let
  cfg = config.d.programs.zoxide;
in

{
  config = lib.mkIf cfg.enable {
    d.fs.persisted = {
      directories = [ "~/.local/share/zoxide" ];
    };
  };
}
