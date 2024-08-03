{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.fd;
in

{
  options.d.programs.fd = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      fd
    ];
  };
}
