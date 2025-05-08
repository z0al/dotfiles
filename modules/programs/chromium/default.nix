{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.chromium;
in

{
  options.d.programs.chromium = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      brave
    ];
  };
}
