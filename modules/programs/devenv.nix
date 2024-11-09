{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.devenv;
in

{
  options.d.programs.devenv = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs.unstable; [ devenv ];
  };
}
