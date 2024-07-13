{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.cli.kubectl;
in

{
  options.d.cli.kubectl = {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs.latest; [
      kubectl
      kubelogin-oidc
      kubectx
    ];

    programs.starship.settings = {
      kubernetes.disabled = false;
    };

    d.fs.persisted = {
      directories = [ ".kube" ];
    };
  };
}
