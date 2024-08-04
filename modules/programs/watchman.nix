{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.watchman;
in

{
  options.d.programs.watchman = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.profiles.dev.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      watchman
    ];
  };
}
