{ config, lib, ... }:

let
  cfg = config.d.programs.aws;
in

{
  config = lib.mkIf cfg.enable {
    d.fs.persisted = {
      directories = [ "~/.aws" ];
    };
  };
}
