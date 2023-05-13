{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.obsidian;
in

{
  options.d.apps.obsidian = {
    enable = mkOption {
      type = types.bool;
      default = pkgs.stdenv.isLinux;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      obsidian
    ];

    d.fs.persisted = {
      files = [ ".config/obsidian/obsidian.json" ];
      directories = [ ".config/obsidian/Local Storage" ];
    };
  };
}
