{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.brave;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.brave
    ];

    environment.etc."brave/policies/managed/default.json" = {
      text = builtins.toJSON cfg.profile;
    };
  };
}
