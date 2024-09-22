{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.kubelogin;
in

{
  options.d.programs.kubelogin = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.presets.devOps.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      kubelogin-oidc
    ];
  };
}
