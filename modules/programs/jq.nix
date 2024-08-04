{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.jq;
in

{
  options.d.programs.jq = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      jq
    ];
  };
}
