{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.prettier;
in

{
  options.d.programs.prettier = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.profiles.dev.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs.unstable; [
      nodePackages.prettier
    ];
  };
}
