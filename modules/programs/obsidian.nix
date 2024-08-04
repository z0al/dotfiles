{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.obsidian;
in

{
  options.d.programs.obsidian = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      obsidian
    ];
  };
}
