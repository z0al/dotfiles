{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.nixpkgs-fmt;
in

{
  options.d.programs.nixpkgs-fmt = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.profiles.dev.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ nixpkgs-fmt ];
  };
}
