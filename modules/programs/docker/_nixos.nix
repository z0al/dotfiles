{ config, lib, ... }:

let
  cfg = config.d.programs.docker;
in

{
  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      autoPrune.enable = true;
    };

    my.user.extraGroups = [ "docker" ];
  };
}
