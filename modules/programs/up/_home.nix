{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.up;

  flake = "--flake ${cfg.flake}";
  target = if (cfg.target != "") then "--target ${cfg.target}" else "";
in

{
  options.programs.up = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };

    target = lib.mkOption {
      type = lib.types.str;
      default = "";
    };

    flake = lib.mkOption {
      type = lib.types.str;
      default = "${config.home.homeDirectory}/.dotfiles";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.writeScriptBin "up" (builtins.readFile ../../../bin/up))
    ];

    home.shellAliases = {
      up = "up ${flake} ${target}";
    };
  };
}
