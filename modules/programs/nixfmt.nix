{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.nixfmt;
in

{
  options.my.programs.nixfmt = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.nix.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ nixfmt ];
  };
}
