{ config, lib, ... }:

let
  cfg = config.d.programs.chrome;
in

{
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      google-chrome
    ];
  };
}
