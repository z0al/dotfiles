{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.shfmt;
in

{
  options.d.programs.shfmt = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.profiles.dev.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      shfmt
    ];
  };
}
