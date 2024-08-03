{ config, lib, ... }:

let
  cfgKubectl = config.d.programs.kubectl;
in

{
  config = lib.mkIf cfgKubectl.enable {
    d.fs.persisted = {
      directories = [ "~/.kube" ];
    };
  };
}
