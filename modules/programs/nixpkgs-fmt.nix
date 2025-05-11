{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.nixpkgs-fmt;
in

{
  options.my.programs.nixpkgs-fmt = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.nix.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ nixpkgs-fmt ];
  };
}
