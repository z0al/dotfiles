{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.aws;
in

{
  options.d.programs.aws = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs.latest; [
      awscli2
    ];
  };
}
