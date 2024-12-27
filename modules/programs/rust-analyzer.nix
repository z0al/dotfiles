{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.rust-analyzer;
in

{
  options.d.programs.rust-analyzer = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.presets.rust.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      rust-analyzer
    ];
  };
}
