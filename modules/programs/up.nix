{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.up;

  flake = "--flake ${cfg.flake}";
  target = if (cfg.target != "") then "--target ${cfg.target}" else "";
in

{
  options.d.programs.up = with lib;
    {
      enable = mkOption {
        type = types.bool;
        default = true;
      };

      target = mkOption {
        type = types.str;
        default = "";
      };

      flake = mkOption {
        type = types.str;
        default = "${config.my.osUser.home}/.dotfiles";
      };
    };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      (writeScriptBin "up" (builtins.readFile ../../bin/up))
    ];

    environment.shellAliases = {
      up = "up ${flake} ${target}";
    };
  };
}
