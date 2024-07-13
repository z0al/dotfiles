{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.cli.aws;
in

{
  options.d.cli.aws = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs.latest; [
      awscli2
    ];

    d.fs.persisted = {
      directories = [ ".aws" ];
    };
  };
}
