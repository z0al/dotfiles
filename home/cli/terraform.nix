{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.cli.terraform;
in

{
  options.d.cli.terraform = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      terraform
    ];
  };
}
