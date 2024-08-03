{ config, lib, ... }:

let
  cfg = config.d.programs.kubectl;
in

{
  config = lib.mkIf cfg.enable {
    d.fs.persisted = {
      directories = [ "~/.kube" ];
    };
  };
}
