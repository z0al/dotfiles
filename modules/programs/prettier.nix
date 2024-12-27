{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.prettier;
in

{
  options.d.programs.prettier = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      nodePackages.prettier
    ];
  };
}
