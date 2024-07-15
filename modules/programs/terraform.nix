{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.terraform;
in

{
  options.d.programs.terraform = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs.latest; [
      terraform
    ];
  };
}

