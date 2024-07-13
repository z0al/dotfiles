{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.obsidian;
in

{
  options.d.apps.obsidian = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs.latest; [
      obsidian
    ];

    d.fs.persisted = {
      directories = [ ".config/obsidian" ];
    };
  };
}
